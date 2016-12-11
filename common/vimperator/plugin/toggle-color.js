commands.addUserCommand(
    ["toggleusedocumentcolor"],
    "Toggle the value of use_document_color",
    function(args) {
        var udc=options.getPref("browser.display.use_document_colors", true);
        var dcu = options.getPref("browser.display.document_color_use", 1);
        var yjpark_color_index = options.getPref("browser.display.yjpark_color_index", 0);
        var log = "before: udc = " + udc + ", color_index = " + yjpark_color_index;
        var fg = "#000000";
        var bg = "#ffffff";
        if (udc) {
            udc = false;
            dcu = 2;
            fg = "#839496";
            bg = "#002b36";
            yjpark_color_index = 0;
        } else {
            if (yjpark_color_index == 0) {
                //dactyl.clipboardWrite("AAAA");
                fg = "#657b83";
                bg = "#fdf6e3";
            } else if (yjpark_color_index >= 1) {
                //dactyl.clipboardWrite("BBBB");
                udc = true;
                dcu = 1;
                fg = "#000000";
                bg = "#ffffff";
            }
            yjpark_color_index = yjpark_color_index + 1;
        }
        //dactyl.clipboardWrite(log + ", after: udc = " + udc + ", color_index = " + yjpark_color_index, true);
        options.setPref("browser.display.use_document_colors", udc);
        //Override the colors specified by the page with my selections above
        options.setPref("browser.display.document_color_use", dcu);
        options.setPref("browser.display.background_color", bg);
        options.setPref("browser.display.foreground_color", fg);
        options.setPref("browser.display.yjpark_color_index", yjpark_color_index);
    },
    {
    },
    true
)
