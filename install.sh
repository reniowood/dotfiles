#!/bin/bash

echo "Install brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install zsh"
brew install zsh
chsh -s $(which zsh)

echo "Install oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Install tmux"
brew install tmux

working_directory=$(pwd)
files=("profile" "vimrc" "tmux.conf" "zshrc")

echo "Make symbolic links:"

cd ~
for file in "${files[@]}"
do
    dotfile=."$file"
    echo "Making symbolic link for $file"
    if [ -e "$dotfile" ] || [ -L "$dotfile" ]
    then
        rm "$dotfile"
    fi
    ln -s $working_directory/$file "$dotfile"
done

echo "Install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install plugins"
vim -c PlugInstall -c q -c q

while true
do                                                                                                                                                                                            
    read -p "Do you want to install YouCompleteMe? [yN]" yn
    case $yn in                                                                                                                                                                                   
        [Yy]* )      cd ~; mkdir ycm_build; cd ycm_build; sudo apt-get install cmake; cmake -G "Unix Makefiles" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp; cmake --build . --target ycm_core --config Release; break;;
        [Nn]* | "" ) echo "Done!"; exit;;
        * )          echo "Please answer yes or no.";;
    esac
done

echo "Done!"
