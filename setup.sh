#!/usr/bin/env bash

# Создает виртуальное окружение .venv, устанавливает зависимости и обновляет PATH для mkdocs

echo "------ Setup Script for virtual environment and mkdocs ------"

# Определяем ОС для выбора пути (bin или Scripts)
OS_TYPE="Unknown"
unameOut="$(uname -s 2>/dev/null)"
case "${unameOut}" in
    Linux*)     OS_TYPE=Linux;;
    Darwin*)    OS_TYPE=Mac;;
    CYGWIN*|MINGW*|MSYS*) OS_TYPE=Windows;;
    *)          OS_TYPE="Unknown";;
esac
echo "Detected OS: $OS_TYPE"

# Проверяем наличие Python 3
echo "Checking for Python..."
PYTHON=""
if command -v python3 &>/dev/null; then
    PYTHON=python3
elif command -v python &>/dev/null; then
    PYTHON=python
elif command -v py &>/dev/null; then
    PYTHON="py -3"
else
    echo "ERROR: Python 3 not found on PATH. Please install Python 3." >&2
    exit 1
fi

# Создаем виртуальное окружение, если его нет
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment in .venv..."
    $PYTHON -m venv .venv
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to create virtual environment." >&2
        exit 1
    fi
else
    echo "Virtual environment .venv already exists."
fi

# Определяем команды pip и mkdocs внутри .venv
if [ "$OS_TYPE" = "Windows" ]; then
    PIP_CMD=".venv/Scripts/pip"
    MKDOCS_CMD=".venv/Scripts/mkdocs"
else
    PIP_CMD=".venv/bin/pip"
    MKDOCS_CMD=".venv/bin/mkdocs"
fi

# Проверяем наличие pip в виртуальном окружении
if [ ! -f "$PIP_CMD" ]; then
    echo "ERROR: pip not found in virtual environment." >&2
    exit 1
fi

# Обновляем pip
echo "Upgrading pip..."
$PIP_CMD install --upgrade pip

# Устанавливаем зависимости из requirements.txt, если файл существует
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    $PIP_CMD install -r requirements.txt
else
    echo "requirements.txt not found. Skipping dependency installation."
fi

# Устанавливаем mkdocs и плагины, если они не указаны в requirements.txt
echo "Ensuring mkdocs and its plugins are installed..."
inst_list=()
for pkg in mkdocs mkdocs-material mkdocs-rss-plugin; do
    need_install=1
    if [ -f "requirements.txt" ]; then
        if grep -qi "^${pkg}" requirements.txt; then
            need_install=0
        fi
    fi
    if [ $need_install -eq 1 ]; then
        inst_list+=($pkg)
    fi
done
if [ ${#inst_list[@]} -gt 0 ]; then
    echo "Installing: ${inst_list[@]}..."
    $PIP_CMD install "${inst_list[@]}"
else
    echo "mkdocs and plugins already listed in requirements.txt."
fi

# Добавляем .venv/bin (или .venv/Scripts) в PATH текущей сессии
echo "Updating PATH for current session..."
VENVPATH="$(cd .venv && pwd)"
if [ "$OS_TYPE" = "Windows" ]; then
    VENVPATH_SCRIPTS="$VENVPATH/Scripts"
    if [ -d "$VENVPATH_SCRIPTS" ]; then
        export PATH="$VENVPATH_SCRIPTS:$PATH"
    else
        VENVPATH_SCRIPTS="$VENVPATH/scripts"
        if [ -d "$VENVPATH_SCRIPTS" ]; then
            export PATH="$VENVPATH_SCRIPTS:$PATH"
        fi
    fi
else
    export PATH="$VENVPATH/bin:$PATH"
fi
echo "PATH updated. mkdocs should now be available."

# Проверяем доступность mkdocs
echo "Verifying mkdocs installation..."
if command -v mkdocs &>/dev/null; then
    MKDOCS_VER=$(mkdocs --version 2>/dev/null)
    echo "MkDocs is available: $MKDOCS_VER"
else
    echo "WARNING: mkdocs not found in PATH. Try activating the venv manually (e.g. 'source .venv/bin/activate')." >&2
fi

echo "----------------------------------------------------------------------"
echo "Setup complete. You can now run 'mkdocs build' (with .venv in PATH)."
echo "If mkdocs is not recognized, run 'source .venv/bin/activate' (Unix) or activate the venv on Windows (e.g. '.\\.venv\\Scripts\\Activate.ps1')."
echo "----------------------------------------------------------------------"
