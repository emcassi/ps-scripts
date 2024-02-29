# ps-scripts

These are just some of the scripts I use to make my life easier with Powershell.

Here what they do:

## [Git-Pretty](/Git-Pretty.ps1)
### Description
Nice way of getting all the contents of a git repository. 
- Not recommended for large projects.
- Nice for getting context for use with LLMs.

### Dependencies
- [git](https://git-scm.com/)

### Parameters
`includeFiles`: if specified, only these files will be included
`excludeFiles`: Git-Pretty will ignore all files listed here, .gitignore files are exluded by default

### Usage
#### Including Certain Files
```
Git-Pretty # This will include all files (not .gitignore) 
```
```
Git-Pretty -includeFiles README.md # This will include only README.md 
```
```
Git-Pretty -includeFiles .md # This will include all markdown files
```
```
Git-Pretty -includeFiles README.md, LICENSE.md # This will only include the README.md and the LICENSE.md in the output
```

#### Excluding Certain Files
```
Git-Pretty -excludeFiles README.md, # This will exclude the README.md (and .gitignore) from the output
```
```
Git-Pretty -excludeFiles README.md, LICENSE.md # This will exclude the README.md and the LICENSE.md (and .gitignore) from the output
```
```
Git-Pretty -excludeFiles .md # This will exclude all markdown files (and .gitignore) from the output
```

#### Including & Excluding Certain Files
```
Git-Pretty -includeFiles .md -excludeFiles LICENSE.md # This will include all markdown files except LICENSE.md
```

Can easily be combined with other cmdlets, such as
```
Git-Pretty | Set-Clipboard
```

### Output
This script outputs the contents of each file in a git repository (not including .gitignore files) in a nice format.


## [Test-Git-Repo](/Test-Git-Repo.ps1)
### Description
Error free method of checking if a directory is part of a git repository.

### Dependencies
- [git](https://git-scm.com/)

### Usage
```
Test-Git-Repo
```

### Output
This script outputs 'true' if the current directory is part of a git repository and 'false' otherwise.
