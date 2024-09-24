# Install all dependency
brew install neovim cmake make python gcc npm clangd ripgrep

# Install packers
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Python linting
pip install black

