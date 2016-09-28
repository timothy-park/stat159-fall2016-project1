# variables
IN = paper.md
OUT = paper
sections = paper/sections/
mds = $(wildcard 0*.md)

# declaring phony target
.PHONY: all clean

# all
all: $(OUT).html $(IN)

# from markdown to html
$(OUT).html: $(IN)
	cd paper; pandoc $< -s -o $@

# is there an easier way? cd or wildcards?
$(IN): $(sections)00-abstract.md $(sections)01-introduction.md $(sections)02-discussion.md $(sections)03-conclusions.md
	cd $(sections); pandoc $(mds) -s -o $@


# did this do anything?
clean:
	cd paper; rm -f $(OUT).html