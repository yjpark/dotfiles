commands.addUserCommand(
    ["toggleshowingmenutoolbar"],
    "Toggle the apperance of menu and toolbar",
    function() {
        if (options.get("gui").has("nonavigation")) {
            liberator.execute(":set gui='tabs,nomenu,nobookmarks,navigation,addons'");
        } else {
            liberator.execute(":set gui='tabs,nomenu,nobookmarks,nonavigation,noaddons'");
        }
    }
)
