commands.addUserCommand(["toggleshowingmenutoolbar"],
    "Toggle the apperance of menu and toolbar",
    function() {
        if (options.get("guioptions").has("T")) {
            liberator.execute(":set guioptions='Ns'");
        } else {
            liberator.execute(":set guioptions='NmBTs'");
        }
    }
)
