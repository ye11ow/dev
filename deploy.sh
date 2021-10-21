check_command() {
	if command -v $1; then
		return 0
	else
		echo "command $1 does not exist"
        exit 1
	fi
}

if check_command nvim; then
    echo "please install vim-plug for neovim manually..."
	echo "configurating nvim..."
	if ! grep -q "source\ ~/profiles/.vimrc" ~/.config/nvim/init.vim; then
	    echo "source ~/profiles/.vimrc" >> ~/.config/nvim/init.vim
	fi
	echo "nvim configured"

fi

if check_command zsh; then
    echo "installing ohmyzsh and powerlevel10k theme..."

    # install ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # install powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

	echo "configurating zsh..."
	if ! grep -q "source\ ~/profiles/.bashrc" ~/.zshrc; then
	    echo "source ~/profiles/.bashrc" >> ~/.zshrc
	fi

    # https://github.com/romkatv/powerlevel10k#oh-my-zsh
	echo "zsh configured, please manually set ZSH_THEME='powerlevel10k/powerlevel10k' in ~/.zshrc and then restart zsh"
fi
