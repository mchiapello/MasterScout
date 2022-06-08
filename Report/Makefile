book: clear gitbook pdf docx

clear:
	rm -rf _book
	rm -rf _bookdown_files/

gitbook:
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" & open _book/index.html

pdf:
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

bs4:
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::bs4_book')"

serve:
	Rscript -e "bookdown::serve_book()"

docx:
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::word_document2')"


