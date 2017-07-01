# Rename Ham Radio Magazine
# Renames files as "02 February 1990.pdf" into "Ham Radio Magazine - 1990-02.pdf"

import re
from os import listdir, rename
from os.path import isfile, join

# Where files are
sourcePath = r"C:\Downloads\temp\Ham Radio Magazine"
# Files are named like "02 February 1990.pdf" where means month #2
p = re.compile(r"^(\d\d) [^ ]+ (\d{4}).pdf$", re.IGNORECASE)
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f)) and p.match(f)]
#sourceFiles.sort()
print(len(sourceFiles))

for f in sourceFiles:
    res = p.search(f)
    month = res.group(1)
    year = res.group(2)
    nn = "Ham Radio Magazine - " + year + "-" + month + ".pdf"
    print(nn)
    rename(join(sourcePath, f), join(sourcePath, nn))
