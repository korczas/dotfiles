function open-git-origin() {
  # Get the git remote origin URL
  local remote_url=$(git config --get remote.origin.url)

  if [[ -z "$remote_url" ]]; then
    echo "No remote named 'origin' found."
    return 1
  fi

  # Check for SSH remote and convert it to HTTPS if necessary
  if [[ "$remote_url" == git@* ]]; then
    remote_url=${remote_url/git@/https://}
    remote_url=${remote_url/.com:/\.com/}
  fi

  # Check for other SSH formats (e.g., ssh://)
  remote_url=${remote_url/ssh:\/\//https:\/\/}

  # Open the URL in the default browser
  if command -v xdg-open &>/dev/null; then
    xdg-open "$remote_url"
  elif command -v open &>/dev/null; then
    open "$remote_url"
  else
    echo "Could not detect the web browser opener command."
    return 1
  fi
}
