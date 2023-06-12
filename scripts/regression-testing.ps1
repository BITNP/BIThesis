# Convert from ./regression-testing.zsh by GPT-3.5-turbo
# Modified by humans

$ErrorActionPreference = "Stop"
$USE_GHPROXY = $true

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Path -Parent)
Write-Host (Get-Location)

$REPO = "BITNP/BIThesis"

$CACHE_FILE = "latest.json"

$CACHE_CUR_VERSION_FILE = "cache_current_version.txt"

# download latest files if not cached
Write-Host "get current version"

if (Test-Path $CACHE_CUR_VERSION_FILE) {
  $CUR_VERSION = Get-Content $CACHE_CUR_VERSION_FILE
}
else {
  $uri = "https://api.github.com/repos/$REPO/releases/latest"
  $headers = @{ "Accept" = "application/vnd.github.v3+json" }
  Invoke-RestMethod -Uri $uri -Headers $headers -OutFile $CACHE_FILE
  $CUR_VERSION = ""
}

Write-Host "get current cache"
$ZIP_URL = (Get-Content $CACHE_FILE | ConvertFrom-Json).assets.browser_download_url
$VERSION = (Get-Content $CACHE_FILE | ConvertFrom-Json).tag_name

$ZIP_URL = $ZIP_URL -split "`n"

if ($VERSION -ne $CUR_VERSION) {
  Write-Host "try download latest version: $VERSION."
  Write-Host $ZIP_URL

  foreach ($url in $ZIP_URL) {
    if ($url -like "*.zip") {
      $url = if ($USE_GHPROXY) { "https://ghproxy.com/$url" } else { $url }
      Invoke-WebRequest -Uri $url -OutFile (Split-Path -Leaf $url)
    }
  }

  $VERSION > $CACHE_CUR_VERSION_FILE
}
else {
  Write-Host "$VERSION already downloaded."
}

Write-Host "current dir: $(Get-Location)"

foreach ($url in $ZIP_URL) {
  if ($url -like "*.zip") {
    $file_name = Split-Path -Leaf $url
    Expand-Archive -LiteralPath $file_name -DestinationPath . -Force
    $dir_name = $file_name -replace "\.zip$"

    if ($FILTER -and $FILTER -ne $dir_name) {
      # skip this file
      continue
    }

    Write-Host "============== start $url ==============="

    # build latest release version on github
    Push-Location $dir_name
    Remove-Item -Path '*.pdf', '*.aux' -ErrorAction SilentlyContinue
    latexmk
    Pop-Location

    # build current version
    Push-Location "../templates/$dir_name"
    Remove-Item -Path '*.pdf', '*.aux' -ErrorAction SilentlyContinue
    latexmk
    Pop-Location

    diff-pdf --view "./$dir_name/main.pdf" "../templates/$dir_name/main.pdf"
    Write-Host "============== end $url ==============="
  }
}

Pop-Location
