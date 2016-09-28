# variables
IN = paper.md
OUT = paper.html

# wildcard
MDS = $(wildcard paper/sections/*.md) 

# declaring phony targets
.PHONY: all clean

# all
all: paper.html paper.md

# from markdown to html with automatic variable
$(OUT): $(IN)
	pandoc paper/$< -s -o paper/$@

# creating paper.md from .md files in section with automatic variable
$(IN): $(MDS)
	cat $(MDS) > paper/$@

clean:
	cd paper; rm -f $(OUT) $(IN)