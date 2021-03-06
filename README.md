# Philipp Tempel - LaTeX Packages

[![pipeline status](https://gitlab.com/philipptempel/latex-package/badges/master/pipeline.svg)](https://gitlab.com/philipptempel/latex-package/commits/master)
[![license](https://img.shields.io/badge/license-LPPL--1.3c-brightgreen)](https://gitlab.com/philipptempel/latex-package/blob/master/LICENSE.txt)
[![Open Source Love png1](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://gitlab.com/philipptempel/latex-package/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://gitlab.com/philipptempel/latex-package/activity)
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://gitlab.com/philipptempel/latex-package/)

This is the nonofficial repository of LaTeX document classes, styles, packages, and templates for documents at the University of Stuttgart.
If you are interested in just finding the most recent files you need for writing code, please refer to the releases page:

[Download most recent release](https://gitlab.com/philipptempel/latex-package/)

## Requirements

### LaTeX Distribution

You need an up-to-date version of a LaTeX distribution on your current operating system.
We generally advise **against** MikTeX, and advise **for** using [TeXlive](https://www.tug.org/texlive/).

### Compiler Engine

As the trend in development of LaTeX related packages and classes is to move away from `pdflatex` towards `xelatex` or `lualatex`, we are not providing support for `pdflatex` anymore.
As such, you will need to compile your document using either `XeLaTeX` or `luaLaTeX` (preferably `luaLaTeX`, as the classes are more thoroughly tested against `luaLaTeX`).

Additionally, if you want to play it safe, use `latexmk` to build your document. Our provided `.latexmkrc` files include all the necessary commands to compile everything in the right order. Only requirement is access to a command line with `latexmk` on your path. Some LaTeX-IDEs also allow using `latexmk` instead of some weird `lualatex + makeindex + ... + dvips` combo.

PS: The developers are solely using `latexmk`, so support for users using `latexmk` will be the best.

## Usage

Download a release and copy the included `*.sty` files into your working directory or to any path in your `TEXMFHOME`.
If you do not know what `TEXMFHOME` is, then you are better off with this option.
If you do know what `TEXMFHOME` is but do not know where it is, then run
```shell
kpsewhich --var-value TEXMFHOME
```
in a local shell and copy the files into directory `$TEXMFHOME/tex/latex/philipptempel/` - which you have to create yourself.

You can also download the source code and run
```shell
make ins
```
inside a shell to install the compiled files into your `TEXMFHOME` directory.
This option does not clutter your current working directory and you won't end up with many copies of different versions of the source file

## Contributing

Before sending a pull request, be sure to check out the [Contribution Guidelines](CONTRIBUTING.md) first.

## Development Team

`Philipp Tempel -- LaTeX Packages` was created by [Philipp Tempel](https://www.tudelft.nl/en/3me/departments/precision-and-microsystems-engineering-pme/people/junior-research-staff/tempel-philipp/) who both uses and continues developing the packages.

* [Philipp Tempel](http://philipptempel.me)
