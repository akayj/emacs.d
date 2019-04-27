.PHONY: clean c
clean c:
	@find . -type f -name '*~' -print0 | xargs -0 $(RM) -v
