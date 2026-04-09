export SHELL:=/bin/bash

docs:
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/pandoc:latest --help); \
	notatio coi \
		--command="pandoc --help" \
		--output="$$output" \
		--document-path=README.md \
		--header=Manual \
		--limiter-left=## \
		--limiter-right="## " \
		--shell-name=text
