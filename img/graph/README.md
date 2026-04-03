# `graph`

## Table of contents

- [Summary](#summary)
- [Manual](#manual)
  - [`graphviz`](#graphviz)
  - [`mermaid`](#mermaid)
  - [`plantuml`](#plantuml)
- [Usage](#usage)
- [Third party software](#third-party-software)

## Summary

Base image containing packages to work with diagrams (<https://gitlab.com/graphviz/graphviz>,
<https://github.com/mermaid-js/mermaid-cli> and <https://github.com/plantuml/plantuml>).

## Manual

### `graphviz`

``` text
$ dot --help
Usage: dot [-Vv?] [-(GNE)name=val] [-(KTlso)<val>] <dot files>
(additional options for neato)    [-x] [-n<v>]
(additional options for fdp)      [-L(gO)] [-L(nUCT)<val>]
(additional options for config)  [-cv]

 -V          - Print version and exit
 -v          - Enable verbose mode 
 -Gname=val  - Set graph attribute 'name' to 'val'
 -Nname=val  - Set node attribute 'name' to 'val'
 -Ename=val  - Set edge attribute 'name' to 'val'
 -Tv         - Set output format to 'v'
 -Kv         - Set layout engine to 'v' (overrides default based on command name)
 -lv         - Use external library 'v'
 -ofile      - Write output to 'file'
 -O          - Automatically generate an output filename based on the input filename with a .'format' appended. (Causes all -ofile options to be ignored.) 
 -P          - Internally generate a graph of the current plugins. 
 -q[l]       - Set level of message suppression (=1)
 -s[v]       - Scale input by 'v' (=72)
 -y          - Invert y coordinate in output

 -n[v]       - No layout mode 'v' (=1)
 -x          - Reduce graph

 -Lg         - Don't use grid
 -LO         - Use old attractive force
 -Ln<i>      - Set number of iterations to i
 -LU<i>      - Set unscaled factor to i
 -LC<v>      - Set overlap expansion factor to v
 -LT[*]<v>   - Set temperature (temperature factor) to v

 -c          - Configure plugins (Writes $prefix/lib/graphviz/config 
               with available plugin information.  Needs write privilege.)
 -?          - Print usage and exit
```

### `mermaid`

``` text
$ mmdc --help
Usage: mmdc [options]

Options:
  -V, --version                                   output the version number
  -t, --theme [theme]                             Theme of the chart (choices: "default", "forest", "dark", "neutral", default: "default")
  -w, --width [width]                             Width of the page (default: 800)
  -H, --height [height]                           Height of the page (default: 600)
  -i, --input <input>                             Input mermaid file. Files ending in .md will be treated as Markdown and all charts (e.g. ```mermaid (...)``` or :::mermaid (...):::) will be extracted and generated. Use `-` to read from stdin.
  -o, --output [output]                           Output file. It should be either md, svg, png, pdf or use `-` to output to stdout. Optional. Default: input + ".svg"
  -a, --artefacts [artefacts]                     Output artefacts path. Only used with Markdown input file. Optional. Default: output directory
  -e, --outputFormat [format]                     Output format for the generated image. (choices: "svg", "png", "pdf", default: Loaded from the output file extension)
  -b, --backgroundColor [backgroundColor]         Background color for pngs/svgs (not pdfs). Example: transparent, red, '#F0F0F0'. (default: "white")
  -c, --configFile [configFile]                   JSON configuration file for mermaid.
  -C, --cssFile [cssFile]                         CSS file for the page.
  -I, --svgId [svgId]                             The id attribute for the SVG element to be rendered.
  -s, --scale [scale]                             Puppeteer scale factor (default: 1)
  -f, --pdfFit                                    Scale PDF to fit chart
  -q, --quiet                                     Suppress log output
  -p --puppeteerConfigFile [puppeteerConfigFile]  JSON configuration file for puppeteer.
  --iconPacks <icons...>                          Icon packs to use, e.g. @iconify-json/logos. These should be Iconify NPM packages that expose a icons.json file, see https://iconify.design/docs/icons/json.html. These will be downloaded from https://unkpg.com when needed. (default: [])
  --iconPacksNamesAndUrls <prefix#iconsurl...>    Icon packs to use, e.g. azure#https://raw.githubusercontent.com/NakayamaKento/AzureIcons/refs/heads/main/icons.json where the name (prefix) of the icon pack is defined before the "#" and the url of the json definition after the "#". These should be Iconify json file formatted as IconifyJson, see https://iconify.design/docs/icons/json.html. These will be downloaded when needed. (default: [])
  -h, --help                                      display help for command
```

### `plantuml`

``` text
$ java -jar /usr/local/lib/plantuml.jar --help
plantuml - generate diagrams from plain text

Usage:
  java -jar plantuml.jar [options] [file|dir]...
  java -jar plantuml.jar [options] --gui

Description:
  Process PlantUML sources from files, directories (optionally recursive), or stdin (-pipe).

Wildcards (for files/dirs):
  *   any characters except '/' and '\'
  ?   exactly one character except '/' and '\'
  **  any characters across directories (recursive)
  Tip: quote patterns to avoid shell expansion (e.g., "**/*.puml").

General:

General:
     --author .................... Show information about PlantUML authors
     --check-graphviz ............ Check Graphviz installation
     --dark-mode ................. Render diagrams in dark mode
 -d, --define <VAR>=<value> ...... Define a preprocessing variable (equivalent to '!define <var> <value>')
     --duration .................. Print total processing time
     --gui ....................... Launch the graphical user interface
 -h, --help ...................... Show help and usage information
     --help-more ................. Show extended help (advanced options)
     --http-server[:<port>] ...... Start internal HTTP server for rendering (default port : 8080)
 -p, --pipe ...................... Read source from stdin, write result to stdout
     --progress-bar .............. Show a textual progress bar
     --splash-screen ............. Show splash screen with progress bar
 -v, --verbose ................... Enable verbose logging
     --version ................... Show PlantUML and Java version

Execution control:
     --check-before-run .......... Pre-check syntax of all inputs and stop faster on error
     --check-syntax .............. Check diagram syntax without generating images
     --no-error-image ............ Do not generate error images for diagrams with syntax errors
     --stop-on-error ............. Stop at the first syntax error

Metadata & assets:
     --extract-source ............ Extract embedded PlantUML source from PNG or SVG metadata
     --skip-fresh ................ Skip PNG/SVG files that are already up-to-date (using metadata)
     --sprite <4|8|16[z]> <file>   Encode a sprite definition from an image file

Output format (choose one):
 -f, --format <name> ............. Set the output format for generated diagrams
                                   (e.g. png, svg, pdf, eps, latex, txt, utxt, obfuscate, preproc...)

Available formats:
     --eps ....................... Generate images in EPS format
     --latex ..................... Generate LaTeX/TikZ output
     --obfuscate ................. Replace text in diagrams with obfuscated strings to share diagrams safely
     --png ....................... Generate PNG images (default)
     --preproc ................... Generate the preprocessed source after applying !include, !define... (no rendering)
     --svg ....................... Generate SVG images
     --txt ....................... Generate ASCII art diagrams
     --utxt ...................... Generate ASCII art diagrams using Unicode characters


Examples:
  # Process all .puml recursively
  java -jar plantuml.jar "**/*.puml"

  # Check syntax only (CI)
  java -jar plantuml.jar --check-syntax src/diagrams

  # Read from stdin and write to stdout (SVG)
  cat diagram.puml | java -jar plantuml.jar --svg -pipe > out.svg

  # Encode a sprite from an image
  java -jar plantuml.jar --sprite 16z myicon.png

  # Use a define
  java -jar plantuml.jar -DAUTHOR=John diagram.puml

  # Change output directory
  java -jar plantuml.jar --format svg --output-dir out diagrams/

Exit codes:
  0    Success
  50   No file found
  100  No diagram found in file(s)
  200  Some diagrams have syntax errors

See also:
  java -jar plantuml.jar --help-more
  Documentation: https://plantuml.com
```

## Usage

Use it as a base image to be consistent across the projects. Can be used as abase image for the pipeline runners.

## Third party software

This container image includes the following third-party components:

- **PlantUML** (<https://plantuml.com>) — licensed under GPL v3
  <https://github.com/plantuml/plantuml/blob/master/license.txt> - no modifications made.

- **Graphviz** (<https://graphviz.org>) — licensed under EPL v1.0
  <https://gitlab.com/graphviz/graphviz/-/blob/main/LICENSE> - no modifications made.

- **Mermaid** (<https://mermaid.js.org>) — licensed under MIT Copyright (c) 2014-2024 Knut Sveidqvist - no modifications
  made.
