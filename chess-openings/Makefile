CHESSBOARDS_PER_ROW := "5"

all: chess-openings.pdf test

chess-openings.pdf: src/open.tex src/semi.tex src/closed.tex src/indian.tex chess-openings.tex
	mkdir -p build
	pdflatex --output-directory=build chess-openings.tex
	cp build/chess-openings.pdf .

src/open.tex: src/*-o-*.tex
	./tools/converter.bash $(CHESSBOARDS_PER_ROW) src/open.tex o

src/semi.tex: src/*-s-*.tex
	./tools/converter.bash $(CHESSBOARDS_PER_ROW) src/semi.tex s

src/closed.tex: src/*-c-*.tex
	./tools/converter.bash $(CHESSBOARDS_PER_ROW) src/closed.tex c

src/indian.tex: src/*-n-*.tex
	./tools/converter.bash $(CHESSBOARDS_PER_ROW) src/indian.tex n

clean:
	rm -rf build chess-openings.pdf src/open.tex src/semi.tex src/closed.tex src/indian.tex

test:
	if grep -El '(0-|-0)' src/*.tex; then echo 'Castling in above files should be written with uppercase o, not zero' 2>&1 && exit 1; fi