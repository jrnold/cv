#!/usr/bin/env python3

"""
Pandoc filter to remove the bibliography added by pandoc-citeproc
"""

from pandocfilters import toJSONFilter, Div

def theorems(key, value, format, meta):
  if key == 'Div':
    [[ident,classes,kvs], contents] = value
    if "references" in classes:
        return []

if __name__ == "__main__":
  toJSONFilter(theorems)
