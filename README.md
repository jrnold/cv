This is the source code for my curriculum vitate.
It uses markdown + pandoc to produce html and pdf versions of the CV, and hosts them on [github pages](http://jrnold.github.io/jrnold-cv).

Some ideas and LaTeX code were taken from the CV's of [Kieran Healy](https://github.com/kjhealy/kjh-vita) and [Matthew Blackwell](https://github.com/mattblackwell/blackwell-cv).

Dependencies
============



Usage
==========

Build the html and pdf versions of the 
```
make build
```
Commit the current changes. Note that output in the ``output`` directory is stored in version control.
```
git commit
```
Deploy to github
```
make
```
The last step uses ``git subtree`` to merge and push the ``output``
