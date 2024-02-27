import XMonad
import Data.Monoid
import System.Exit
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.IO

-- System terminal
myTerminal :: String
myTerminal = "alacritty"

-- System web browser
myWebBrowser :: String
myWebBrowser = "firefox"

-- System application launcher
myAppLauncher :: String
myAppLauncher = "dmenu_run"

-- Window focus
canMouseFocus :: Bool
canMouseFocus  = True

canClickFocus :: Bool
canClickFocus  = False

-- Window inner Gaps
windowGaps :: Int
windowGaps = 10

-- Window border width
myWindowBorder :: Dimension
myWindowBorder = 3

-- Main binding mask
myModMask = mod4Mask

-- Window Colors
focusedWindowBorder :: String
focusedWindowBorder = "#a685c1"

inactiveWindowBorder :: String
inactiveWindowBorder = "#404554"

-- Workspaces icons
myWorkspaces = ["bin","boot","dev","etc","home"]

-- Startup Hook
myStartupHook :: X ()
myStartupHook = do
  spawn "~/.fehbg"   
  spawnOnce "picom"

-- Status bar
myBar :: String
myBar = "xmobar"
barPP = xmobarPP { ppCurrent = xmobarColor "#1b1f24" "" . wrap "<" ">" }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Key Bindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [((modm, xK_Return), spawn $ XMonad.terminal conf)  -- Terminal
    ,((modm, xK_p), spawn (myAppLauncher))              -- Open application launcher	
    ,((modm, xK_f), spawn (myWebBrowser))               -- Open browser
    ,((modm, xK_q), kill)			                          -- Close window
    ,((modm, xK_s), windows W.swapMaster) 		          -- Swap focused and master
    ,((modm, xK_d), sendMessage Shrink)                 -- Shrink master area
    ,((modm, xK_i), sendMessage Expand)			            -- Expand master area
    ,((modm, xK_t), withFocused $ windows . W.sink)     -- Window back to tiling
    ,((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))  -- Kill xmonad
    ,((modm .|. shiftMask, xK_r), spawn "xmonad --recompile; xmonad --restart")] -- Restart xmonad
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-- Layout hook
myLayoutHook = spacing windowGaps $ tiled |||  Mirror tiled ||| Full 
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

-- Main config
main = xmonad =<< statusBar myBar barPP toggleStrutsKey defaults

defaults = def {
    terminal           = myTerminal,
    focusFollowsMouse  = canMouseFocus,
    clickJustFocuses   = canClickFocus,
    borderWidth        = myWindowBorder,
    modMask            = myModMask,
    layoutHook         = myLayoutHook,
    workspaces         = myWorkspaces,
    normalBorderColor  = inactiveWindowBorder,
    focusedBorderColor = focusedWindowBorder,
    startupHook        = myStartupHook,
    keys               = myKeys
}
