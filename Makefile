%.html: %.rmd
	Rscript -e "rmarkdown::render(\"$<\")"

%.docx: %.rmd
	Rscript -e "rmarkdown::render(\"$<\", output_format = \"word_document\")"

README.md: README.rmd bayes.bib
	Rscript -e "rmarkdown::render('README.rmd', output_format = 'md_document')"

clean:
	rm -f *~ *.aux *.log

