#!/usr/bin/env bash
set -e

print_head() {
cat << EOF
\begin{minipage}[t]{MINIPAGE_WIDTH\linewidth}
\fenboard{FEN_BOARD}
\raggedright
\begin{center}
\scalebox{SCALEBOX_WIDTH}{\showboard}
\end{center}
\newgame
EOF
}

print_tail() {
cat << EOF
\vspace{2mm}
\end{minipage}
EOF
}

parse_openings() {
    local counter=0
    for opening in "${REPOSITORY_ROOT}"/src/*-${LETTER}-*; do
        if ! grep -q '@' "${opening}"; then
            continue
        fi
        fen="$(awk -F '@' '/@/ {print $2}' "${opening}")"
        {
            print_head
            cat "${opening}"
            print_tail
        } | grep -v 'PGN' | sed "s@FEN_BOARD@${fen}@g"
        counter=$((counter+1))
        if ! (( counter % CHESSBOARDS_IN_A_ROW )); then
            echo "\newline"
        else
            echo "\hspace{5mm}"
        fi
    done

    if (( counter % CHESSBOARDS_IN_A_ROW )); then
        echo ""
    fi
}

REPOSITORY_ROOT="$(dirname "$(dirname "$0")")"

CHESSBOARDS_IN_A_ROW="${1:-4}"
TARGET_FILE="$2"
LETTER=$3 # o, s, c or n

SCALEBOX_WIDTH="$(bc -l <<< "2.8/${CHESSBOARDS_IN_A_ROW}" | head -c 4)"
MINIPAGE_WIDTH="$(bc -l <<< "1/${CHESSBOARDS_IN_A_ROW} - 0.025" | head -c 4)"

parse_openings | sed \
    -e "s@SCALEBOX_WIDTH@${SCALEBOX_WIDTH}@g" \
    -e "s@MINIPAGE_WIDTH@${MINIPAGE_WIDTH}@g" > "${TARGET_FILE}"