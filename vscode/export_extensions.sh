#!/bin/bash
rm -f vscode_extensions_list.txt
code --list-extensions >> vscode_extensions_list.txt
