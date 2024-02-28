-- 
--
-- Based on 
-- Taurus Omar's configuration
-- TaurusOmar.com
-- @TaurusOmar_
-- https://github.com/TaurusOmar
--
--
import XMonad
import XMonad.Config.Desktop
import Data.Monoid
import Data.Maybe (isJust)
import System.IO (hPutStrLn)
import XMonad.Prompt
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce
import XMonad.Util.Run (spawnPipe)

-- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops 
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.SetWMName

-- Actions
import XMonad.Actions.Promote
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (WSType(..))
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.UpdatePointer
import XMonad.Prompt.ConfirmPrompt

-- Layouts modifiers
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.Spacing (spacing)
import XMonad.Layout.NoBorders
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.WindowArranger (windowArrange)
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts)

-- Layouts
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.Accordion
import XMonad.Layout.Spacing
import XMonad.Layout.WindowNavigation
import XMonad.Layout.SubLayouts
import XMonad.Layout.Simplest
import XMonad.Layout.Spiral

--
--
-- End of imports
-- Now just config!
--
--

-- Basic Configuration
myFont        = "Ubuntu Bold 24"
myTerminal    = "alacritty"
myTextEditor  = "nvim"
myBorderWidth = 3
myModMask     = mod4Mask

-- Window Border Colors
focusedColor  = "#212335"
inactiveColor = "#212335"

-- Xmobar Module Colors
currentWorkspaceColor = "#a385dc"
visibleWorkspaceColor = "#97a4a0"
hiddenWorkspaceColor  = "#97a4a0"
noWinWorkscaceColor   = "#464c5b"
urgentWorkspaceColor  = "#fd6b85" 
xmobarTitleColor      = "#a2b5ce"
xmobarSeparatorColor  = "#fd6b85"

-- XPrompt Colors
xpBackgroundColor = "#0d0f18"
xpForegroundColor = "#97a4a0"
xpBorderColor     = "#212335"
xpLightBackgroundColor = "#458588"
xpDarkBackgroundColor  = "#ffffff"

-- XPrompt Font
xpFont :: String 
xpFont = "xft:Ubuntu:pixelsize=24:antialias=true:hinting=true"

-- Command To Init Xmobar
initXmobar :: String 
initXmobar  = "xmobar -x 0 ~/.config/xmobar/xmobarrc0"

-- Function that obtains the number of 
-- windows in a workspace
windowCount :: X(Maybe String)
windowCount = gets $
  Just .
  show .
  length .
  W.integrate' .
  W.stack .
  W.workspace .
  W.current .
  windowset

-- Xmonad Start - 
-- Program starting point
main :: IO()
main = do
  xmproc0 <- spawnPipe (initXmobar)

  -- Xmonad Global config
  xmonad $ ewmh desktopConfig {
    manageHook = 
      (isFullscreen --> doFullFloat) <+>
      myManageHook <+>
      manageHook desktopConfig <+>
      manageDocks,
      
    -- Xmobar Modules In Real Time
    logHook = dynamicLogWithPP xmobarPP {
      ppOutput = \x -> hPutStrLn xmproc0 x
      ,ppCurrent = xmobarColor (currentWorkspaceColor) "" . wrap "[" "]"
      , ppVisible         = xmobarColor (visibleWorkspaceColor) ""
      , ppHidden          = xmobarColor (hiddenWorkspaceColor) "" . wrap "" ""
      , ppHiddenNoWindows = xmobarColor (noWinWorkscaceColor) ""
      , ppTitle           = xmobarColor (xmobarTitleColor) "" . shorten 60
      , ppSep             =  "<fc=" ++ (xmobarSeparatorColor) ++ "> => </fc>"
      , ppUrgent          = xmobarColor (urgentWorkspaceColor) "" . wrap "!" "!"
      , ppExtras          = [windowCount]
      , ppOrder           = \(ws:l:t:ex) -> [ws,l]++ex++[t]
    } >>  updatePointer (0.5, 0.5) (0, 0)
        
    -- Easy And Basic Stuff
    , modMask            = myModMask
    , terminal           = myTerminal
    , startupHook        = myStartupHook
    , layoutHook         = myLayoutHook
    , workspaces         = myWorkspaces
    , borderWidth        = myBorderWidth
    , normalBorderColor  = inactiveColor
    , focusedBorderColor = focusedColor
  } `additionalKeysP` myKeys

-- Custom Startup Hook
myStartupHook :: X()
myStartupHook = do
  spawn "~/.fehbg"
  spawnOnce "picom &"
  setWMName "LG3D"

--- Manage Grid Colors
myColorizer :: Window -> Bool -> X (String, String)
myColorizer = colorRangeFromClassName
  (0x28,0x28,0x28)
  (0x28,0x28,0x28)
  (0x28,0x28,0x28)
  (0xd5,0xc4,0xa1)
  (0xff,0xff,0xff)

-- Manage Grid Dimensions
mygridConfig :: (Window -> Bool -> X (String, String)) -> GSConfig Window
mygridConfig colorizer = (buildDefaultGSConfig myColorizer) {
  gs_cellheight   = 200,
  gs_cellwidth    = 400,
  gs_cellpadding  = 10,
  gs_originFractX = 0.5,
  gs_originFractY = 0.5,
  gs_font         = xpFont
}

