# Built-in Functions

There are some useful Built-in Functions for managing results in Fiji:

- getStatistics()
- getResult("Column", row)
- setResult("Column", row, value) and updateResults()
- nResults or getValue("results.count")

# Results windows

You can only have one active results window at a time. This must be named "Results".
Other results windows should be renamed. You can use IJ.renameResults to do this.
To make a renamed results window active again, rename the previously active window something else and rename the original window "Results" again.

# Graphs

Fiji is not designed to create graphs
You will need to export your results to another programme (e.g. excel, python, matlab, ...)
saveAs(format, path)
Export the results as a .csv (comma separated value) file


# Results windows

You can only have one active results window at a time. This must be named "Results".
Other results windows should be renamed. You can use IJ.renameResults to do this.
To make a renamed results window active again, rename the previously active window something else and rename the original window "Results" again.

# Graphs

Fiji is not designed to create graphs
You will need to export your results to another programme (e.g. excel, python, matlab, ...)
saveAs(format, path)
Export the results as a .csv (comma separated value) file