#!/usr/bin/env nu

def main [input: path, output: path]: nothing -> nothing {
  (open ($env.FILE_PWD | path join base16-map.json)) 
  | reduce -f (open --raw $input) {|it, acc|
    $acc | str replace -a $it.find $it.replace
  }
  | save $output -f
}
