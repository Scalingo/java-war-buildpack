#!/usr/bin/env bash

export_env_dir() {
  env_dir=$1
  whitelist_regex=${2:-''}
  blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH|JAVA_OPTS|JAVA_TOOL_OPTIONS)$'}
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
      export "$e=$(cat $env_dir/$e)"
      :
    done
  fi
}

real_curl=$(which curl)
function curl() {
  local http_url=''
  local write_file=''
  local create_output_filename=''
  local curl_args=$*

  for i ; do
    case "$i" in
    --retry)
      shift; shift;;
    -O|--remote-name)
      create_output_filename=true
      shift;;
    -o|--output)
      if [[ ${2} != "-" ]]
      then
        write_file=${2}
      fi
      shift; shift;;
    -s|--silent)
      shift;;
    -L|--location|--)
      http_url=${2}; shift;
      filename=$(sed 's/[:\/]/_/g' <<< ${http_url})
      shift;
    esac
  done

  ## Do we have to generate a filename ourselves to write to?
  if [[ -n "$create_output_filename" ]]
  then
    write_file=$(echo ${http_url} | rev | cut -d\/ -f1 | rev)
  fi

  if test -f $BP_DIR/dependencies/$filename
  then
    ## Was a file to write to provided?
    if [[ -n "$write_file" ]]
    then
      ## Write to file
      cat $BP_DIR/dependencies/$filename > $write_file
    else
      # Stream output
    cat $BP_DIR/dependencies/$filename
    fi
  else
    $real_curl $curl_args
  fi
}
