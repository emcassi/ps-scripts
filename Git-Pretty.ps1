# Collect params

param (
  [string[]]$includeFiles = @(),
  [string[]]$excludeFiles = @()
)

# Check if current directory is part of a git repository
# Exit if false
$repoStatus = Test-Git-Repo

if ($repoStatus -match "false") {
  Write-Host "Not a Git repository. Exiting."
  exit
}

# Detemine files to include
$excludeFiles += ".gitignore"

$gitFiles = git ls-files

$filesToFormat = @()


foreach ($file in $gitFiles) {
  $excludedSomething = $false
  foreach ($excludedFile in $excludeFiles) {
    if ($file -match $excludedFile) {
      $excludedSomething = $true
    }
  }
  if ($excludedSomething) {
    continue
  }
  if ($includeFiles.Count -gt 0) {
    foreach ($includedFile in $includeFiles) {
      if ($file -match $includedFile) {
        $filesToFormat += $file
      }
    }
  } else {
    $filesToFormat += $file
  }
}

# Print the formatted files
foreach ($file in $filesToFormat) {
  echo "`n`n[File]"
  echo "$file`n`n"
  Get-Content $file
}
