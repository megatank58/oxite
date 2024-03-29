# THE CONTENT IS DIRECTLY COPIED FROM https://raw.githubusercontent.com/oxidic/oxup/main/install.sh

BLUE='\033[0;34m'
NONE='\033[0m'
PREFIX="${BLUE}=>${NONE} "
echo -e "${PREFIX}Downloading oxup"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    curl -LO https://github.com/oxidic/oxup/releases/latest/download/oxup
    chmod +x oxup
    ./oxup setup -n
elif [[ "$OSTYPE" == "darwin"* ]]; then
    curl -LO https://github.com/oxidic/oxup/releases/latest/download/oxup-darwin
    chmod +x oxup-darwin
    ./oxup-darwin setup -n
else
    curl -LO https://github.com/oxidic/oxup/releases/latest/download/oxup.exe
    ./oxup.exe setup -n
fi

if [[ $SHELL == *bash ]]; then
    echo '. "$HOME/.oxido/env"' >> $HOME/.bashrc
elif [[ $SHELL == *zsh ]]; then
    echo '. "$HOME/.oxido/env"' >> $HOME/.zshrc
else
    echo -e "${PREFIX}Add the following lines to your shell configuration to add oxup to PATH: \`. \"$HOME/.oxido/env\"\`"
fi
