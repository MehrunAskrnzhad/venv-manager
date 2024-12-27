function venv() {
    local VENV_DIR="$HOME/.local/virtualenvs"
    mkdir -p "$VENV_DIR"

    function usage() {
        echo "Usage: venv <command> [env_name]"
        echo
        echo "Commands:"
        echo "  create <env_name>      Create a new virtual environment."
        echo "  activate <env_name>    Activate an existing virtual environment."
        echo "  list                   List all available virtual environments."
        echo "  help                   Show this help message."
        echo
        echo "All virtual environments are stored in: $VENV_DIR"
    }

    case $1 in
        create|-c|c)
            if [ -z "$2" ]; then
                echo "Error: Missing environment name for 'create'."
                echo
                usage
                return 1
            fi
            local ENV_PATH="$VENV_DIR/$2"
            if [ -d "$ENV_PATH" ]; then
                echo "Virtualenv '$2' already exists in $VENV_DIR."
            else
                python3 -m venv "$ENV_PATH" && echo "Virtualenv '$2' created at $ENV_PATH."
            fi
            ;;
        activate|-a|a)
            if [ -z "$2" ]; then
                # if no names passed, activate the base env!
                local ENV_PATH="$VENV_DIR/base"
                if [ -d "$ENV_PATH" ]; then
                    source "$ENV_PATH/bin/activate"
                    echo "Activated The Base Virtual Environment."
                    return 0
                else
                    echo "The Base Virtual Environtmen Not Created Yet!"
                    echo "Create it with:"
                    echo "  venv create base"
                fi
            fi
            local ENV_PATH="$VENV_DIR/$2"
            if [ -d "$ENV_PATH" ]; then
                source "$ENV_PATH/bin/activate"
                echo "Activated virtualenv '$2'."
            else
                echo "Error: Virtualenv '$2' does not exist in $VENV_DIR."
                return 1
            fi
            ;;
        list|--list|-l|l)
            echo "Available virtualenvs in $VENV_DIR:"
            if [ -z "$(ls -A "$VENV_DIR")" ]; then
                echo "No virtualenvs found."
            else
                for env in "$VENV_DIR"/*; do
                    [ -d "$env" ] && echo "- $(basename "$env")"
                done
            fi
            ;;
        help|--help|-h)
            usage
            ;;
        *)
            usage
            return 1
            ;;
    esac
    unset usage
}
