--Display.hs  Nehe Tutorial
module Display(display, idle) where

import Graphics.UI.GLUT
import Data.IORef
import Shapes
import Points


display ::  IORef GLfloat -> IO()
display angle = do
    clear [ ColorBuffer, DepthBuffer ]
    loadIdentity
    a <- get angle
    position (Light 0) $= Vertex4 (-1) (-1) (-1) 0
    rotate a $ Vector3 1.0 1.0 (0.0::GLfloat)
    scale 1 1 (1::GLfloat)
    preservingMatrix $ do
        translate $ Vector3 0.0 (-0.0) (0.0::GLfloat)
        renderTeapot
    swapBuffers

    --rotate 5 (Vector3 1 1 (1::Double))
    --renderTeapot
    --pyramid (0.6::GLfloat)
    --cube (0.6::GLfloat)
    --translate $ Vector3 0.5 0.0 ((-0.7)::Double)
    --scale 0.95 0.95 (0.95::GLfloat)
    --loadIdentity
    --rotate (3 * sin(3/10)) (Vector3 1 1 (1::Double))


idle :: IORef GLfloat -> IORef GLfloat -> IO()
idle angle delta = do
    a <- get angle
    d <- get delta
    angle $= a+d
    postRedisplay Nothing



