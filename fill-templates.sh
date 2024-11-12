#!/bin/bash
IFS=$'\n' pkl_versions=($(< pkl-versions))

version_string=""

for i in "${!pkl_versions[@]}"; do
  if (( i == ${#pkl_versions[@]} - 1 )); then
    version_string+="and ${pkl_versions[i]}"
  elif (( i == ${#pkl_versions[@]} - 2 )); then
    version_string+="${pkl_versions[i]} "
  else
    version_string+="${pkl_versions[i]}, "
  fi
done

latest_pkl_version="${pkl_versions[$((${#pkl_versions[@]} - 1))]}"

echo "$version_string"
echo "$latest_pkl_version"

export version_string
export latest_pkl_version

gomplate -f templates/README.template.md -o README.md

platforms=("swift" "kotlin" "java" "doc")
IFS=$'\n' calls=($(< templates/calls.sh))

for i in "${!platforms[@]}"; do 
  call="${calls[$i]}"
  export call
  gomplate -f templates/entrypoint.template.sh -o "${platforms[$i]}/entrypoint.sh"
done