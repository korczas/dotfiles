---
name: dump-conversation
description: This skill should be used when the user asks to "dump", "save", "export", or "capture" the conversation (or a portion of it) to a file — e.g. "save our chat from X till now to a file", "dump this conversation", "export the part about Y for a blog post". Writes TWO files: a clean reformatted summary and a verbatim prompt/answer transcript.
version: 1.1.0
---

# Dump Conversation

Save part or all of the current conversation for later reuse (blog drafts, notes,
documentation source material). **Always produce two files** — a reformatted **summary**
and an **exact log** — so the user has both the polished version and the raw record.

## When this applies

The user asks to persist the conversation, e.g.:
- "save our conversation from the X part till now to a file"
- "dump this conversation", "export our chat", "capture this for a blog article"
- "save the part about Y to a file"

## How to do it

### 1. Determine scope
Identify which span of the conversation to capture:
- An explicit anchor ("from the ELI5 part till now", "the last 3 questions") → start there.
- "this conversation" / "our chat" with no anchor → the whole conversation.
If the anchor is ambiguous, make a reasonable choice and state it; only ask if genuinely unsure.

### 2. Produce BOTH versions

Always write two files covering the same scope:

**A) Summary** (`<topic>-summary.md`) — clean, article-ready notes:
- Group the Q&A into logical **sections with headings**, in conversation order.
- Convert questions into section titles or short block-quoted prompts; keep answers as prose.
- **Preserve all substance verbatim in meaning**: numbers, formulas, tables, code references
  (`file.py:line`), commands, and recommendations. Never invent or "improve" facts.
- Keep tables and code blocks as tables and code blocks.
- Add a short intro paragraph giving context, and any raw data/log the discussion referenced.

**B) Exact log** (`<topic>-log.md`) — the verbatim transcript:
- Reproduce each exchange **word-for-word** in order: the user's prompt, then your answer.
- Use clear delimiters, e.g. `## User` / `## Assistant` headings (or `> **User:**` blocks)
  per turn. Keep all original markdown, tables, and code blocks intact.
- Do **not** summarize, trim, paraphrase, or reorder. This is the raw record.
- Include `<system-reminder>`/tool noise only if the user asks; by default keep it to the
  human-visible prompts and answers.

### 3. Choose the file location
- Default to a `notes/` folder at the **project root**, creating it if needed.
- Base filename: descriptive `kebab-case` derived from the topic (e.g. `diffusion-metrics-eli5`),
  with the two suffixes `-summary.md` and `-log.md`.
- Keep them **out of** formal `docs/` unless the user says it's documentation.
- If the user names a path or folder, honor it (apply the two suffixes there).

### 4. Write and confirm
- Use the Write tool to create **both** files.
- Report both paths and give a one-line summary of the sections/turns captured.
- Offer light follow-ups (add a title/intro for a standalone post, include tool/system noise
  in the log, append more of the conversation later).

## Notes
- This captures the *visible* conversation content you have in context — you are reconstructing
  from the dialogue, not reading a hidden transcript log.
- Faithfulness over polish: if unsure whether a detail was stated, leave it out rather than guess.
- For a session-wide structured report (decisions, files changed, next steps) rather than a
  topic dump, a dedicated session-report tool may fit better — mention it only if the user
  seems to want that instead.
