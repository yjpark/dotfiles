import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ToggleLayouts
--For the log applet
--import Control.OldException
--import Control.Monad
--import DBus
--import DBus.Connection
--import DBus.Message
import XMonad.Hooks.DynamicLog
import XMonad.Actions.GridSelect
import XMonad.Layout.MouseResizableTile
import XMonad.Util.Themes
import XMonad.Layout.Tabbed
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import Codec.Binary.UTF8.String (decodeString)

-- This retry is really awkward, but sometimes DBus won't let us get our
-- name unless we retry a couple times.

main :: IO ()
main = xmonad $ gnomeConfig {
	modMask = mod4Mask	-- User Super instead of Alt
	, terminal = "terminator"
	, manageHook = manageHook defaultConfig <+> manageDocks <+> myManageHook <+> fullscreenHook
  , handleEventHook = fullscreenEventHook
	, layoutHook = desktopLayoutModifiers $ smartBorders mouseResizableTile ||| smartBorders mouseResizableTileMirrored ||| smartBorders (tabbed shrinkText (theme kavonAutumnTheme))
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

fullscreenHook = composeAll
-- Allows focusing other monitors without killing the fullscreen
--  [ isFullscreen --> (doF W.focusDown <+> doFullFloat)
 
-- Single monitor setups, or if the previous hook doesn't work
  [ isFullscreen --> doFullFloat
    -- skipped
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


