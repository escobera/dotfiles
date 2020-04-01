#!/usr/bin/env bash
TITLE='\033[0;36m'
NC='\033[0m'

print_step () {
  echo -e "${TITLE}##### $1 #####${NC}"
}

install_source_code_pro () {
  cd Downloads

  wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip

  if [ ! -d "~/.fonts" ] ; then
      mkdir ~/.fonts
  fi

  unzip 1.050R-it.zip 

  cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
  rm -rf source-code-pro* 
  rm 1.050R-it.zip 

  cd ~/

  fc-cache -f -v
}

install_asdf () {
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
  
  asdf plugin add erlang
  asdf plugin add elixir
  asdf plugin add nodejs
  asdf plugin add ruby
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
  
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

  ASDF_CONCURRENCY=4 asdf install ruby 2.6.5
  asdf global ruby 2.6.5

  # asdf install erlang 22.2.1
  # asdf global erlang 22.2.1

  # asdf install elixir 1.9.4
  # asdf global elixir 1.9.4
  
  # asdf install nodejs 12.14.0
  # asdf global nodejs 12.14.0
}

print_step "Installing dependencies"
if [ ! -f /usr/bin/zsh ] ; then
  sudo apt update
  sudo apt install --assume-yes zsh git vim automake autoconf libreadline-dev \
  libncurses-dev libssl-dev libyaml-dev \
  libxslt-dev libffi-dev libtool unixodbc-dev \
  unzip curl
fi

print_step "Installing Source Code Pro Font"
if [ ! -f ~/.fonts/SourceCodePro-Regular.otf ] ; then
 install_source_code_pro
fi

print_step "Installing ZimFW"
if [ ! -d $HOME/.zim ] ; then
  touch ~/.zshrc
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  chsh -s /bin/zsh

  print_step "Adding my .zshrc and .zimrc"
  rm ~/.zimrc
  rm ~/.zshrc
  cp ./files/zimrc ~/.zimrc
  cp ./files/zshrc ~/.zshrc
fi

print_step "Install ASDF and plugins"
if [ ! -d $HOME/.asdf ] ; then
  install_asdf
fi

print_step "Install dracula color scheme"
if [ ! -f $HOME/.config/tilix/schemes/Dracula.json ] ; then
  mkdir -p $HOME/.config/tilix/schemes
  cp ./files/Dracula.json $HOME/.config/tilix/schemes/Dracula.json
fi 

print_step "Fix TILIX configs"
if [ ! -f /etc/profile.d/vte.sh ] ; then
  sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
fi

