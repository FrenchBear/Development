# 24 Folders
# 2016-05-13    PV
# 2016-12-05    PV      Added os.walk

import os, os.path

source = r"W:\Revues\Science"

# os.scandir is faster
# see https://www.python.org/dev/peps/pep-0471/
def subdirs1(path):
    """Yield directory names not starting with '.' under given path."""
    for entry in os.scandir(path):
        if entry.is_dir():      # and not entry.name.startswith('.')
            yield entry.name

def subdirs2(path):
    return [f for f in os.listdir(path) if not os.path.isfile(os.path.join(path, f))]

# os.walk returns the complete hierarchy in a recursive way
# 1st entry is about the root folder
# So it's inefficient in this example
def subdirs3(path):
    _, dirs, _ = next(os.walk(path))        # Takes 1st element of an iterator
    return dirs
    #for root, directories, filenames in os.walk(path):
    #    return directories

print(list(subdirs1(source)))
print(list(subdirs2(source)))
print(list(subdirs3(source)))
