# Collect params

param (
  [string[]]$includeFiles = @(),
  [string[]]$excludeFiles = @()
)

# Check if current directory is part of a git repository
# Exit if false
$repoStatus = Test-Git-Repo

if ($repoStatus -match "false") {
  echo "Not a Git repository. Exiting."
  exit
}

# Detemine files to include
$excludeFiles += ".gitignore"

$filesToFormat = git ls-files | Where-Object { $_ -notin $excludeFiles -and ($includeFiles.Count -eq 0 -or $_ -in $includeFiles) }

# Print the formatted files
foreach ($file in $filesToFormat) {
  echo "`n`n[File]"
  echo "$file`n`n"
  Get-Content $file
}
