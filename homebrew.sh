#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

source bootstrap.sh

# Check for Homebrew
if test ! $(which brew)
then
    info "Installing Homebrew for you."

  # Install the correct homebrew for each OS type
    if test "$(uname)" = "Darwin"
    then
        if xcode-select -p &> /dev/null
        then
            if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
                success "Homebrew installed.\n"

                echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
                eval "$(/opt/homebrew/bin/brew shellenv)"

                info "Homebrew was added to path.\n"
            else
                fail "Homebrew install failed.\n"
                exit 1
            fi
        else
            xcode-select --install
            user "Requesting \"command line developer tools\" install"
            info "Run homebrew/install.sh again after xcode installation is completed"
            exit
        fi
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    then
        fail "Linux"
    fi
else
    info "Homebrew already installed"
fi


if ask_for_char "Press \"ENTER\" to install Brewfile packages (any other key to abort):"
then
    info "Installing brew bundle"

    if ask_for_char "Press \"ENTER\" if it's a HOST machine (any other key if it's VM guest):"
    then
        grep -v "VM ONLY" Brewfile > Brewfile.tmp
        info "Including \"VM OFF\" brew packages\n"
    else
        grep -v "VM OFF" Brewfile > Brewfile.tmp
        info "Skipping \"VM OFF\" brew packages\n"
    fi

    brew update # Updating Homebrew recipes

    if brew bundle --file "./Brewfile.tmp"; then
        echo
        success "Brew bundle installed!"
        brew cleanup # Remove outdated versions from the cellar.
        echo
    else
        fail "Failed to install brew bundle"
    fi

    rm ./Brewfile.tmp &> /dev/null
else
    echo "\n"
    info "Skipping brew bundle install"
fi

exit 0
