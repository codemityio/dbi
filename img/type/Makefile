export SHELL:=/bin/bash

docs:
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/type quicktype --help); \
	notatio coi \
		--command="quicktype --help" \
		--output="$$output" \
		--document=README.md \
		--header='`quicktype`' \
		--limiter-left=### \
		--limiter-right=### \
		--shell-name=text
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/type json2ts --help); \
	notatio coi \
		--command="json2ts --help" \
		--output="$$output" \
		--document=README.md \
		--header='`json2ts`' \
		--limiter-left=### \
		--limiter-right=## \
		--shell-name=text
