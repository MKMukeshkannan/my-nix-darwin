{ pkgs }: pkgs.writeShellScriptBin "mcd" ''
if [ -z "$1" ]; then
  echo "Please provide a directory name."
  exit 1
fi

# Create the directory
mkdir -p "$1"

# Change to the newly created directory
cd "$1" || exit

# Optionally, print the current directory
echo "Now in directory: $(pwd)"
''

