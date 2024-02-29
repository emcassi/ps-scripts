$gitRepo = $null
$gitRepo = git rev-parse --is-inside-work-tree 2>$null

if ($gitRepo -eq "true") {
  echo "true"
} else {
  echo "false"
}
