#!/usr/bin/env zsh

set -e

typeset -A requirements
requirements=(
  gsed "brew install gnu-sed"
  gpg "brew install gnupg"
  git-lfs "brew install git-lfs"
  go "brew install go"
  git-codereview "GO111MODULE=off go get -u golang.org/x/review/git-codereview"
)

need=()

for r in ${(k)requirements}; do
  if ! type ${r} >>&/dev/null; then
    need+="${requirements[$r]}"
  fi
done

if [[ $#need -gt 0 ]]; then
  echo "Missing requirements, to resolve run:"
  for i in ${need}; do
    echo "\t${i}"
  done
  exit 1
fi


typeset -A files
files=(
  zshrc ~/.zshrc
  gitconfig ~/.gitconfig
)

base=$(git rev-parse --show-toplevel)
source="${base}/source"

[[ $(hostname) =~ "salesforce.com" ]] && situation="work" || situation="home"

case ${situation} in
  work)
    files[zshrc.work.gpg]="$HOME/.zshrc.work"
    export EMAIL="emuller@salesforce.com"
    export KEY="FC5833DB021899A5"
  ;;
  home)
    export EMAIL="freeformz@gmail.com"
    export KEY="4425D7E25D8A8486"
  ;;
  *)
    echo "unknown situation"
    exit 1
  ;;
esac

for f in ${(k)files}; do
  local tgt=${files[$f]}
  if [[ "${f:t:e}" == "gpg" ]]; then
    echo "processing gpg encrypted file: ${f}"
    gpg --yes --output "${tgt}" --decrypt "${source}/$f"
  else
    cp -f "${source}/$f" ${tgt} 
  fi
  gsed -i -e "s:__HOME__:${HOME}:g" ${tgt}
  gsed -i -e "s:__EMAIL__:${EMAIL}:g" ${tgt}
  gsed -i -e "s:__KEY__:${KEY}:g" ${tgt}
done