#!/bin/bash
cat vscode_extensions_list.txt | xargs -n 1 code --install-extension
