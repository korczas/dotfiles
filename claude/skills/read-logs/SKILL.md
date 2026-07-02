---
name: read-logs
description: This skill should be used when the user asks to read, inspect, tail, summarize, search, or debug a log file — or any large text/output file — e.g. "read this log", "what went wrong in server.log", "summarize the run", "check the logs for errors", "why did this crash", "grep the log for timeouts". It exists to avoid loading huge logs into context: measure first, then extract only the relevant slices with shell tools so a question costs a few hundred tokens instead of tens of thousands.
version: 1.0.0
---

# Read Logs (token-efficient)

Log files are often huge and mostly repetitive. Loading one wholesale with the `Read` tool
(or `cat`) pulls every line into the context window and burns tokens — when usually only a
handful of lines answer the question. This skill's job is to **measure first, then extract
only what matters**, using standard shell tools. It is format-agnostic: it works for plain
app logs, timestamped/syslog-style logs, JSON-lines, CI output, stack traces, and structured
metric logs alike.

## Core rule

**Never `Read` or `cat` a log blindly.** Always size it up first, then pull targeted slices.
Report a compact summary plus the few exact lines that carry the answer — not big blocks.

## Workflow

### 1. Measure before reading (mandatory first step)
Always run these before anything else:

```
wc -l <file>
ls -lh <file>
```

If the file is small (roughly **< 500 lines / < 50 KB**), just `Read` it directly — this
skill is about *big* files. Otherwise continue below and do **not** read it whole.

### 2. Identify the format
Learn the line shape from a small sample:

```
head -n 20 <file>
```

Then pick tools to match:
- **JSON lines** → `jq` (e.g. `jq -r 'select(.level=="error") | .msg' <file>`); fall back to
  `grep` if `jq` is unavailable.
- **`key=value` / columnar** → `awk` or `grep -oE`.
- **Timestamped** → filter by a time window using a `grep`/`awk`/`sed` range on the timestamp.

### 3. Extraction toolbox
POSIX-first (these are always present). Prefer `rg`/`jq` when available, but the commands
below always work.

- **Recent state / outcome** (usually at the end):
  ```
  tail -n 30 <file>
  ```
- **Error / anomaly scan** — count first to gauge volume, then print:
  ```
  grep -c -iE "error|warn|fatal|traceback|exception|fail|panic|nan" <file>
  grep -niE "error|warn|fatal|traceback|exception|fail|panic|nan" <file> | head -n 40
  ```
- **Window around a hit** — get line numbers, then read just that region. Use `-A`/`-B`/`-C`
  context to capture multi-line entries like stack traces:
  ```
  grep -n "<pattern>" <file>
  sed -n '1200,1240p' <file>
  grep -n -C 5 "Traceback" <file>
  ```
  (Or `Read` with `offset`/`limit` for the same bounded range.)
- **Field / metric series** — pull one signal without the surrounding noise:
  ```
  grep -oE 'loss=[0-9.]+' <file>
  awk '{ print $1, $5 }' <file>
  ```
- **Sample a long uniform run** — see the trajectory without every line:
  ```
  awk 'NR % 100 == 0' <file>
  ```
- **Overview by cardinality** — summarize repetitive lines (top error types, status codes):
  ```
  grep -oE 'status=[0-9]+' <file> | sort | uniq -c | sort -rn
  ```
- **Compressed / rotated logs** — use the `z` variants:
  ```
  zcat <file>.gz | tail -n 30
  zgrep -c -iE "error" <file>.gz
  ```

### 4. Escalate narrowly
Start broad and cheap (counts, `head`, `tail`), then drill into a **bounded** range only
where the question points. Pull full context solely for the few lines that matter.

### 5. Report compactly
Summarize findings — counts, the key metrics, the specific evidence lines. Quote exact log
lines only when they carry the answer, and cite them as `file:line`. Do not paste large
blocks back to the user.

## Guardrails
- All commands here are **read-only**.
- If a pattern returns thousands of hits, **refine the pattern** rather than printing them.
- Watch for **multi-line entries** (stack traces) when windowing — add `-C` context.
- For `*.gz`/rotated logs use `zgrep`/`zcat`.

## Illustrative examples (format-agnostic)

**Plaintext app log** — "why did the service crash?"
```
wc -l app.log                              # e.g. 480,000 lines — do NOT read whole
tail -n 30 app.log                         # last events before exit
grep -n -C 5 -iE "fatal|panic|traceback" app.log | tail -n 40   # the failure + context
```

**JSON-lines log** — "what errors happened and how often?"
```
head -n 5 events.log                       # confirm it's JSON lines
jq -r 'select(.level=="error") | .code' events.log | sort | uniq -c | sort -rn
```

**`key=value` metric log** — "how did the metric trend?"
```
head -n 5 train.log                        # learn keys
grep -oE 'acc=[0-9.]+' train.log | tail -n 20   # recent trajectory, not all of it
```

Each follows the same flow: **measure → identify format → scan → window/extract → report**.
