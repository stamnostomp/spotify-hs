{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Brick
import Graphics.Vty

type Name = ()

-- draw ui
drawUI :: () -> [Widget Name]
drawUI _ = [str "Hello, World! Press 'q' to quit."]

-- handel events
handleEvent :: BrickEvent Name e -> EventM Name () ()
handleEvent (VtyEvent (EvKey (KChar 'q') [])) = halt
handleEvent _ = return ()

app :: App () e Name
app =
  App
    { appDraw = drawUI,
      appChooseCursor = neverShowCursor,
      appHandleEvent = handleEvent,
      appStartEvent = return (),
      appAttrMap = const $ attrMap defAttr []
    }

main :: IO ()
main = do
  _ <- defaultMain app ()
  return ()
