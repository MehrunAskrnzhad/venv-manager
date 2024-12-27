# venv-manager
venv manager is a Python virtual environment manager written in Bash

## Requirements
- Bash
- Python
- Python `venv` package

## Installation

- first clone this repo :
```bash
git clone https://github.com/MehrunAskrnzhad/venv-manager.git
```

- then cd into the directory and run make with root privileges :
```bash
cd venv-manager
sudo make
```

## Usage
### **Creating Virtual Environments**:
you can create virtual environments with `create` command. like this :
```bash
venv create virtualenv_name
```
you can use `c` (or `-c`) in short for `create` (or `--create`) :
```bash
venv c virtualenv_name
```

### **List Virtual Environments**:
all created virtual environments are stored in `~/.local/virtualenvs` directory.
you can list all your virtual environments with the `list` command. like this :
```bash
venv list
```
you can also use `l` (or `-l`) in short for `list` (or `--list`) :
```bash
venv l
```

### **Activate Virtual Environments**:
you can activate a virtual environment with the `activate` command, like this :
```bash
venv activate virtualenv_name
```
and also there is the shorted command `a` (or `-a`) exists for `activate` (or `--activate`) :
```bash
venv a virtualenv_name
```
---
**NOTE**:
if there is no name passed as an option to `activate`, it will activate a virtual environment called `base` if you have created it before (there will be and option like this for `create` command in future!)
```bash
venv activate
```
---

## Uninstall
simply just go to repo's directory and run `make uninstall` with root privileges
```bash
sudo make uninstall
```

## TODO
- embed the uninstaller into the program
