export SHELL:=/bin/bash

docs:
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/graph:latest dot --help); \
	notatio coi \
		--command="dot --help" \
		--output="$$output" \
		--document-path=README.md \
		--header='`graphviz`' \
		--limiter-left=### \
		--limiter-right="### " \
		--shell-name=text
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/graph:latest mmdc --help); \
	notatio coi \
		--command="mmdc --help" \
		--output="$$output" \
		--document-path=README.md \
		--header='`mermaid`' \
		--limiter-left=### \
		--limiter-right="### " \
		--shell-name=text
	@output=$$(docker run --rm -v "$${PWD}:$${PWD}" -w "$${PWD}" codemityio/graph:latest java -jar /usr/local/lib/plantuml.jar --help); \
	notatio coi \
		--command="java -jar /usr/local/lib/plantuml.jar --help" \
		--output="$$output" \
		--document-path=README.md \
		--header='`plantuml`' \
		--limiter-left=### \
		--limiter-right="## " \
		--shell-name=text

