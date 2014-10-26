#!/usr/bin/env python
"""strip_notebook.py

Python code for removing solution code from ipython notebooks.
Looks for code cells with SOLUTION in the first line comment
and removes all code in that cell. The transformed notebook
is written to an output file.

Usage:
    strip_notebook.py  <input> <output>
    strip_notebook.py --help

Options:
    <input>  the input ipynb file
    <output>       the output ipynb fie
    --help       print this help screen
"""

import json
import copy

import docopt
from IPython.nbformat import current as nbformat


def strip_solutions(input_data):
    """Remove solution code from ipython notebook file"""
    data = copy.deepcopy(input_data)
    for worksheet in data['worksheets']:
        for cell in worksheet['cells']:
            if cell['cell_type'] == 'code':
                code = cell['input'].split('\n')[0]
                if len(code) > 0 and 'SOLUTION' in code:
                    cell['input'] = []
    return data


def main():
    """The main called from the commandline"""
    arguments = docopt.docopt(__doc__)
    infile_name = arguments['<input>']
    outfile_name = arguments['<output>']
    json_string = open(infile_name).read()
    data = nbformat.reads_json(json_string)
    stripped_data = strip_solutions(data)
    with open(outfile_name, 'w') as outfile:
        json.dump(stripped_data, outfile)


if __name__ == '__main__':
    main()
