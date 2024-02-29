# ps-scripts

These are just some of the scripts I use to make my life easier with Powershell.

Here what they do:

## Git-Pretty
### Description
Nice way of getting all the contents of a git repository. 
- Not recommended for large projects.
- Nice for getting context for use with LLMs.

### Parameters
`includeFiles`: if specified, only these files will be included
`excludeFiles`: Git-Pretty will ignore all files listed here, .gitignore files are exluded by default

### Usage
```
Git-Pretty
```
```
Git-Pretty -includeFiles .go # This will include all golang files
```
```
Git-Pretty -excludeFiles README.md # This will exclude the README.md from the output
```

Can easily be combined with other cmdlets, such as
```
Git-Pretty | Set-Clipboard
```

### Output
This script outputs the contents of each file in a git repository (not including .gitignore files) in a nice format.


## Test-Git-Repo
### Description
Error free method of checking if a directory is part of a git repository.

### Usage
```
Test-Git-Repo
```

### Output
This script outputs 'true' if the current directory is part of a git repository and 'false' otherwise.
