-- file: Shapes.hs
module Shapes where

import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL.GL.VertexSpec

triangle :: IO()
triangle = do
  renderPrimitive Triangles $ do
    color (Color4 0.0 0.0 (1.0::GLfloat) (0.0::GLfloat))
    vertex $ Vertex3 (-0.6) (-0.6) (0.0::GLfloat)
    vertex $ Vertex3 0.0 0.7 (0.0::GLfloat)
    vertex $ Vertex3 1.0 0.0 (0.0::GLfloat)

pyramid :: GLfloat -> IO()
pyramid w = do 
  renderPrimitive TriangleFan $ do
    color $ Color3 1.0 0.0 (0.0::GLfloat) -- red
    vertex $ Vertex3 0.0 w 0.0
    color $ Color3 0.0 1.0 (0.0::GLfloat) -- blue
    vertex $ Vertex3 (-w) (-w) w
    color $ Color3 0.0 0.0 (1.0::GLfloat) -- green
    vertex $ Vertex3 w (-w) w
    color $ Color3 1.0 1.0 (0.0::GLfloat) -- yellow
    vertex $ Vertex3 w (-w) (-w)
    color $ Color3 1.0 1.0 (1.0::GLfloat) -- white
    vertex $ Vertex3 (-w) (-w) (-w) 
    color $ Color3 0.0 1.0 (0.0::GLfloat) -- blue
    vertex $ Vertex3 (-w) (-w) w


    
cube :: GLfloat -> IO()
cube w = do 
    renderPrimitive Quads $ do
        color $ Color3 1.0 0.0 (0.0::GLfloat) -- red
        vertex $ Vertex3 w w w
        vertex $ Vertex3 w w (-w)
        vertex $ Vertex3 w (-w) (-w)
        vertex $ Vertex3 w (-w) w
        color $ Color3 0.0 1.0 (0.0::GLfloat) -- blue
        vertex $ Vertex3 w w w
        vertex $ Vertex3 w w (-w)
        vertex $ Vertex3 (-w) w (-w)
        vertex $ Vertex3 (-w) w w
        color $ Color3 0.0 0.0 (1.0::GLfloat) -- green
        vertex $ Vertex3 w w w
        vertex $ Vertex3 w (-w) w
        vertex $ Vertex3 (-w) (-w) w
        vertex $ Vertex3 (-w) w w
        color $ Color3 1.0 1.0 (0.0::GLfloat) -- yellow
        vertex $ Vertex3 (-w) w w
        vertex $ Vertex3 (-w) w (-w)
        vertex $ Vertex3 (-w) (-w) (-w)
        vertex $ Vertex3 (-w) (-w) w
        color $ Color3 1.0 1.0 (1.0::GLfloat) -- white
        vertex $ Vertex3 w (-w) w
        vertex $ Vertex3 w (-w) (-w)
        vertex $ Vertex3 (-w) (-w) (-w)
        vertex $ Vertex3 (-w) (-w) w
        color $ Color3 0.5 0.5 (0.0::GLfloat) -- gray
        vertex $ Vertex3 w w (-w)
        vertex $ Vertex3 w (-w) (-w)
        vertex $ Vertex3 (-w) (-w) (-w)
        vertex $ Vertex3 (-w) w (-w)
    
renderTeapot :: IO()
renderTeapot = do 
    renderObject Solid (Teapot 0.5)
