commands.addUserCommand(
    ["toggleshowingmenutoolbar"],
    "Toggle the apperance of menu and toolbar",
    function() {
        if (options.get("gui").has("nonavigation")) {
            liberator.execute(":set gui='tabs,nomenu,navigation,addons,bookmarks'");
        } else {
            liberator.execute(":set gui='tabs,nomenu,nonavigation,noaddons,nobookmarks'");
        }
    }
)
