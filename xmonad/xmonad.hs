-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.Reflect

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig
    { modMask = mod4Mask
    , layoutHook = myLayout
    , borderWidth = 2
    }

myLayout = tiled ||| Mirror tiled ||| Full ||| withIM (1/10) (Title "Buddy List") doubleTiled
    where
        doubleTiled = Tall 2 delta ratio
        -- default tiling algorithm partitions the screen into two panes
        tiled   = Tall nmaster delta ratio
        -- The default number of windows in the master pane
        nmaster = 1
        -- Default proportion of screen occupied by master pane
        ratio   = 1/2
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100

