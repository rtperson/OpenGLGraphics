-- file: Reshape.hs
module Reshape where

import Graphics.UI.GLUT

reshape s@(Size w h) = do 
    viewport $= (Position 0 0, s)
    matrixMode $= Projection
    loadIdentity
    let wf = fromIntegral w
        hf = fromIntegral h
    if w <= h
      then ortho 0 16 0 (16 * hf/wf) (-10) 10
      else ortho 0 (16 * wf/hf) 0 16 (-10) 10
    matrixMode $= Modelview 0
