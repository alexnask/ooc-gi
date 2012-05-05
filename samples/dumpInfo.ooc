use gdk, gtk, gi
import gi/[Repository, BaseInfo]
import gtk/Gtk
// Add +-Wl,-no-as-needed option to rock to compile

error: Error*
rep := Repository getDefault()
rep prependSearchPath("./")
rep require("Gtk", "2.0", RepositoryLoadFlags lazy, error&)
if(error) {
    "Could not load Gtk 2.0 GIR" println()
    "Reason: %s" format(error@ message)
} else {
    "Loaded Gtk 2.0 GIR" println()
    for(index in 0 .. rep getNInfos("Gtk")) {
        info := rep getInfo("Gtk", index)
        "Attributes of entry %s of type %s" format(info getName(), info getType() toString()) println()
        info eachAttribute(|name, value|
            "   %s : %s" format(name, value) println()
        )
        info unref()
    }
}

