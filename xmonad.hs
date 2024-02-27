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
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.Loggers
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)

-- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops 
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory

-- Actions
import XMonad.Actions.Minimize (minimizeWindow)
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.CopyWindow (kill1, copyToAll, killAllOtherCopies, runOrCopy)
import XMonad.Actions.WindowGo (runOrRaise, raiseMaybe)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen, shiftNextScreen, shiftPrevScreen, swapNextScreen)
import XMonad.Actions.GridSelect
import XMonad.Actions.DynamicWorkspaces (addWorkspacePrompt, removeEmptyWorkspace)
import XMonad.Actions.MouseResize
import qualified XMonad.Actions.ConstrainedResize as Sqr
import XMonad.Actions.WindowMenu
import XMonad.Actions.UpdatePointer

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Man
import XMonad.Prompt.Pass
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.Ssh
import XMonad.Prompt.XMonad
import Control.Arrow (first)
import XMonad.Prompt.ConfirmPrompt

-- Data
import Data.Char (isSpace)

-- Layouts modifiers
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.Spacing (spacing)
import XMonad.Layout.NoBorders
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Reflect (reflectVert, reflectHoriz, REFLECTX(..), REFLECTY(..))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

-- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.OneBig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import XMonad.Layout.IM (withIM, Property(Role))
import XMonad.Layout.Accordion
import XMonad.Layout.Cross

-- Prompts
import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.AppendFile
--
--
-- End of imports
-- Now just config!
--
--

-- Basic Configuration
myFont        = "Ubuntu Bold 16"
myTerminal    = "alacritty"
myTextEditor  = "nvim"
myBorderWidth = 3
myModMask     = mod4Mask

-- Window Border Colors
focusedColor  = "#427b58"
inactiveColor = "#282828"

-- Xmobar Module Colors
currentWorkspaceColor = "#8EC07C"
visibleWorkspaceColor = "#D79921"
hiddenWorkspaceColor  = "#D79921"
noWinWorkscaceColor   = "#a89984"
urgentWorkspaceColor  = "#cc241d" 
xmobarTitleColor      = "#FBF1C7"
xmobarSeparatorColor  = "#cc241d"

-- XPrompt Colors
xpBackgroundColor = "#282828"
xpForegroundColor = "#EBDBB2"
xpBorderColor     = "#DC9656"
xpLightBackgroundColor = "#458588"
xpDarkBackgroundColor  = "#ffffff"

-- Command To Init Xmobar
initXmobar :: String 
initXmobar  = "xmobar -x 0 ~/.config/xmonad/xmobar/xmobarrc0"

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
      ,ppCurrent = xmobarColor (currentWorkspaceColor) "" . wrap "/" "/"
      , ppVisible         = xmobarColor (visibleWorkspaceColor) ""
      , ppHidden          = xmobarColor (hiddenWorkspaceColor) "" . wrap "°" ""
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
  gs_cellheight   = 30,
  gs_cellwidth    = 200,
  gs_cellpadding  = 8,
  gs_originFractX = 0.5,
  gs_originFractY = 0.5,
  gs_font         = myFont
}

-- Function to Spawn the selected Grid 
spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
  where conf = def

-- XPrompt Configurations
omarXPConfig :: XPConfig
omarXPConfig = def {
  font                = myFont,
  bgColor             = xpBackgroundColor,
  fgColor             = xpForegroundColor,
  bgHLight            = xpLightBackgroundColor,
  fgHLight            = xpDarkBackgroundColor,
  borderColor         = xpBorderColor,
  promptBorderWidth   = 0,
  position            = Top,
  height              = 20,
  historySize         = 256,
  historyFilter       = id,
  defaultText         = [],
  autoComplete        = Just 10000,
  showCompletionOnTab = False,
  alwaysHighlight     = True,
  maxComplRows        = Nothing
}

omarXPConfig' :: XPConfig
omarXPConfig' = omarXPConfig {
  autoComplete = Nothing
}

-- Function to ask for exiting
-- Xmonad confirmation
exitPrompt :: X ()
exitPrompt = do
  confirmPrompt omarXPConfig "Quit XMonad?" $ io exitSuccess

-- System Key Bindings
myKeys =
  [("M-S-r", spawn "xmonad --recompile && xmonad --restart"),
   ("M-S-q", exitPrompt),                           -- Quit Xmonad
   ("M-q", kill1),                                  -- Kill focused window
   ("M-S-a", killAll),                              -- Kill all the windows
   ("M-<Delete>", withFocused $ windows . W.sink),  -- Restart floating window
  
   -- Show Browsers Menu
   (("M-C-b"), spawnSelected'
   [("Firefox", "firefox")]),

   -- Show Text Editors Menu
   (("M-C-e"), spawnSelected'
   [("VsCode", "code"), -- Open VsCode
    ("Neovim", "nvim"), -- Open Neovim
    ("Vim", "vim")]),   -- Open vim

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

-- Workspaces design (Layouts)
myLayoutHook =  avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats $
  mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ myDefaultLayout
  where
    myDefaultLayout = tall ||| Accordion ||| noBorders monocle
    tall = renamed [Replace "tall"] $ limitWindows 12 $ spacing 6 $ ResizableTall 1 (3/100) (1/2) []
    monocle = renamed [Replace "monocle"]  $ limitWindows 20 $ Full
    floats = renamed [Replace "floats"]   $ limitWindows 20 $ simplestFloat
