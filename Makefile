vimrc=~/.vimrc
vim_f=~/.vim
nvim_f=~/.config/nvim

def: update
	@

update:
	cp ${vimrc} ./
	cp -r ${vim_f} ./
	cp -r ${nvim_f} ./

upload:
	cp ./.vimrc ~
	cp -r ./.vim ~
	mkdir ~/.config ; cp -r ./nvim ~/.config/nvim
	
.PHONY: def update
