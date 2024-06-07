set -e
${USE_GHPROXY:=false}

mypath=`realpath $0`
cd `dirname $mypath`
pwd

REPO=BITNP/BIThesis

CACHE_FILE=latest.json

CACHE_CUR_VERSION_FILE=cache_current_version.txt

# download latest files if not cached

print "get current version"

if [[ -f "$CACHE_CUR_VERSION_FILE" ]] {
  CUR_VERSION=`cat $CACHE_CUR_VERSION_FILE`
} else {
  curl -L -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/$REPO/releases/latest > $CACHE_FILE
  CUR_VERSION=""
}

print "get current cache"
ZIP_URL=`cat $CACHE_FILE | jq -r '.assets|.[] | {browser_download_url} | .browser_download_url'`
VERSION=`cat $CACHE_FILE | jq -r '.tag_name'`

ZIP_URL=`echo $ZIP_URL | tr '\n' ' '`
ZIP_URL=(${=ZIP_URL})

if [[ $VERSION != $CUR_VERSION ]] {
  print try download latest version: $VERSION.
  print '\n'
  print -l $ZIP_URL

  for i ($ZIP_URL) {
    if [[ $i == *.zip ]] {
      if [[ $USE_GHPROXY == true ]] {
        wget https://ghproxy.com/$i
      } else {
        wget $i
      }
    }
  }
  echo $VERSION > $CACHE_CUR_VERSION_FILE
} else {
  echo $VERSION already downloaded.
}

echo current dir: $PWD

for i ($ZIP_URL){
  if [[ $i == *.zip ]] {
    file_name=${i:t}
    unzip -o $file_name
    dir_name=${file_name%.zip}

    if [[ -n $FILTER ]] && [[ $FILTER != $dir_name ]] {
      # skip this file
      continue
    }

    echo "============== start $i ==============="

    # build latest release version on github
    cd $dir_name
    rm -f '*.pdf *.aux'
    latexmk
    cd -

    # build current version
    cd ../templates/$dir_name
    rm -f '*.pdf *.aux'
    latexmk
    cd -

    diff-pdf --view ./$dir_name/main.pdf ../templates/$dir_name/main.pdf
    echo "============== end $i ==============="
  }
}
