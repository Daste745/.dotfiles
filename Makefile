STOW=stow -vv

.PHONY: stow adopt

stow:
	$(STOW) .

adopt:
	$(STOW) --adopt .

