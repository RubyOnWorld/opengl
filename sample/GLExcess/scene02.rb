=begin
  GLExcess v1.0 Demo
  Copyright (C) 2001-2003 Paolo Martella
  
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

* Original code : Paolo Martella
* Ruby Porting  : vaiorabbit  <http://twitter.com/vaiorabbit>
=end

require 'matrix'

# Append some methods for 3D Vector manipulation.
class Vector
  def cross(vec2)
    Vector[ self[1] * vec2[2] - self[2] * vec2[1],
            self[2] * vec2[0] - self[0] * vec2[2],
            self[0] * vec2[1] - self[1] * vec2[0] ]
  end

  def normalize!
    length = Math.sqrt(self[0]*self[0] + self[1]*self[1] + self[2]*self[2])
    length = 1.0/length
    self[0] *= length
    self[1] *= length
    self[2] *= length
    return self
  end

  def []=(i, v)
    @elements[i]= v
  end
end


class Scene02

  class Particle
    attr_accessor :a_x, :a_y, :z    # GLfloat
    attr_accessor :a_mod            # GLfloat
    attr_accessor :speed, :speedlim # GLfloat
    attr_accessor :r, :g, :b, :a    # int
    attr_accessor :angle            # int
    attr_accessor :time             # int
  end

  def initialize
    @texture = Hash.new { |h,k| h[k] = Texture.new }
    @need_initialization = true
    @first_draw = true

    @parts = Array.new(200) { Particle.new }

    @a_time = 0.0
    @a_timecyc = 0.0
    @gendep=1.55
    @grid_size = 64

    @norm = Array.new(@grid_size*@grid_size) { Vector[0,0,0] }
    @points = Array.new(@grid_size*@grid_size) { Vector[0,0,0] }
    @newcoord = Array.new(@grid_size*@grid_size) { [0,0] }

    @camera = Vector[-12.8, 12.8, 5.0]

    @coeff = 7.1

    @a_xrot = 0.0
    @a_yrot = 0.0
    @a_zrot = 0.0

    @quantos = -1.0
    @a_zeta = -1.0

    @a_counter = 0.0

    @a_diffuse = [0.2, 0.2, 0.2, 1.0].pack('F*')
    @a_ambient = [0.1, 0.1, 0.1, 1.0].pack('F*')
    @a_specular = [0.75, 0.75, 0.75, 1.0].pack('F*')

    @a_LightAmbient = [0.5, 0.5, 0.5, 1.0].pack('F*')
    @a_LightDiffuse = [0.5, 0.5, 0.5, 1.0].pack('F*')
    @a_LightSpecular = [0.5, 0.5, 0.5, 1.0].pack('F*')
    @a_LightPosition = [0.0, 8.0, -20.0, 1.0].pack('F*')
    @a_LightPosition1 = [0.0, 0.0, 0.0, 1.0].pack('F*')
    @a_Sinus = [0.0, 0.0, 0.0]
  end

  def initGL
    GL.Disable(GL::LIGHT0)
    @a_time=2.0
    @a_timecyc=0.0
    @gendep=1.55

    @a_xrot = 0.0
    @a_yrot = 0.0
    @a_zrot = 0.0

    @quantos = -1.0
    @a_zeta=-1.0

    @a_counter=0

    @a_Sinus[0]=0
    @a_Sinus[1]=0
    @a_Sinus[2]=0

    GL.MatrixMode(GL::PROJECTION)
    GL.LoadIdentity()
    GLU.Perspective(45.0, 4.0/3.0, 0.1, 100.0)
    GL.MatrixMode(GL::MODELVIEW)
    GL.LoadIdentity()

    GL.ShadeModel(GL::SMOOTH)
    GL.ClearColor(0.0, 0.0, 0.0, 0.5)
    GL.ClearDepth(1.0)
    GL.Enable(GL::DEPTH_TEST)
    GL.DepthFunc(GL::LEQUAL)
    GL.Hint(GL::PERSPECTIVE_CORRECTION_HINT, GL::NICEST)

    @texture["logoxs"].load("data/logoxs.raw")
    @texture["white"].load("data/white.raw")
    @texture["sun2"].load("data/sun2.raw")
    @texture["star"].load("data/star.raw")

    GL.Enable(GL::LIGHTING)
    GL.Enable(GL::LIGHT1)

    GL.Lightfv(GL::LIGHT1,GL::DIFFUSE,@a_LightDiffuse)
    GL.Lightfv(GL::LIGHT1,GL::AMBIENT,@a_LightAmbient)
    GL.Lightfv(GL::LIGHT1,GL::SPECULAR,@a_LightSpecular)
    GL.Lightfv(GL::LIGHT1,GL::POSITION,@a_LightPosition)

    GL.Materialfv(GL::FRONT,GL::DIFFUSE,@a_diffuse)
    GL.Materialfv(GL::FRONT,GL::AMBIENT,@a_ambient)
    GL.Materialfv(GL::FRONT,GL::SPECULAR,@a_specular)
    GL.Materialf(GL::FRONT,GL::SHININESS,10.0)

    GL.PolygonMode(GL::FRONT_AND_BACK, GL::FILL)
    GL.Enable(GL::TEXTURE_2D)
    fx = 1.0 / (1.25*@grid_size/32)
    fy = 1.0 / (1.25*@grid_size/32)
    for a_x in 0...@grid_size do
      for a_y in 0...@grid_size do
        idx = a_x+@grid_size*a_y
        @points[idx][0] = a_x * fx
        @points[idx][1] = a_y * fy
        @points[idx][2] = 0.0
      end
    end

    @parts.each do |p|
      p.r = 128+rand(128)
      p.g = 128+rand(128)
      p.b = 128+rand(128)
      p.a = -1
      p.angle = rand(90)
      p.a_mod = 0.0
      p.speedlim = 0.005+0.0001*rand(1000)
      p.speed = p.speedlim
      p.a_x = 0.0
      p.a_y = 0.0
      p.z = 0.0
    end

    GL.BlendFunc(GL::SRC_ALPHA,GL::ONE)
    GL.Enable(GL::BLEND)
    GL.Disable(GL::DEPTH_TEST)

    # a_setpart()
    t = @a_time*500-2 #**********************************************
    @a_timecyc = t
    @parts.each do |p|
      p.time = t
    end
  end

  def clean
    @texture.each { |key,tex| tex.kill }

    @texture = nil
    @need_initialization   = true
  end

  def make_norm
    for i in 0...@grid_size do
      for j in 0...@grid_size do
        idx = (i)+@grid_size*(j)
        if (i == 0 && j == @grid_size-1)
          a = @points[(i)+@grid_size*(j-1)] - @points[idx]
          b = @points[(i+1)+@grid_size*(j)] - @points[idx]
          @norm[idx] = a.cross(b).normalize!
          @norm[idx] *= -1.0
        elsif (i == @grid_size-1 && j == 0)
          a = @points[(i-1)+@grid_size*(j)] - @points[idx]
          b = @points[(i)+@grid_size*(j+1)] - @points[idx]
          @norm[idx] = a.cross(b).normalize!
        elsif (i != @grid_size-1 && j != @grid_size-1)
          a = @points[(i)+@grid_size*(j+1)] - @points[idx]
          b = @points[(i+1)+@grid_size*(j)] - @points[idx]
          @norm[idx] = a.cross(b).normalize!
        else
          a = @points[(i)+@grid_size*(j-1)] - @points[idx]
          b = @points[(i-1)+@grid_size*(j)] - @points[idx]
          @norm[idx] = a.cross(b).normalize!
        end
      end
    end
  end

  def calculate_newcoord(xx, yy)
    idx = (xx)+@grid_size*(yy)
    cameraray = (@camera - @points[idx]).normalize!
    rray = (@norm[idx] * @coeff + cameraray).normalize! * -1.0

    depth = @gendep + @points[idx][2]
    t = depth / rray[2]
    mapx = @points[idx][0] + rray[0]*t
    mapz = @points[idx][1] + rray[1]*t

    @newcoord[idx][0] = -(mapx - @points[(0)+@grid_size*(0)][0]) / 25.6
    @newcoord[idx][1] =  (mapz - @points[(@grid_size-1)+@grid_size*(@grid_size-1)][1]) / 25.6 # @grid_size-1 : to avoid off-by-one range error.
  end

  def draw_quad(size)
    hs = 0.5 * size
    GL.Begin(GL::QUADS)
    GL.TexCoord2f(0.0, 0.0)
    GL.Vertex3f(-hs,-hs,0)
    GL.TexCoord2f(1.0, 0.0)
    GL.Vertex3f(-hs,hs,0)
    GL.TexCoord2f(1.0, 1.0)
    GL.Vertex3f(hs,hs,0)
    GL.TexCoord2f(0.0, 1.0)
    GL.Vertex3f(hs,-hs,0)
    GL.End()
  end

  def render(globtime)
    if (@need_initialization)
      initGL()
      @need_initialization = false
    end

    @a_time = 2.0 + globtime * 0.01

    # MOTION
    if (@a_time < 10.0)
      t = (3.1415/2.0)*(1+@a_time/10.0)
      @a_zeta =  25.0*Math.cos(t)
      @a_xrot = -45.0*Math.cos(t)
    else
      t = Math.sin((@a_time-10.0)/20.0)
      @a_xrot =  45.0 - 30.0*t*t
      t = Math.sin((@a_time-10.0)/50.0)
      @a_zrot = 360.0*t*t
      t = Math.sin((@a_time-10.0)/10.0)
      @a_zeta = -25.0 + 5.0*t*t
    end

    if (@a_time > 90.0)
      @a_zeta = -20.0 + 10.0 * (1.0 - Math.cos((@a_time-90.0)*3.1415/10.0))
    end

    @a_zeta = -2.5 if @a_zeta > -2.5

    GL.Disable(GL::TEXTURE_2D)
    GL.LoadIdentity()
    GL.Translatef(0,0,-5)
    GL.BlendFunc(GL::SRC_ALPHA, GL::ONE_MINUS_SRC_ALPHA)
    if (@a_zeta>-20.0)
      GL.Color4f(0,0,0,-(@a_zeta+20.0)/40.0+0.25)
    else
      GL.Color4f(0,0,0, 0.25)
    end
    GL.Disable(GL::LIGHTING)
    GL.Enable(GL::BLEND)
    draw_quad(6)

    if (@first_draw)
      GL.Disable(GL::BLEND)
      GL.Color4ub(255,255,255,255)
      draw_quad(6)
      GL.Enable(GL::BLEND)
      @first_draw = false
    end
    if (@a_time > 95.0)
      GL.Color4f(1.0,1.0,1.0,(@a_time-95.0)/1.5)
      draw_quad(6)
    end


    # make ripple
    make_norm()
    for xx in 0...@grid_size do
      for yy in 0...@grid_size do
        raggio = 0.0
        value  = 0.0
        arg    = 0.0

        idx = (xx)+@grid_size*(yy)
        if @quantos > 0.0
          cidx = (@grid_size/2)+@grid_size*(@grid_size/2)
          dx = @points[idx][0]-@points[cidx][0]
          dy = @points[idx][1]-@points[cidx][1]
          raggio = 0.5 * Math.sqrt((dx)*(dx) + (dy)*(dy))
          arg = 2.5*raggio - @quantos*2 + 30
          if (arg<-2*6.28 || arg>4*6.28)
            value = 0
          else
            sine = Math.sin(arg)
            value = 0.05 * sine*sine*Math.exp(arg/7)
          end
          @points[idx][2] = value
        end

        if @quantos > 10.0
          cidx = (48)+@grid_size*(48)
          dx = @points[idx][0]-@points[cidx][0]
          dy = @points[idx][1]-@points[cidx][1]
          raggio = 0.5 * Math.sqrt((dx)*(dx) + (dy)*(dy))
          arg = 2.5*raggio - (@quantos-10)*3 + 30
          if (arg<-2*6.28 || arg>4*6.28)
            value = 0
          else
            sine = Math.sin(arg)
            value = 0.025 * sine*sine*Math.exp(arg/7)
          end
          @points[idx][2] += value
        end

        if @quantos > 24.0
          cidx = (50)+@grid_size*(22)
          dx = @points[idx][0]-@points[cidx][0]
          dy = @points[idx][1]-@points[cidx][1]
          raggio = 0.5 * Math.sqrt((dx)*(dx) + (dy)*(dy))
          arg = 3.0*raggio - (@quantos-24)*4 + 30
          if (arg<-2*6.28 || arg>4*6.28)
            value = 0
          else
            sine = Math.sin(arg)
            value = 0.02 * sine*sine*Math.exp(arg/7)
          end
          @points[idx][2] += value
        end

        if @quantos > 32.0
          cidx = (32)+@grid_size*(32)
          dx = @points[idx][0]-@points[cidx][0]
          dy = @points[idx][1]-@points[cidx][1]
          raggio = 0.5 * Math.sqrt((dx)*(dx) + (dy)*(dy))
          arg = 2.5*raggio - (@quantos-32)*3 + 30
          if (arg<0*6.28 || arg>4*6.28)
            value = 0
          else
            sine = Math.sin(arg)
            value = 0.035 * sine*sine*Math.exp(arg/7)
          end
          @points[idx][2] += value
        end
        calculate_newcoord(xx, yy)
      end
    end
    if (@a_time > 34.0)
      @quantos = 2.0 + (@a_time-34.0) / 1.5
    end


    GL.Enable(GL::TEXTURE_2D)
    GL.BlendFunc(GL::SRC_ALPHA,GL::ONE)
    GL.Enable(GL::LIGHTING)
    GL.LoadIdentity()
    if (@a_time > 30.0)
      GL.Translatef(0.0, 1.5, @a_zeta)
    else
      GL.Translatef(0.0, 0.5+0.5*(1.0-Math.cos((@a_time-2.0)*3.1415/28.0)), @a_zeta)
    end
    GL.Rotatef(-90.0+2*@a_xrot, 1,0,0)
    GL.Rotatef(@a_yrot, 0,1,0)
    GL.Rotatef(@a_zrot, 0,0,1)


    @texture["logoxs"].use
    GL.Materialfv(GL::FRONT,GL::DIFFUSE,@a_diffuse)
    GL.Materialfv(GL::FRONT,GL::AMBIENT,@a_ambient)
    GL.Materialfv(GL::FRONT,GL::SPECULAR,@a_specular)
    GL.Materialf(GL::FRONT,GL::SHININESS,10.0)
    GL.PushMatrix()
    GL.Scalef(-1,-1,1)
    GL.Color4f(1,1,1,1)

    GL.PushMatrix()
    GL.Translatef(@camera[0], @camera[1], 0)

    GL.Scalef(1,-1,1) 
    GL.FrontFace(GL::CCW)

    GL.Begin(GL::QUADS)
    for a_x in 0...@grid_size-1 do
      for a_y in 0...@grid_size-1 do
        idx = (a_x)+@grid_size*(a_y)
        GL.TexCoord2f(@newcoord[idx][0],@newcoord[idx][1])
        GL.Vertex3f(@points[idx][0], @points[idx][1], @points[idx][2])

        idx = (a_x)+@grid_size*(a_y+1)
        GL.TexCoord2f(@newcoord[idx][0],@newcoord[idx][1])
        GL.Vertex3f(@points[idx][0], @points[idx][1], @points[idx][2])

        idx = (a_x+1)+@grid_size*(a_y+1)
        GL.TexCoord2f(@newcoord[idx][0],@newcoord[idx][1])
        GL.Vertex3f(@points[idx][0], @points[idx][1], @points[idx][2])

        idx = (a_x+1)+@grid_size*(a_y)
        GL.TexCoord2f(@newcoord[idx][0],@newcoord[idx][1])
        GL.Vertex3f(@points[idx][0], @points[idx][1], @points[idx][2])
      end
    end
    GL.End()

 
   # to avoid matrix stack overflow. (ruby-opengl v0.60.0 automatically checks Gl::Error.)
    GL.PopMatrix()
    GL.PopMatrix()

    GL.PushMatrix()
    GL.Disable(GL::DEPTH_TEST)
    GL.PopMatrix()
    GL.Disable(GL::LIGHTING)
    @texture["star"].use
    @a_counter = @a_time*10.0

    @parts.each_with_index do |p, i|
      time = @a_time*500-2.0-p.time #********************************************************
      GL.PushMatrix()
      GL.Translatef(p.a_x, p.a_y, p.z)
      GL.Rotatef(-@a_zrot, 0, 0, 1)
      GL.Rotatef(90-2.0*@a_xrot, 1, 0, 0)
      GL.Rotatef(p.angle-135.0, 0, 0, 1)
      GL.Translatef(p.a_mod, 0, 0)

      if (@a_time<20.0)
        GL.Color4ub(p.r, p.g, p.b, ((p.a-(time/8.0))*(@a_time-6.0)/14.0).to_i)
      else
        GL.Color4ub(p.r, p.g, p.b, p.a-(time/8.0).to_i)
      end

      draw_quad(1.125 - 0.75*i/@parts.size) if (@a_time > 6.0)
      p.a_mod = p.speed*time/35.0
      p.speed = p.speedlim - time/2500000.0
      p.speed = 0.005 if (p.speed < 0.005)

      if (p.a-(time/8.0) < 3)
        p.a_x = 10.0 * Math.sin(@a_counter*4.0*3.14/360.0)
        p.a_y = 0.0 + 10.0 * Math.sin(@a_counter*2*3.14/360.0)
        p.z = @a_Sinus[2] = 3.0-2.5*Math.cos(@a_counter*8.0*3.14/360.0)
        p.r = 128+rand(128)
        p.g = 128+rand(128)
        p.b = 128+rand(128)
        p.a = rand(255)
        p.a_mod = 0.0
        p.speedlim = 0.005 + 0.0001 * rand(1000)
        p.speed = p.speedlim
        p.time = @a_time*500-2#*********************************
      end

      GL.PopMatrix()
    end


    GL.PushMatrix()
    @a_Sinus[0] = 10.0 * Math.sin(@a_counter*4.0*3.14/360.0)
    @a_Sinus[1] = 0.0 + 10.0*Math.sin(@a_counter*2*3.14/360.0)
    @a_Sinus[2] = 3.0 - 2.5*Math.cos(@a_counter*8.0*3.14/360.0)
    GL.Translatef(@a_Sinus[0], @a_Sinus[1], @a_Sinus[2])

    GL.Rotatef(-@a_zrot,0,0,1)
    GL.Rotatef(90.0-2*@a_xrot,1,0,0)
    GL.Color4ub(255,128,255,255)
    GL.Color4ub(128,192,255,255)
    GL.Rotatef(2.0*@a_counter,0,0,1)

    GL.Enable(GL::LIGHTING)
    GL.Lightfv(GL::LIGHT1,GL::POSITION,@a_LightPosition1)
    GL.Disable(GL::LIGHTING)
    @texture["white"].use
    draw_quad(1.0+Math.sin(@a_counter*12.0*3.1415/360.0)+3.1415/2.0)
    @texture["sun2"].use
    draw_quad(3.0+2*Math.sin(@a_counter*6.0*3.1415/360.0))
    GL.PopMatrix()


    if (@a_time > 96.0)
      #****************************** FINISH
      return false
    end

    return true
  end

end
