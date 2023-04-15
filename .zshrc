#
#~/.zshrc
#

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
setopt autocd
setopt correct 
setopt appendhistory

autoload -Uz +X compinit && compinit

## case insensitive path-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

function aurinstall() {
	#Check if valid git repo
	if git-remote-url-reachable "$1"; then
		cd ~;
		git clone https://aur.archlinux.org/$1.git && cd $1 &&
		makepkg -si --noconfirm || {cd ~ && rm -rf $1 && echo "Installation Failed! No packages were installed."};
	else 
		echo "No such AUR package exists!";
	fi
}

git-remote-url-reachable() {
      git ls-remote "https://aur.archlinux.org/$1.git" CHECK_GIT_REMOTE_URL_REACHABILITY >/dev/null 2>&1
  }

function jv() {
	javac $1.java && java $@ # adds args to runtime   
}


alias ls="exa -a --icons --group-directories-first";
alias internet="ping www.google.com -c 5";
alias back="source ~/.zshrc";
alias cls="clear && nerdfetch && printf 'killing myself slowly on ' && date";
alias wiki="firefox https://wiki.archlinux.org &! exit";
alias aur="firefox https://aur.archlinux.org &!  exit";
alias bye="poweroff";
alias sso="firefox https://launchpad.classlink.com/conroeisd &! exit;"
alias cd="z"
alias ll="ls -l"
alias cat="bat --theme=TwoDark"

