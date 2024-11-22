STOW=stow -v 2

.PHONY: stow adopt

stow:
	$(STOW) .

adopt:
	$(STOW) --adopt .

