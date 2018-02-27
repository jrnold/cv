#!/usr/bin/env python
"""Pandoc filter to remove the bibliography added by pandoc-citeproc."""

from pandocfilters import toJSONFilter


def theorems(key, value, format, meta):
    """Remove bibliography divs from a pandoc document."""
    if key == 'Div':
        [[ident, classes, kvs], contents] = value
        if "references" in classes:
            return []


if __name__ == "__main__":
    toJSONFilter(theorems)
