-----------------------------------------------------------------------------
--
-- Module      :  Main
-- Copyright   :
-- License     :  AllRightsReserved
--
-- Maintainer  :  Roger Turnau
-- Stability   :  Experimental
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module Main (
    main

) where

import Graphics.UI.GLUT
import Data.IORef
import Shapes
import Display
import Reshape

myInit :: IO()
myInit = do
    clearColor $= Color4 0 0 0 0    -- this colors the background
    shadeModel $= Smooth

    materialSpecular Front $= Color4 1 1 1 1
    materialShininess Front $= 50
    position (Light 0) $= Vertex4 1 1 1 0

    lighting $= Enabled
    light (Light 0) $= Enabled
    depthFunc $= Just Less


main :: IO()
main = do
    -- Initialize GLUT
    (progName, _args) <- getArgsAndInitialize
    -- create a window
    initialDisplayMode $= [DoubleBuffered, RGBMode]
    initialWindowPosition $= Position 100 100
    initialWindowSize $= Size 500 500
    createWindow "Rotating a Teapot"
    -- set up the main configuration
    teapotList <- myInit
    angle <- newIORef 0.0
    delta <- newIORef (0.1::GLfloat)
    -- Declare callback procedures
    idleCallback $= Just (idle angle delta)
    displayCallback $= display angle
    -- indicate loop
    mainLoop


