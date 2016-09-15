TESTS=$(wildcard slides/*.adoc)
MOST_RECENT=$(shell ls -t slides/*.html | head -1)

default: $(patsubst %.adoc,%.html,$(TESTS))

%.html: %.adoc
	asciidoctor -T templates/slim -b revealjs $<

clean:
	rm -f slides/*.html

serve:
	python2 -m SimpleHTTPServer 8000