-- Function to Spawn the selected Grid 
spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
  where conf = def {
    gs_cellheight   = 225,
    gs_cellwidth    = 450,
    gs_cellpadding  = 10,
    gs_originFractX = 0.5,
    gs_originFractY = 0.5,
    gs_font         = xpFont
  }

-- XPrompt Configurations
dpvXPConfig :: XPConfig
dpvXPConfig = def {
  font                = xpFont,
  bgColor             = xpBackgroundColor,
  fgColor             = xpForegroundColor,
  bgHLight            = xpLightBackgroundColor,
  fgHLight            = xpDarkBackgroundColor,
  borderColor         = xpBorderColor,
  promptBorderWidth   = 0,
  position            = Top,
  height              = 55,
  historySize         = 256,
  historyFilter       = id,
  defaultText         = [],
  autoComplete        = Just 10000,
  showCompletionOnTab = False,
  alwaysHighlight     = True,
  maxComplRows        = Nothing
}

dpvXPConfig' :: XPConfig
dpvXPConfig' = dpvXPConfig {
  autoComplete = Nothing
}

-- Function to ask for exiting
-- Xmonad confirmation
exitPrompt :: X ()
exitPrompt = do
  confirmPrompt dpvXPConfig "Quit XMonad?: " $ io exitSuccess

-- System Key Bindings
myKeys =
  [("M-S-r", spawn "xmonad --recompile && xmonad --restart"),
   ("M-S-q", exitPrompt),                           -- Quit Xmonad
   ("M-q", kill1),                                  -- Kill focused window
   ("M-<Delete>", withFocused $ windows . W.sink),  -- Restart floating window
  
   -- Show Text Editors Menu
   (("M-C-e"), spawnSelected'
   [("VsCode", "code"), -- Open VsCode
    ("Neovim", "nvim"), -- Open Neovim
    ("Vim", "vim")]),   -- Open vim

   -- System Settings 
   (("M-C-a"), spawnSelected'
   [("Lxappearance", "lxappearance"),  -- Open lxappearance
    ("Btop", myTerminal ++ "-e btop"), -- Open btop
    ("Terminal", myTerminal)]),        -- Open terminal

   -- URLs Menu
   (("M-C-s"), spawnSelected'
   [("GitHub", "firefox https://github.com/dpv927"), -- Open My Github
    ("ChatGPT", "firefox https://chat.openai.com"),  -- Open ChatGPT
    ("Youtube", "firefox https://youtube.com"),      -- Open Youtube
    ("Reddit", "firefox https://reddit.com"),        -- Open Reddit
    ("Chess.com", "firefox https://chess.com")]),    -- Open Chess.com

   -- Window Navigation
   ("M-m", windows W.focusMaster),     -- Focus master window in stack
   ("M-<Down>", windows W.focusDown),  -- Focus next window in stack
   ("M-<Up>", windows W.focusUp),      -- Focus previous window in stack
   ("M-S-<Down>", windows W.swapDown), -- Swap selected window with the one above
   ("M-S-<Up>", windows W.swapUp),     -- Swap selected window with the one
   ("M-<Backspace>", promote),         -- Make the selected window master
  
   -- Layouts
   ("M-<Tab>", sendMessage NextLayout), -- Change Layout
   ("M-S-<Left>", sendMessage Shrink),  -- Shrink selected window
   ("M-S-<Right>", sendMessage Expand), -- Expand selected window

   -- System programs
   ("M-d", spawn "rofi -show run"),   -- Rofi menu
   ("M-S-s", spawn "flameshot gui"),  -- Screenshot
   ("M-f", spawn "firefox"),          -- Firefox
   ("M-S-p", spawn "xcolor | tr -d '\n' | xclip -selection clipboard"), -- Color picker
   ("M-<Return>", spawn (myTerminal)) -- Terminal
  ] where
      nonNSP = WSIs (return (\ws -> W.tag ws /= "nsp"))
      nonEmptyNonNSP = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))

-- Workspaces 
xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
  where
    doubleLts '<' = "<<"
    doubleLts x   = [x]

-- Workspaces icons/labels
myWorkspaces :: [String]
myWorkspaces = [" bin ", " boot ", " dev ", " etc ", " home ", " proc ", " srv ", " sys "]

-- Manage Hook (How to manage windows)
myManageHook :: Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll [className =? "Gimp" --> doFloat]

-- Function that adds spacing to windows
addSpacing i  = spacingRaw False (Border i i i i) True (Border i i i i) True
addSpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Workspaces design (Layouts)

myLayoutHook =  avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats $
  mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ myDefaultLayout
  where 
    myDefaultLayout = spirals ||| tall ||| Accordion ||| noBorders monocle
    spirals  = renamed [Replace "spirals"]
      $ limitWindows 9
      $ smartBorders
      $ subLayout [] (smartBorders Simplest)
      $ addSpacing 10
      $ spiral (8/9)
    tall = renamed [Replace "tall"] 
      $ limitWindows 12 
      $ spacing 6
      $ ResizableTall 1 (3/100) (1/2) []
    monocle = renamed [Replace "monocle"]  
      $ limitWindows 20 
      $ Full
    floats = renamed [Replace "floats"] 
      $ limitWindows 20 
      $ simplestFloat
