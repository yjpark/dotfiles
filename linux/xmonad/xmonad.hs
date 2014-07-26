import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ToggleLayouts
import XMonad.Hooks.DynamicLog
import XMonad.Actions.GridSelect
import XMonad.Layout.MouseResizableTile
import XMonad.Util.Themes
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders

--For the log applet
--https://github.com/alexkay/xmonad-log-applet/blob/master/xmonad.hs
import XMonad.Hooks.DynamicLog

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

main :: IO ()
main = do
  dbus <- D.connectSession
  getWellKnownName dbus
  xmonad $ gnomeConfig {
  	modMask = mod4Mask	-- User Super instead of Alt
	  , terminal = "terminator"
	  , manageHook = manageHook defaultConfig <+> manageDocks <+> myManageHook
	  , layoutHook = desktopLayoutModifiers $ smartBorders mouseResizableTile ||| smartBorders mouseResizableTileMirrored ||| smartBorders (tabbed shrinkText (theme kavonAutumnTheme))
	  , logHook = dynamicLogWithPP(prettyPrinter dbus)
  }

	`additionalKeysP` myKeys

myManageHook = composeAll [
	resource =? "tilda" --> doFloat
	, className =? "Guake.py" --> doFloat
	, resource =? "qjackctl.bin" --> doFloat
	, resource =? "stardict" --> doFloat
	, resource =? "Do" --> doFloat
	, className =? "Do" --> doFloat
	-- , isInProperty "_NET_WM_WINDOW_TYPE" "_NET_WM_WINDOW_TYPE_SPLASH" --> doFloat
	]

myKeys = [
	("<F1>", spawn "terminator")
	, ("<F2>", spawn "firefox")
	, ("<F3>", spawn "xbmc")
	, ("M-f", sendMessage $ Toggle "Full")
	, ("M1-<Tab>", windows W.swapDown)
	, ("M1-S-<Tab>", windows W.swapUp)
	-- , ("M-<KP_1>", toggleOrView "1")
	, ("M-<Up>", sendMessage Shrink)
	, ("M-<Down>", sendMessage Expand)
	, ("M-<Left>", windows W.focusUp)
	, ("M-<Right>", windows W.focusDown)
	, ("M-h", sendMessage Shrink)
	, ("M-l", sendMessage Expand)
	, ("M-j", windows W.focusUp)
	, ("M-k", windows W.focusDown)
	-- workspace control
	-- , ("C-<Left>", prevWS)
	-- , ("C-<Right>", nextWS)
	-- , ("C-<Up>", toggleWS)
	-- , ("C-<Down>", toggleWS)
	-- screen control
	, ("C-<Left>", prevScreen)
	, ("C-<Right>", nextScreen)
	, ("C-<Up>", shiftNextScreen)
	, ("C-<Down>", swapPrevScreen)
	-- GridSelect related
	, ("C-<Tab>", goToSelected defaultGSConfig)
	]
	++ -- switch to workspace with Control-Num
	[ (otherModMasks ++ "C-" ++ [key], action tag)
	     | (tag, key)  <- zip myWorkspaces "123456789"
	     , (otherModMasks, action) <- [ ("", windows . W.view) -- was W.greedyView
	                                  , ("S-", windows . W.shift)]
	]
	++ -- switch to workspace with Control-Num (numpad)
	[ (otherModMasks ++ "C-" ++ key, action tag)
	     | (tag, key)  <- zip myWorkspaces numPadKeys
	     , (otherModMasks, action) <- [ ("", windows . W.view) -- was W.greedyView
	                                  , ("S-", windows . W.shift)]
	]
	++ -- switch to window with Control-Num
	[ (otherModMasks ++ "M-" ++ [key], action)
	     | (key)  <- "123456789"
	     , (otherModMasks, action) <- [ ("", windows W.focusUp)]
	]
	++ -- switch to window with Win-Num (numpad)
	[ (otherModMasks ++ "M-" ++ key, action)
	     | (key)  <- numPadKeys
	     , (otherModMasks, action) <- [ ("", windows W.focusUp)]
	]

