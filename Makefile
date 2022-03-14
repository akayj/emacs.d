.PHONY: update-submodule up
up update-submodule:
	git submodule update --recursive --remote

.PHONY: clean c
clean c:
	@find . -type f \( -name '*~' -or -name '*.elc' -o -name '*.pyc' \) -print0 | xargs -0 $(RM) -v
