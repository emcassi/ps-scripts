$repoStatus = Test-Git-Repo

if ($repoStatus -match "false") {
  Write-Host "Not a Git repository. Exiting."
  exit
}

$gitFiles = git ls-files
foreach ($file in $gitFiles) {
  if (-not ($file -match ".gitignore")) {
    echo "`n`n[File]"
    echo "$file`n`n"
    Get-Content $file | echo 
  }
}
