#!/bin/bash

_venv_completions() {
    local cur prev commands envs
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    commands="create activate list help --help -h -a -c a c"

    case "$prev" in
        create|activate|-a|-c|a|c)
            # For 'create' and 'activate', suggest environment names
            envs=$(ls -1 ~/.local/virtualenvs 2>/dev/null)
            COMPREPLY=( $(compgen -W "$envs" -- "$cur") )
            return
            ;;
        *)
            # For the main command, suggest top-level commands
            COMPREPLY=( $(compgen -W "$commands" -- "$cur") )
            return
            ;;
    esac
}

# Attach the completion function to the script
complete -F _venv_completions venv

