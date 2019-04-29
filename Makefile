.PHONY: clean c
clean c:
	@find . -type f -name '*~' -or -name '*.elc' -print0 | xargs -0 $(RM) -v
