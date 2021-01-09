# Chess notes
A collection of loosely related notes I prepared during my chess self-study.

## Chess openings
![chess openings](https://i.imgur.com/kJXmGNg.png)

To generate the PDF file locally you need LaTeX (with xskak package), Make is optional but highly recommended.
Either invoke
```
make
```
inside top directory or descent into `chess-openings` subdirectory and then
```
# if you modified anything in src/, if not - skip
./tools/converter.bash 5 o > src/open.tex
./tools/converter.bash 5 s > src/semi.tex
./tools/converter.bash 5 c > src/closed.tex
./tools/converter.bash 5 n > src/indian.tex
./tools/converter.bash 5 f > src/flank.tex

pdflatex chess-openings.tex
```

Each opening is stored in separate file. Syntax is as follows:
```
%FEN@<Forsyth-Edwards Notation goes here>
\openingname{English Opening}: \mainline{1. c4} (diagram). Then
\mainline{1...Nf6} \openingname{Anglo-Indian Defence} or
\variation{1...e6} \openingname{Agincourt Defence}.

% Beware: text is printed after the chessboard so it's not necessarily
% mainline that you will see in output document. You need to manually
% edit both. The hardcoded FEN wouldn't be needed if text and chessboards
% were swapped but it IMO it was not eye-pleasing.
```
