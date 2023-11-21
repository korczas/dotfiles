# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "communicate"; then

  load_window "communicate-ui-orchestrator"
  load_window "communicate-ui-core"
  load_window "communicate-ui-header"
  load_window "communicate-block-designer"
  load_window "converse-ui"
  load_window "communicate-document-designer"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
