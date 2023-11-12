#!/bin/zsh

# Function to update AWS credentials (Precisely aws app)
update-aws-credentials() {
    local clipboard_content=$(pbpaste)
    local pattern="^\[.*\][[:space:]]*aws_access_key_id=.*[[:space:]]*aws_secret_access_key=.*[[:space:]]*aws_session_token=.*"

    if [[ $clipboard_content =~ $pattern ]]; then
        # Replacing the first line with '[default]'
        local modified_content=$(echo "$clipboard_content" | sed '1s/.*/[default]/')

        # Overwriting the .aws/credentials file
        echo "$modified_content" > ~/.aws/credentials
        echo "AWS credentials updated successfully."
    else
        echo "Clipboard content does not match the expected pattern. Aborting."
        return 1
    fi
}
