--{-# OPTIONS_GHC -Wno-deprecations #-}
import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns

main :: IO ()
main = xmonad $ def
    { modMask = mod4Mask  -- Rebind Mod to the Super key
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("M-f"  , spawn "floorp"                    )
    ]
