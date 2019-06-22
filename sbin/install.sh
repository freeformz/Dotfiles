#!/usr/bin/env zsh

typeset -A files

files=(
  zshrc ~/.zshrc
  zshrc.work.gpg ~/.zshrc.work
  gitconfig ~/.gitconfig
)

base=$(git rev-parse --show-toplevel)
source="${base}/source"

if [ -f ~/.zshrc.work ]; then
  export EMAIL="emuller@salesforce.com"
  export KEY="FC5833DB021899A5"
else
  export EMAIL="freeformz@gmail.com"
  export KEY=""
fi

for f in ${(k)files}; do
  local tgt=${files[$f]}
  if [[ "${f:t:e}" == "gpg" ]]; then
    echo "processing gpg encrypted file: ${f}"
    gpg --yes --output ${tgt} --decrypt "${source}/$f"
  else
    cp -f "${source}/$f" ${tgt} 
  fi
  gsed -i -e "s:__HOME__:${HOME}:g" ${tgt}
  gsed -i -e "s:__EMAIL__:${EMAIL}:g" ${tgt}
  gsed -i -e "s:__KEY__:${KEY}:g" ${tgt}
done