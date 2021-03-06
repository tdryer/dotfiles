import XMonad
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.Reflect
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

main = do
    xmonad myConfig

myConfig = defaultConfig
    { modMask = mod4Mask -- use super key
    , layoutHook = myLayout
    , borderWidth = 2
    , startupHook = myStartup
    , handleEventHook = fullscreenEventHook
    }

myStartup = do
    spawn "xmobar"
    setWMName "LG3D" -- minecraft/java workaround

myLayout = avoidStruts $ smartBorders $ tiled ||| Mirror tiled ||| Full ||| im_double
    where
        im_double = withIM (1/10) (Title "Buddy List") $ reflectHoriz doubleTiled
        doubleTiled = Tall 1 delta ratio
        -- default tiling algorithm partitions the screen into two panes
        tiled   = Tall nmaster delta ratio
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by master pane
        ratio   = 1/2
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100

