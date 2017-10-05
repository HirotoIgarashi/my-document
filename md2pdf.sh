#!/bin/bash
pandoc "$1.md" -o "$1.pdf" -V documentclass=ltjarticle --latex-engine=lualatex --toc -N
exit 0
