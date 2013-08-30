#
# Copyright (c) 1993-1997, Silicon Graphics, Inc.
# ALL RIGHTS RESERVED 
# Permission to use, copy, modify, and distribute this software for 
# any purpose and without fee is hereby granted, provided that the above
# copyright notice appear in all copies and that both the copyright notice
# and this permission notice appear in supporting documentation, and that 
# the name of Silicon Graphics, Inc. not be used in advertising
# or publicity pertaining to distribution of the software without specific,
# written prior permission. 
#
# THE MATERIAL EMBODIED ON THIS SOFTWARE IS PROVIDED TO YOU "AS-IS"
# AND WITHOUT WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR OTHERWISE,
# INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY OR
# FITNESS FOR A PARTICULAR PURPOSE.  IN NO EVENT SHALL SILICON
# GRAPHICS, INC.  BE LIABLE TO YOU OR ANYONE ELSE FOR ANY DIRECT,
# SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY
# KIND, OR ANY DAMAGES WHATSOEVER, INCLUDING WITHOUT LIMITATION,
# LOSS OF PROFIT, LOSS OF USE, SAVINGS OR REVENUE, OR THE CLAIMS OF
# THIRD PARTIES, WHETHER OR NOT SILICON GRAPHICS, INC.  HAS BEEN
# ADVISED OF THE POSSIBILITY OF SUCH LOSS, HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, ARISING OUT OF OR IN CONNECTION WITH THE
# POSSESSION, USE OR PERFORMANCE OF THIS SOFTWARE.
# 
# US Government Users Restricted Rights 
# Use, duplication, or disclosure by the Government is subject to
# restrictions set forth in FAR 52.227.19(c)(2) or subparagraph
# (c)(1)(ii) of the Rights in Technical Data and Computer Software
# clause at DFARS 252.227-7013 and/or in similar or successor
# clauses in the FAR or the DOD or NASA FAR Supplement.
# Unpublished-- rights reserved under the copyright laws of the
# United States.  Contractor/manufacturer is Silicon Graphics,
# Inc., 2011 N.  Shoreline Blvd., Mountain View, CA 94039-7311.
#
# OpenGL(R) is a registered trademark of Silicon Graphics, Inc.
#
# varray.c
# This program demonstrates vertex arrays.
require_relative '../../opengl'
require_relative '../../glu'
require_relative '../../glfw'

OpenGL.load_dll()
GLU.load_dll()
GLFW.load_dll('libglfw.dylib', '..')
include OpenGL
include GLU
include GLFW

POINTER=1
INTERLEAVED=2

DRAWARRAY=1
ARRAYELEMENT=2
DRAWELEMENTS=3

$setupMethod = POINTER
$derefMethod = DRAWARRAY

def setupPointers
  $vertices = [25, 25,
               100, 325,
               175, 25,
               175, 325,
               250, 25,
               325, 325].pack("i*")
  $colors = [1.0, 0.2, 0.2,
             0.2, 0.2, 1.0,
             0.8, 1.0, 0.2,
             0.75, 0.75, 0.75,
             0.35, 0.35, 0.35,
             0.5, 0.5, 0.5].pack("f*")

  glEnableClientState(GL_VERTEX_ARRAY)
  glEnableClientState(GL_COLOR_ARRAY)

  glVertexPointer(2, GL_INT, 0, $vertices)
  glColorPointer(3, GL_FLOAT, 0, $colors)
end

def  setupInterleave
  $intertwined =
    [1.0, 0.2, 1.0, 100.0, 100.0, 0.0,
     1.0, 0.2, 0.2, 0.0, 200.0, 0.0,
     1.0, 1.0, 0.2, 100.0, 300.0, 0.0,
     0.2, 1.0, 0.2, 200.0, 300.0, 0.0,
     0.2, 1.0, 1.0, 300.0, 200.0, 0.0,
     0.2, 0.2, 1.0, 200.0, 100.0, 0.0].pack("f*")

  glInterleavedArrays(GL_C3F_V3F, 0, $intertwined)
end

def init
  glClearColor(0.0, 0.0, 0.0, 0.0)
  glShadeModel(GL_SMOOTH)
  setupPointers()
end

display = proc do
  glClear(GL_COLOR_BUFFER_BIT)
  if ($derefMethod == DRAWARRAY) 
    glDrawArrays(GL_TRIANGLES, 0, 6)
  elsif ($derefMethod == ARRAYELEMENT)
    glBegin(GL_TRIANGLES)
    glArrayElement(2)
    glArrayElement(3)
    glArrayElement(5)
    glEnd()
  elsif ($derefMethod == DRAWELEMENTS)
    $indices = [0, 1, 3, 4].pack("I*")
    glDrawElements(GL_POLYGON, 4, GL_UNSIGNED_INT, $indices)
  end
end

size_callback = GLFW::create_callback( :GLFWwindowsizefun ) do|window_handle, w, h|
  glViewport(0, 0, w, h)
  glMatrixMode(GL_PROJECTION)
  glLoadIdentity()
  gluOrtho2D(0.0, w, 0.0, h)
end

mouse_callback = GLFW::create_callback( :GLFWmousebuttonfun ) do |window_handle, button, action, mods|
  case button
  when GLFW_MOUSE_BUTTON_LEFT
    if action == GLFW_PRESS
      if $setupMethod == POINTER
        $setupMethod = INTERLEAVED
        setupInterleave()
      elsif $setupMethod == INTERLEAVED
        $setupMethod = POINTER
        setupPointers()
      end
    end
  when GLFW_MOUSE_BUTTON_MIDDLE,GLFW_MOUSE_BUTTON_RIGHT
    if action == GLFW_PRESS
      if $derefMethod == DRAWARRAY
        $derefMethod = ARRAYELEMENT
      elsif $derefMethod == ARRAYELEMENT
        $derefMethod = DRAWELEMENTS
      elsif $derefMethod == DRAWELEMENTS
        $derefMethod = DRAWARRAY
      end
    end
  end
end

key_callback = GLFW::create_callback(:GLFWkeyfun) do |window_handle, key, scancode, action, mods|
  case key
  when GLFW_KEY_ESCAPE
    glfwSetWindowShouldClose(window_handle, 1)
  end
end


if __FILE__ == $0
  glfwInit()
  window = glfwCreateWindow( 350, 350, $0, nil, nil )
  glfwSetWindowPos( window, 100, 100 )
  glfwMakeContextCurrent( window )
  glfwSetKeyCallback( window, key_callback )
  glfwSetMouseButtonCallback( window, mouse_callback )
  glfwSetWindowSizeCallback( window, size_callback )

  init()

  width_ptr = '    '
  height_ptr = '    '
  glfwGetFramebufferSize(window, width_ptr, height_ptr)
  width = width_ptr.unpack('L')[0]
  height = height_ptr.unpack('L')[0]
  size_callback.call( window, width, height )

  while glfwWindowShouldClose( window ) == 0
    display.call()
    glfwSwapBuffers( window )
    glfwPollEvents()
  end

  glfwDestroyWindow( window )
  glfwTerminate()
end
