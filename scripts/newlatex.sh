#!/bin/bash
# A script for opening a new latex template file in the current directory
template=$1
filename=$2

if [ "$template" = "Karticle" ]
then template="template_Kulak_Article.tex"
fi

if [ "$template" = "Kreport" ]
then template="template_Kulak_Report.tex"
fi

if [ "$template" = "Kbeamer" ]
then template="template_Kulak_Beamer.tex"
fi

if [ "$template" = "Kposter" ]
then template="template_Kulak_Poster.tex"
fi

if [ "$template" = "report" ]
then template="template_Report.tex"
fi

if [ "$template" = "article" ]
then template="template_Article.tex"
fi

if [ "$template" = "poster" ]
then template="template_Poster.tex"
fi

if [ "$template" = "poster" ]
then template="template_Poster.tex"
fi

# copying the template file to this directory with specified name
cp ~/Documents/latex/templatefiles/$template ./$filename 
vim $filename
