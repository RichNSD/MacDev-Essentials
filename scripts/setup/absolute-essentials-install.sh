#!/bin/bash

# List of packages to check and install/update
PACKAGES=(
    "git:git"
    "gh:gh"
    "coreutils:coreutils"
)

# Function to print section headers
echo_section() {
    echo -e "\n=============================="
    echo "$1"
    echo -e "==============================\n"
}

# Function to check and install/update a package
check_and_install() {
    local package="$1"
    local brew_name="$2"  # Homebrew name (can be different from command name)

    if ! command -v "$package" &>/dev/null; then
        echo "$package not found. Installing via Homebrew..."
        brew install "$brew_name"
        INSTALLED_PACKAGES+=("$package")
    else
        echo "$package is already installed. Checking for updates..."
        brew upgrade "$brew_name" && UPDATED_PACKAGES+=("$package")
    fi
}

# Array to track installed or updated packages
INSTALLED_PACKAGES=()
UPDATED_PACKAGES=()

# Ensure Homebrew is installed
echo_section "Checking for Homebrew installation"
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    INSTALLED_PACKAGES+=("Homebrew")
else
    echo "Homebrew is already installed. Updating..."
    brew update
fi



# Iterate over the package list and process each
echo_section "Checking and installing required packages"
for entry in "${PACKAGES[@]}"; do
    IFS=":" read -r cmd brew_name <<< "$entry"
    check_and_install "$cmd" "$brew_name"
done

# Summary Output
echo_section "Installation Summary"
if [ ${#INSTALLED_PACKAGES[@]} -gt 0 ]; then
    echo "✅ Installed: ${INSTALLED_PACKAGES[*]}"
fi
if [ ${#UPDATED_PACKAGES[@]} -gt 0 ]; then
    echo "✅ Updated: ${UPDATED_PACKAGES[*]}"
fi
if [ ${#INSTALLED_PACKAGES[@]} -eq 0 ] && [ ${#UPDATED_PACKAGES[@]} -eq 0 ]; then
    echo "✅ No changes were necessary. Everything is already up to date."
fi
