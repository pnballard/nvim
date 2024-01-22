# Default version of Ubuntu 22.04.03 LTS

# - gcc "not installed"
# - vim 8.2
# - perl 5.34
# - python 3.10.2
# - git 2.34.1

###################################
# Initial OS updates:
###################################

sudo apt update
sudo apt upgrade
sudo apt autoremove

# Get gcc and compile tools
sudo apt install build-essential
# - gcc 11.4.0

# Get python pip
sudo apt install python3-pip

# Install ripgrep and fd for telescope
sudo apt install ripgrep
sudo apt install fd-find
sudo ln -sf /usr/bin/fdfind /usr/bin/fd

# Install universal ctags for vim-gutentags
sudo apt install universal-ctags

###################################
#  Install neovim
###################################
# sudo apt install neovim
# Acutally, better to download a newer version, extract to .local/share/applications, and link to the binary

# Install neovim packer plugin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

###################################
# One by one install easy plugins 
###################################

# optional -  Install cargo for rust and so that we can install tree-sitter cli
sudo apt install cargo
cargo install tree-sitter-cli
# Install nodejs for node as a neovim provider option
sudo apt install nodejs

############
# LSP stuff
############

#############################
# install python lsp
#############################
sudo pip install "python-lsp-server[all]"
sudo pip install "python-lsp-ruff"
sudo pip install "python-lsp-black"
sudo pip install "pylsp-mypy"
# Install the ruff python support

#############################
# install vhdl lsp
#############################
sudo apt install unzip
wget https://github.com/VHDL-LS/rust_hdl/releases/download/v0.77.0/vhdl_ls-x86_64-unknown-linux-musl.zip
# Unzip and create link to binary source in .local/bin

#############################
# install verible verilog tools
#############################
wget https://github.com/chipsalliance/verible/releases/download/v0.0-3483-ga4d61b11/verible-v0.0-3483-ga4d61b11-linux-static-x86_64.tar.gz
# Untar and create link to binary source in .local/bin

#############################
# install perl language server
#############################
sudo apt install libanyevent-perl libclass-refresh-perl libcompiler-lexer-perl libdata-dump-perl libio-aio-perl libjson-perl libmoose-perl libpadwalker-perl libscalar-list-utils-perl libcoro-perl
sudo cpan Perl::LanguageServer

#############################
# install lua language server
#############################
wget https://github.com/LuaLS/lua-language-server/releases/download/3.7.4/lua-language-server-3.7.4-linux-x64.tar.gz
# Unzip and create link to binary source in .local/bin

#############################
# install xml language server
#############################
# needs maven, which needs java
sudo apt install default-jdk
sudo apt install maven
git clone https://github.com/eclipse/lemminx
cd lemminx
./mvnw clean verify
# Get graalvm to help with generating binary from jar
wget https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz
tar -xvzf graalvm-jdk-21_linux-x64_bin.tar.gz
# in current shell you add the graalvm bin dir to PATH and reset JAVA_HOME to graalvm dir,
# then go back and rebuild maven with right switches
cd lemminx
./mvnw clean package -Dnative -DskipTests
# a lemminx executable with a long name exists now in the lemminx target dir, link to is in .local/bin as lemminx

##########################
# Bash lsp and linter
##########################
# install shellcheck linter
sudo apt install shellcheck

# install lsp
sudo snap install bash-language-server --classic


















