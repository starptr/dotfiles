.PHONY: all

all: submods # python node rust go java ruby

submods:
	@echo "Cloning submodules..."
	yadm submodule update --recursive --init
	@echo "Submodules cloned."
	@echo

