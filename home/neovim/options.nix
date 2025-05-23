{
    programs.nixvim.globals.mapleader = " ";

    programs.nixvim.opts = {

        updatetime     = 100;
        relativenumber = true;
        number         = true;
        showmode       = false;
        showcmd        = false;

        modeline       = true;
        modelines      = 100;

        incsearch      = true;
        inccommand     = "split";
        ignorecase     = true;
        smartcase      = true;
        scrolloff      = 8;
        cursorline     = false;
        cursorcolumn   = false;
        laststatus     = 3;
        fileencoding   = "utf-8";
        termguicolors  = true;
        wrap           = false;
        tabstop        = 2;
        shiftwidth     = 2;
        expandtab      = true;
        autoindent     = true;
        textwidth      = 0;
    };
    programs.nixvim = {
        enable = true;
    };
}
