SRC := Final_Exam_Study.md
PDF := Final_Exam_Study.pdf
HTML := Final_Exam_Study.html

.PHONY: pdf html clean

pdf: $(PDF)

$(PDF): $(SRC)
	pandoc $(SRC) -o $(PDF) \
		--pdf-engine=xelatex \
		-V mainfont="Helvetica" \
		-V monofont="Menlo" \
		--from=markdown+tex_math_dollars+tex_math_single_backslash

html: $(HTML)

$(HTML): $(SRC)
	pandoc $(SRC) -o $(HTML) --mathjax --standalone

clean:
	rm -f $(PDF) $(HTML)