tall = Tall 1 (3/100) (55/100)

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

-- Non-numeric num pad keys, sorted by number
numPadKeys = [ "<KP_End>",  "<KP_Down>",  "<KP_Page_Down>" -- 1, 2, 3
             , "<KP_Left>", "<KP_Begin>", "<KP_Right>"     -- 4, 5, 6
             , "<KP_Home>", "<KP_Up>",    "<KP_Page_Up>"   -- 7, 8, 9
             ]

-- Log Applet
prettyPrinter :: D.Client -> PP
prettyPrinter dbus = defaultPP
    { ppOutput = dbusOutput dbus
    , ppTitle = pangoSanitize
    , ppCurrent = pangoColor "cyan" . wrap "[" "]" . pangoSanitize
    , ppVisible = pangoColor "yellow" . wrap "(" ")" . pangoSanitize
    , ppHidden = const ""
    , ppUrgent = pangoColor "red"
    , ppLayout = pangoColor "green" . layoutName
    , ppSep = " "
    }

getWellKnownName :: D.Client -> IO ()
getWellKnownName dbus = do
  D.requestName dbus (D.busName_ "org.xmonad.Log")
                [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
  return ()

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal (D.objectPath_ "/org/xmonad/Log") (D.interfaceName_ "org.xmonad.Log") (D.memberName_ "Update")) {
            D.signalBody = [D.toVariant ("<b>" ++ (UTF8.decodeString str) ++ "</b>")]
        }
    putStrLn "Test"
    D.emit dbus signal

pangoColor :: String -> String -> String
pangoColor fg = wrap left right
  where
    left = "<span foreground=\"" ++ fg ++ "\">"
    right = "</span>"

pangoSanitize :: String -> String
pangoSanitize = foldr sanitize ""
  where
    sanitize '>' xs = "&gt;" ++ xs
    sanitize '<' xs = "&lt;" ++ xs
    sanitize '\"' xs = "&quot;" ++ xs
    sanitize '&' xs = "&amp;" ++ xs
    sanitize x xs = x:xs

layoutName :: String -> String
layoutName "MouseResizableTile" = "H"
layoutName "Mirror MouseResizableTile" = "V"
layoutName "Tabbed Simplest" = "T"
layoutName str = str

{-
--import Codec.Binary.UTF8.String (decodeString)

pangoColor :: String -> String -> String
pangoColor fg = wrap left right
 where
  left  = "<span foreground=\"" ++ fg ++ "\">"
  right = "</span>"

sanitize :: String -> String
sanitize [] = []
sanitize (x:rest) | fromEnum x > 127 = "&#" ++ show (fromEnum x) ++ "; " ++
                                       sanitize rest
                  | otherwise        = x : sanitize rest


$ defaultPP {
                   ppOutput   = \ str -> do
                     let str'  = "<span font=\"Microsoft YaHei 14\">" ++ decodeString str ++ 
                                 "</span>"
                         str'' = sanitize str'
                     msg <- newSignal "/org/xmonad/Log" "org.xmonad.Log" 
                                "Update"
                     addArgs msg [String str'']
                     -- If the send fails, ignore it.
                     send dbus msg 0 `catchDyn`
                       (\ (DBus.Error _name _msg) ->
                         return 0)
                     return ()
                 , ppTitle    = pangoColor "#00ff00" . shorten 128
                 , ppCurrent  = pangoColor "#ff0000" . wrap "[" "]"
                 , ppVisible  = pangoColor "#bb66bb" . wrap "(" ")"
                 , ppHidden   = pangoColor "#aaaaaa" . wrap "" ""
                 -- , ppHidden   = wrap " " " "
                 , ppUrgent   = pangoColor "red"
-}
