{
    programs.nixvim.globals.mapleader = " ";

    programs.nixvim.opts = {

        updatetime = 100; 
        relativenumber = true; 
        number = true; 



        modeline = true; 
        modelines = 100; 

        incsearch = true; 
        inccommand = "split"; 
        ignorecase = true; 
        smartcase = true; 
        scrolloff = 8; 
        cursorline = false; 
        cursorcolumn = false; 
        laststatus = 3; 
        fileencoding = "utf-8"; 
        termguicolors = true; 
        wrap = false; 
        tabstop = 4; 
        shiftwidth = 4; 
        expandtab = true; 
        autoindent = true; 
        textwidth = 0; 

    };
    programs.nixvim = {
        enable = true;
    };
}
