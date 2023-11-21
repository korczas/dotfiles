window_root "~/.repos/precisely/communicate-block-designer"

new_window "communicate-block-designer"

split_h 60
run_cmd "npm run serve:single-spa" 1
run_cmd "gfa" 2
select_pane 2
