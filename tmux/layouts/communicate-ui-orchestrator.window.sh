window_root "~/.repos/precisely/communicate-ui-orchestrator"

new_window "communicate-ui-orchestrator"

split_h 60
run_cmd "npm run start" 1
run_cmd "gfa" 2
select_pane 2
