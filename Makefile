# Define installation directories
PROFILE_DIR = /etc/profile.d
COMPLETION_DIR = /etc/bash_completion.d

# Define files to install
FILES = venv.bash
COMPLETION_FILE = venv-completion.sh


install: $(FILES) $(COMPLETION_FILE)
	@echo "Installing venv.bash to $(PROFILE_DIR)..."
	@cp $(FILES) $(PROFILE_DIR)
	@echo "Installing venv-completion.sh to $(COMPLETION_DIR)..."
	@cp $(COMPLETION_FILE) $(COMPLETION_DIR)
	@echo "Installation complete!"


clean:
	@echo "Cleaning up installed files..."
	@rm -f $(PROFILE_DIR)/venv.bash $(COMPLETION_DIR)/venv-completion.sh
	@echo "Clean up complete!"


# Default target
all: install

