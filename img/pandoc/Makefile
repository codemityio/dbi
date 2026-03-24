export SHELL:=/bin/bash

docs:
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/pandoc --help); \
	notatio coi \
		--command="pandoc --help" \
		--output="$$output" \
		--document=README.md \
		--header=Manual \
		--limiter-left=## \
		--limiter-right=## \
		--shell-name=text
