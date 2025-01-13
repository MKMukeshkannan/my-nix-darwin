{ pkgs }: pkgs.writeShellScriptBin "cses" ''
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 {-p | -c}"
  exit 1
fi

current_dir=$(basename "$PWD")
echo $current_dir
if [[ "$current_dir" =~ '^\[.\] - (.+)$' ]]; then
  folder_name="$\{current_dir:5}"

  case "$1" in
    -p)
      new_name="[.]$folder_name"
      ;;
    -c)
      new_name="[x]$folder_name"
      ;;
    *)
      echo "Invalid argument. Use '-p' to replace with '.' or '-c' to replace with 'x'."
      exit 1
      ;;
  esac

  mv "$current_dir" "$new_name"
  echo "Folder renamed to: $new_name"
else
  echo $current_dir
  echo "Current folder does not match the expected pattern '[ ] - something'."
fi

''

