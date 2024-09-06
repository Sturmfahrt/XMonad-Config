--{-# OPTIONS_GHC -Wno-deprecations #-}
import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.ThreeColumns
import Distribution.InstalledPackageInfo (showFullInstalledPackageInfo)
import GHC.Real (ratioPrec)

main :: IO ()
main = xmonad $ def
    {
      modMask = mod4Mask  -- Rebind Mod to the Super key
    , layoutHook = myLayout
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("M-f"  , spawn "floorp"                    )
    , ("M-e"  , spawn "thunar"                    )
    ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1     -- Default number of windows in the master pane
    ratio = 1/2     -- Default proportion of screen occupied by master pane
    delta = 3/100   -- Percent of screen to increment by when resizing panes
