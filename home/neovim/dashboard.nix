{
    programs.nixvim = {
        plugins.dashboard = {
            enable = true;
            settings = {
                hide.tabline = true;
                theme = "hyper";
                config = {
                    header = [
                        "██╗   ██╗ ██████╗     ██╗  ██╗ ██████╗     ███████╗ ██████╗ "
                        "╚██╗ ██╔╝██╔═══██╗    ██║ ██╔╝██╔═══██╗    ██╔════╝██╔═══██╗"
                        " ╚████╔╝ ██║   ██║    █████╔╝ ██║   ██║    ███████╗██║   ██║"
                        "  ╚██╔╝  ██║   ██║    ██╔═██╗ ██║   ██║    ╚════██║██║   ██║"
                        "   ██║   ╚██████╔╝    ██║  ██╗╚██████╔╝    ███████║╚██████╔╝"
                        "   ╚═╝    ╚═════╝     ╚═╝  ╚═╝ ╚═════╝     ╚══════╝ ╚═════╝ "
                        "                    今日の敵は、明日の友                    "
                        ""
                        ""
                    ];
                    footer = [ " " " " "BOKU NO OCHINCHIN WA CHISAI" ];
                    shortcut = [
                    {
                        desc = "  prevSession ";
                        group = "Number";
                        key = ".";
                        action = "<cmd>print 'poda punda'";
                    }
                    {
                        desc = " quit ";
                        group = "DiagnosticError";
                        key = "q";
                        action = "qa";
                    }
                    {
                        desc = "  sessions ";
                        group = "DiagnosticHint";
                        key = "l";
                        action = "<cmd>print 'poda punda'";
                    }
                    ];
                };
            };
        };

    };
}
