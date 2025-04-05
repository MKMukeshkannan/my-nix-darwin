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
        tabstop = 2; 
        shiftwidth = 2; 
        expandtab = true; 
        autoindent = true; 
        textwidth = 0; 
#        guicursor = ''
#          "n-v-c:block,i-ci-ve:hor20-Cursor,r-cr:hor20,o:hor50" .. 
#          ",i-ci:hor20-blinkwait300-blinkon200-blinkoff150" .. 
#          ",sm:block-blinkwait175-blinkon150-blinkoff175"
#        '';
    };
    programs.nixvim = {
        enable = true;
    };
}
