%.html: %.rmd
	Rscript -e "rmarkdown::render(\"$<\")"

%.html: %.qmd bayes.bib
	quarto render $<

%.docx: %.rmd
	Rscript -e "rmarkdown::render(\"$<\", output_format = \"word_document\")"

README.md: README.rmd bayes.bib
	Rscript -e "rmarkdown::render('README.rmd')"

spatiotemporal.md: spatiotemporal.rmd bayes.bib harvard-cite-them-right.csl
	Rscript -e "rmarkdown::render('spatiotemporal.rmd')"

clean:
	rm -f *~ *.aux *.log

