all:
	cd chess-openings && $(MAKE) all
	cd chess-rules && $(MAKE) all
	cp */*.pdf .

test:
	cd chess-openings && $(MAKE) test
	cd chess-rules && $(MAKE) test

clean:
	cd chess-openings && $(MAKE) clean
	cd chess-rules && $(MAKE) clean
	find . -maxdepth 1 -type f -name '*.pdf' -print -delete
