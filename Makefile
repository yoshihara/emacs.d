# cf. https://github.com/yewton/.emacs.d/blob/96d30f93299e804811c7d325e2ef6c4141edb1d9/Makefile
EMACS := emacs
BASENAME := README
ORG := $(BASENAME).org
EL := init.el
ELC := init.elc
ERROR_ON_WARN ?= nil

.PHONY: all clean run

all: $(ELC)

$(ELC): $(EL)

$(EL): $(BASENAME).org

$(EL):
	$(EMACS) --quick --batch --load "ob" --eval "(org-babel-tangle-file \"$<\")"

%.elc: %.el
	$(EMACS) --quick --batch --eval "(setq byte-compile-error-on-warn $(ERROR_ON_WARN))" --funcall batch-byte-compile $<

run: all
	$(EMACS) --no-init-file --chdir $(PWD) --debug-init -l $(PWD)/init.el >/dev/null 2>&1 &

clean:
	rm -vfr $(EL) $(ELC)
	find . -name '*~' -delete -print
