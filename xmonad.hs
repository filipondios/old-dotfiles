import XMonad
import Data.Monoid
import System.Exit
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.UrgencyHook
import XMonad.Util.SpawnOnce
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Util.Hacks (windowedFullscreenFixEventHook, javaHack, trayerAboveXmobarEventHook, trayAbovePanelEventHook, trayerPaddingXmobarEventHook, trayPaddingXmobarEventHook, trayPaddingEventHook)
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
  setWMName "LG3D"

-- Status bar
-- myBar :: String
-- myBar = "xmobar"
-- barPP = xmobarPP { ppCurrent = xmobarColor "#1b1f24" "" . wrap "<" ">" }
-- toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Key Bindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [((modm, xK_Return), spawn $ XMonad.terminal conf)  -- Terminal
    ,((modm, xK_p), spawn (myAppLauncher))              -- Open application launcher	
    ,((modm, xK_f), spawn (myWebBrowser))               -- Open browser
    ,((modm, xK_q), kill)                               -- Close window
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

-- Workspace window count function
windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

main = do
  xmproc <- spawnPipe "xmobar /home/tux/.config/xmonad/xmobar"
  xmonad $ def 
    {
      -- Simple stuff
      terminal           = myTerminal,
      focusFollowsMouse  = canMouseFocus,
      borderWidth        = myWindowBorder,
      modMask            = myModMask,
      workspaces         = myWorkspaces,
      normalBorderColor  = inactiveWindowBorder,
      focusedBorderColor = focusedWindowBorder,
      keys = myKeys,

      -- Hooks, Layouts, ...
      -- manageHook = manageDocks <+> manageHook defaultConfig,
      layoutHook = avoidStruts $ myLayoutHook,
      -- handleEventHook = handleEventHook -- <+> docksEventHook defaultConfig,

      logHook = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc,
          -- Current workspace
          ppCurrent = xmobarColor "#adadff" "" . wrap 
            ("<box type=Bottom width=2 mb=2 color=#adadff>") "</box>",
          -- Visible but not current workspace
          ppVisible = xmobarColor "#adadff" "",
          -- Hidden workspace
          ppHidden = xmobarColor "#b39692" "", -- . wrap
          -- ("<box type=Top width=2 mt=2 color=#ffd5cd>") "</box>",
          -- Hidden workspaces (no windows)
          ppHiddenNoWindows = xmobarColor "#ffd5cd" "",
          -- Title of active window
          ppTitle = xmobarColor "#8f9ba6" "" . shorten 60,
          -- Separator character
          ppSep =  "<fc=#484c5b> <fn=1>|</fn> </fc>",
          -- Urgent workspace
          ppUrgent = xmobarColor "#c47eb7" "" . wrap "!" "!",
          -- Adding # of windows on current workspace to the bar
          ppExtras  = [windowCount],
          -- order of things in xmobar
          ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
        },
      startupHook = myStartupHook
    }


