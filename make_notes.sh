#/bin/usr/env bash

./strip_notebook.py "$1".complete.ipynb "$1".ipynb

ipython nbconvert --to latex --post PDF "$1".complete.ipynb
ipython nbconvert --to latex --post PDF "$1".ipynb

rm "$1".tex
rm "$1".complete.tex

mv "$1".pdf pdfs
mv "$1".complete.pdf pdfs
