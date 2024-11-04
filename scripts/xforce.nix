{ pkgs }: (pkgs.writeShellApplication {
  name = "tpcp";
  text = ''
    if [ -f "$HOME/template.cpp" ]; then
        cp "$HOME/template.cpp" "./template.cpp"
        echo "Copied template.cpp from home directory"
    else
        echo "No template.cpp found in home directory"
    fi
    
    # Check and create each file individually
    if [ ! -f "main.cpp" ]; then
        touch "main.cpp"
        echo "Created main.cpp"
    else
        echo "main.cpp already exists"
    fi
    
    if [ ! -f "input.txt" ]; then
        touch "input.txt"
        echo "Created input.txt"
    else
        echo "input.txt already exists"
    fi
    
    if [ ! -f "output.txt" ]; then
        touch "output.txt"
        echo "Created output.txt"
    else
        echo "output.txt already exists"
    fi
    
    if [ ! -f "debug.txt" ]; then
        touch "debug.txt"
        echo "Created debug.txt"
    else
        echo "debug.txt already exists"
    fi
  '';
})
