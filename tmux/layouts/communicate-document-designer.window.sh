window_root "~/.repos/precisely/communicate-document-designer"

new_window "communicate-document-designer"

split_h 60
run_cmd "npm run serve:single-spa" 1
run_cmd "gfa" 2
select_pane 2
