"""
Simply goes through all files and trims their names and reorganizes them.
The files may start as #-file.ext or just file.ext, but will be trimmed to
file.ext and then renamed with appropriate padding depending on how many
files (eg 00-file for 10+, 000-file for 100+, etc).

** Note: This will not remove any numbers other than leading numbers, so it is
       safe to use them in any descriptions.

** Note: This does not preserve order.
"""

import os
import argparse
import sys

# Check for command line args
parser = argparse.ArgumentParser(description='File renamer')
parser.add_argument('--d', type=str, action='store',required=True,
                    help='File directory to be renamed')

args = parser.parse_args()
d = args.d

if not os.path.isdir(d):
    print('Specified path does not exist')
    sys.exit(1)

# Padding: {x:04}
contents = os.listdir(d)
count = len(contents)
counter = 1

# Loop through directory and remove any number prefixes
print(f"Number of files: {count}")
for file in contents:
    # Setup letter_index.  We still stop the index at the first
    # alphabetic character and cut the name up to that point.
    # Incrementing the counter is used to create the padded prefix to be added.
    letter_index = 0

    for letter in file:
        if letter.isalpha():
            break
        letter_index += 1

    # Determine length of padding - if under ten we still want it to appear 01
    pad_length = len(str(count))
    if pad_length < 1:
        pad_length = 2

    # Create new file name and rename the file
    new_name = f"{counter:0{pad_length}}_"
    new_name += file[letter_index:]
    os.rename(os.path.join(d, file), os.path.join(d, new_name))
    counter += 1

