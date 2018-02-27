This is the source code for my curriculum vitate.
It uses markdown + pandoc to produce html and pdf versions of the CV, and hosts them on [github pages](http://jrnold.github.io/jrnold-cv).

Some ideas and LaTeX code were taken from the better looking and more impressive CV's of [Kieran Healy](https://github.com/kjhealy/kjh-vita) and [Matthew Blackwell](https://github.com/mattblackwell/blackwell-cv).

Dependencies
============

-   [pandoc](http://johnmacfarlane.net/pandoc/index.html)
-   xelatex
-   [pandocfilters](https://github.com/jgm/pandocfilters) python module
-   [Open Sans](http://www.fontsquirrel.com/fonts/open-sans) font
-   [Sorts Mill Goudy](http://www.fontsquirrel.com/fonts/Sorts-Mill-Goudy) font

Usage
==========

Build the html and pdf versions:
```
make build
```
Commit the current changes. Note that output in the ``output`` directory is stored in version control.
```
git commit
```
Deploy to github:
```
make deploy
```
The last step uses ``git subtree`` to push the ``output`` directory to the ``gh-pages`` branch on github; I got that idea from [here](http://yeoman.io/learning/deployment.html).
