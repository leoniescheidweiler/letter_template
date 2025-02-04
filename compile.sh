set -e
latexmk
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=letter.pdf -dBATCH "main.pdf"
pkill -HUP mupdf-gl
