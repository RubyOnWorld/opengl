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

class Scene08

  class Particle
    attr_accessor :size
    attr_accessor :spd
    attr_accessor :z
    attr_accessor :fact
    attr_accessor :r
    attr_accessor :g_a

    def reset
      @size = rand()
      @spd  = 0.0005 * rand(1000)
      @fact = 0.00025 * rand(1000)
      @z    = 0.0
      @r    = 0.5 + 0.0005 * rand(1000)
      @g_a  = rand()
    end
  end

  class Particle1
    attr_accessor :size # GLfloat
    attr_accessor :spd  # GLfloat
    attr_accessor :h    # GLfloat
    attr_accessor :r    # GLfloat
    attr_accessor :g_a  # GLfloat
    attr_accessor :init # long

    def reset(gettime)
      @size = rand()
      @spd  = 0.25 + 0.00025 * rand(1000)
      @init = gettime
      @h    = rand()
      @r    = 0.5 + 0.0005 * rand(1000)
      @g_a  = rand()
    end
  end

  def initialize
    @texture = Hash.new { |h,k| h[k] = Texture.new }
    @need_initialization = true

    @g_time = 0
    @limit = 0
    @g_check = 2

    @g_points = Array.new(64) { Array.new(64) { 0.0 } }
    @playjet = true
    @g_num = 50
    @g_num1 = 250
    @g_gettime = 0
    @g_ext = 10.0

    @g_scene = 0
    @parts  = Array.new(@g_num) { Particle.new }
    @parts1 = Array.new(@g_num1) { Particle1.new }

    @g_litetop = 1.0
    @g_liteleft = 0.5
    @g_literite = 0.25

    @g_rot = 1.5
    @g_rota = 0.0
    @g_zeta = 1.0

    @g_phase = Array.new(64) { Array.new(64) { 0.0 } }
    @g_speed = Array.new(64) { Array.new(64) { 0.0 } }
    @g_a = 0
    @g_b = 0
    @g_c = 1
    @g_radius = -6.0

=begin
    # [EXPERIMENTAL] Vertex Array Version : Uncomment this region to enable.
    @vertex_array = Array.new(64) { Array.new(64) { Array.new(4) { [0.0, 0.0, 0.0] } } }

    for g_gx in 0...63 do
      for g_gy in 0...63 do
        @vertex_array[g_gx][g_gy][0][0] = g_gx/1.5
        @vertex_array[g_gx][g_gy][0][1] = g_gy.to_f
        @vertex_array[g_gx][g_gy][0][2] = @g_points[g_gx][g_gy]

        @vertex_array[g_gx][g_gy][1][0] = (g_gx+1)/1.5
        @vertex_array[g_gx][g_gy][1][1] = g_gy.to_f
        @vertex_array[g_gx][g_gy][1][2] = @g_points[g_gx+1][g_gy]

        @vertex_array[g_gx][g_gy][2][0] = (g_gx+1)/1.5
        @vertex_array[g_gx][g_gy][2][1] = g_gy+1.0
        @vertex_array[g_gx][g_gy][2][2] = @g_points[g_gx+1][g_gy+1]

        @vertex_array[g_gx][g_gy][3][0] = g_gx/1.5
        @vertex_array[g_gx][g_gy][3][1] = g_gy+1.0
        @vertex_array[g_gx][g_gy][3][2] = @g_points[g_gx][g_gy+1]
      end
    end
    @vertex_array.flatten!
=end
  end

  def initGL
    @limit = 0
    @g_check = 2

    @playjet = true
    @g_num = 50
    @g_num1 = 250
    @g_gettime = 0
    @g_ext = 10.0

    @g_scene = 0

    @g_litetop = 1.0
    @g_liteleft = 0.5
    @g_literite = 0.25

    @g_rot = 1.5
    @g_rota = 0.0
    @g_zeta = 1.0

    @g_a = 0
    @g_b = 0
    @g_c = 1
    @g_radius = -6.0

    for x in 0...64 do
      for y in 0...64 do
        @g_phase[x][y] = 0.001 * rand(5000)
        @g_speed[x][y] = 0.1 + 0.001 * rand(10000)
      end
      @g_phase[x][63] = @g_phase[x][0]
      @g_speed[x][63] = @g_speed[x][0]
    end

    @parts.each do |p|
      p.reset
    end

    @parts1.each do |p|
      p.reset(@g_gettime)
    end

    @g_zeta = 66.0 + 45.0*(@g_gettime.to_f/13000.0)*(@g_gettime.to_f/13000.0)
    @g_rota = -0.3 + ((@g_gettime-@limit).to_f)/2500.0
    @g_rot = 1.5 + (@g_zeta-1.0)/15.0

    @texture["esaflr"].load("data/esaflr.raw")
    @texture["senv36"].load("data/senv36.raw") # MOON
    @texture["sky7"].load("data/sky7.raw")     # MOON
    @texture["env26"].load("data/env26.raw")   # DUSK
    @texture["sky27"].load("data/sky27.raw")   # DUSK
    @texture["env17"].load("data/env17.raw")   # DAY
    @texture["sky17"].load("data/sky17.raw")   # DAY
    @texture["basic2"].load("data/basic2.raw")
    @texture["white"].load("data/white.raw")
    @texture["moon1"].load("data/moon1.raw")
    @texture["f16"].load("data/f16.raw")
    @texture["f16mask"].load("data/f16mask.raw")
    @texture["basic2"].load("data/basic2.raw")
    @texture["sun2"].load("data/sun2.raw")
    @texture["trail"].load("data/trail.raw")
    @texture["trailleft"].load("data/trailleft.raw")
    @texture["trailright"].load("data/trailright.raw")
    @texture["floodmask"].load("data/floodmask.raw")

    GL.MatrixMode(GL::PROJECTION)
    GL.LoadIdentity()
    GLU.Perspective(45.0, 4.0/3.0, 0.1, 40.0)
    GL.MatrixMode(GL::MODELVIEW)
    GL.LoadIdentity()
    GL.Disable(GL::FOG)

    GL.TexParameteri(GL::TEXTURE_2D,GL::TEXTURE_WRAP_S, GL::REPEAT)
    GL.TexParameteri(GL::TEXTURE_2D,GL::TEXTURE_WRAP_T, GL::REPEAT)

    GL.ShadeModel(GL::FLAT)
    GL.ClearColor(0.0, 0.0, 0.0, 0.5)
    GL.ClearDepth(1.0) 
    GL.Enable(GL::DEPTH_TEST)
    GL.DepthFunc(GL::LEQUAL) 
    GL.Enable (GL::CULL_FACE)
    GL.Hint(GL::PERSPECTIVE_CORRECTION_HINT, GL::NICEST)
    GL.PolygonMode(GL::FRONT_AND_BACK, GL::FILL)
    GL.FrontFace(GL::CCW)

    GL.Enable(GL::TEXTURE_GEN_S)
    GL.Enable(GL::TEXTURE_GEN_T)

    GL.TexGeni(GL::T, GL::TEXTURE_GEN_MODE, GL::EYE_LINEAR)
    GL.TexGeni(GL::S, GL::TEXTURE_GEN_MODE, GL::SPHERE_MAP)

    GL.Enable(GL::TEXTURE_2D)
    GL.Disable(GL::BLEND)
  end

  def clean
    @texture.each { |key,tex| tex.kill }

    @texture = nil
    @need_initialization   = true
  end

  def g_drawquad(size) # size : GLfloat
    hs = 0.5*size
    GL.Begin(GL::QUADS)
    GL.TexCoord2f(0.0, 0.0)
    GL.Vertex3f(-hs,-hs,0)
    GL.TexCoord2f(1.0, 0.0)
    GL.Vertex3f(hs,-hs,0)
    GL.TexCoord2f(1.0, 1.0)
    GL.Vertex3f(hs,hs,0)
    GL.TexCoord2f(0.0, 1.0)
    GL.Vertex3f(-hs,hs,0)
    GL.End()
  end

  def g_drawquadr(size) # size : GLfloat
    hs = 0.5*size
    GL.Begin(GL::QUADS)
    GL.TexCoord2f(0.0, 1.0)
    GL.Vertex3f(-hs,-hs,0)
    GL.TexCoord2f(1.0, 1.0)
    GL.Vertex3f(hs,-hs,0)
    GL.TexCoord2f(1.0, 0.0)
    GL.Vertex3f(hs,hs,0)
    GL.TexCoord2f(0.0, 0.0)
    GL.Vertex3f(-hs,hs,0)
    GL.End()
  end

  def render(globtime)
    if (@need_initialization)
      initGL()
      @need_initialization = false
    end

    @g_time  = 5 * globtime

    if (((@g_scene==1)&&(@g_check==2))||((@g_scene==2)&&(@g_check==1)))
      @g_check-=1
      @limit=@g_gettime
      @g_a=0
      @g_b=0
      @g_c=1
    end

    GL.Clear(GL::COLOR_BUFFER_BIT | GL::DEPTH_BUFFER_BIT)

    GL.Color4f(1,1,1,1)
    GL.LoadIdentity()
    GL.Translatef(0,-3,-5+@g_zeta)

    GLU.LookAt(16,0,0.05, 16,16,0, 0,1,0)
    geomSolidSphere(0,10,10)

    if (@g_scene == 0)
      @texture["senv36"].use
    elsif (@g_scene == 1)
      @texture["env26"].use
    else
      @texture["env17"].use
    end
    GL.Enable(GL::TEXTURE_GEN_S)
    GL.Enable(GL::TEXTURE_GEN_T)
    if (@g_zeta.to_i/64 == @g_c)
      if ((@g_c%2)==0)
        @g_b+=1
      else
        @g_a+=1
      end
      @g_c+=1
    end
    GL.PushMatrix()
    GL.Translatef(-5, 126*@g_a, 0)
=begin
    # [EXPERIMENTAL] Vertex Array Version : Replace the "glBegin...glEnd" below with this snippet.
    GL.EnableClientState(GL::VERTEX_ARRAY)
    GL.VertexPointer(3, GL::DOUBLE, 0, @vertex_array)
    GL.DrawArrays(GL::QUADS, 0, 64*64*4)
    GL.DisableClientState(GL::VERTEX_ARRAY)
=end
    GL.Begin(GL::QUADS)
    for g_gx in 0...63 do
      for g_gy in 0...63 do
        GL.Vertex3f(g_gx/1.5, g_gy, @g_points[g_gx][g_gy])
        GL.Vertex3f((g_gx+1)/1.5, g_gy, @g_points[g_gx+1][g_gy])
        GL.Vertex3f((g_gx+1)/1.5, g_gy+1, @g_points[g_gx+1][g_gy+1])
        GL.Vertex3f(g_gx/1.5, g_gy+1, @g_points[g_gx][g_gy+1])
      end
    end
    GL.End()
    GL.PopMatrix()
    GL.Translatef(-5,63+(126*@g_b),0)
=begin
    # [EXPERIMENTAL] Vertex Array Version : Replace the "glBegin...glEnd" below with this snippet.
    GL.EnableClientState(GL::VERTEX_ARRAY)
    GL.VertexPointer(3, GL::DOUBLE, 0, @vertex_array)
    GL.DrawArrays(GL::QUADS, 0, 64*64*4)
    GL.DisableClientState(GL::VERTEX_ARRAY)
=end
    GL.Begin(GL::QUADS)
    for g_gx in 0...63 do
      for g_gy in 0...63 do
        GL.Vertex3f(g_gx/1.5, g_gy, @g_points[g_gx][g_gy])
        GL.Vertex3f((g_gx+1)/1.5, g_gy, @g_points[g_gx+1][g_gy])
        GL.Vertex3f((g_gx+1)/1.5, (g_gy+1), @g_points[g_gx+1][g_gy+1])
        GL.Vertex3f(g_gx/1.5, (g_gy+1), @g_points[g_gx][g_gy+1])
      end
    end
    GL.End()
    GL.LoadIdentity()

    GL.Translatef(0,-3,-40)
    GL.Disable(GL::CULL_FACE)

    if (@g_scene == 0)
      @texture["sky7"].use
    elsif (@g_scene == 1)
      @texture["sky27"].use
    else
      @texture["sky17"].use
    end
    GL.Disable(GL::TEXTURE_GEN_S)
    GL.Disable(GL::TEXTURE_GEN_T)

    GL.Rotatef(@g_rot,1,0,0)
    GL.Translatef(-0,8.8+@g_rot/5,0)
    GL.Scalef(22.1,8.8+@g_rot/5,1)
    GL.Begin(GL::QUADS)
    GL.TexCoord2d(0,1)
    GL.Vertex3f(-1.0,-1.0,0.0)
    GL.TexCoord2d(1,1)
    GL.Vertex3f(1.0,-1.0,0.0)
    GL.TexCoord2d(1,0)
    GL.Vertex3f(1.0,1.0,0.0)
    GL.TexCoord2d(0,0)
    GL.Vertex3f(-1.0,1.0,0.0)
    GL.End()

    for g_gy in 0...64 do
      for g_gx in 0...64 do
        @g_points[g_gx][g_gy] = 0.025*Math.sin(@g_speed[g_gx][g_gy]*@g_rota+@g_phase[g_gx][g_gy])
      end
    end
=begin
    # [EXPERIMENTAL] Vertex Array Version : Uncomment this region to enable.
    for g_gx in 0...63 do
      for g_gy in 0...63 do
        idx = (g_gx*64 + g_gy) * 12
        @vertex_array[idx + 3*0 + 2] = @g_points[g_gx][g_gy]
        @vertex_array[idx + 3*1 + 2] = @g_points[g_gx+1][g_gy]
        @vertex_array[idx + 3*2 + 2] = @g_points[g_gx+1][g_gy+1]
        @vertex_array[idx + 3*3 + 2] = @g_points[g_gx][g_gy+1]
      end
    end
=end
    GL.Enable(GL::BLEND)
    GL.Disable(GL::DEPTH_TEST)
    @texture["floodmask"].use
    GL.TexParameterf(GL::TEXTURE_2D,GL::TEXTURE_WRAP_S, GL::CLAMP)
    GL.TexParameterf(GL::TEXTURE_2D,GL::TEXTURE_WRAP_T, GL::CLAMP)
    if (@g_scene !=2)
      GL.BlendFunc(GL::ZERO,GL::ONE_MINUS_SRC_COLOR)
    else
      GL.BlendFunc(GL::SRC_ALPHA,GL::ONE)
    end
    GL.LoadIdentity()
    if (@g_scene == 0)
      GL.Translatef(0.15, -0.11, -1.0) # MOON
    elsif (@g_scene == 1)
      GL.Translatef(0, -0.1075, -1.0) # DUSK
    else
      GL.Translatef(0, -0.095, -1.0) # DAY
    end
    if (@g_scene == 0)
      GL.Scalef(2.0, 0.07, 1)
    elsif (@g_scene == 1)
      GL.Scalef(1.5, 0.07, 1)
    else
      GL.Scalef(2.5, 0.05, 1)
    end
    GL.Color4f(1,1,1,1)
    g_drawquadr(1.0)
    GL.Disable(GL::BLEND)
    GL.Enable(GL::DEPTH_TEST)


    @g_rota = -0.3+(@g_gettime-@limit)/2500.0
    @g_rot = 1.5 + (@g_zeta-1.0)/15.0

    GL.Enable(GL::CULL_FACE)
    if ((@g_radius>-6.0) && (@g_radius<3.0))
      GL.LoadIdentity()
      GL.Translatef(-4,1,-5)

      GL.Scalef(2,1.25,1)
      GL.Rotatef(-45,0,0,1)

      GL.Translatef(2*Math.cos(@g_radius),0.5*Math.sin(@g_radius),-@g_radius*1.5)

      GL.Rotatef(45+@g_radius*15,0,0,1)
      GL.Enable(GL::BLEND)
      GL.BlendFunc(GL::DST_COLOR,GL::ZERO)
      @texture["f16mask"].use
      g_drawquad(1.0)

      GL.BlendFunc(GL::ONE,GL::ONE)
      @texture["f16"].use
      g_drawquad(1.0)

      GL.BlendFunc(GL::SRC_ALPHA,GL::ONE) #/////////////////////////////////////////
      GL.Color4f(1.0, 1.0, 1.0, @g_litetop)
      @texture["trail"].use
      g_drawquad(1.0) #////////////////////////////////////////////
      @g_litetop -= 0.05
      @g_litetop = 1.0 if (@g_litetop < 0)

      GL.Color4f(0.10, 0.75, 0.25, @g_liteleft)
      @texture["trailleft"].use
      g_drawquad(1.0) #////////////////////////////////////////////
      @g_liteleft -= 0.25
      @g_liteleft=1.0 if (@g_liteleft < -2)

      GL.Color4f(1.0, 0.25, 0.25, @g_liteleft)
      @texture["trailright"].use
      g_drawquad(1.0) #////////////////////////////////////////////
      @g_literite -= 0.1
      @g_literite=1.0 if (@g_literite < -1.5)

      GL.LoadIdentity()
      GL.Translatef(-4,1,-5)
      GL.Scalef(2,1.25,1)
      GL.Rotatef(-45,0,0,1)
      GL.Translatef(2*Math.cos(@g_radius), 0.5*Math.sin(@g_radius), -@g_radius*1.5)

      GL.Rotatef(-45,0,0,1)

      GL.Enable(GL::TEXTURE_2D)
      @texture["basic2"].use

      GL.Disable(GL::DEPTH_TEST)

      GL.LoadIdentity()
      if (@g_radius < 0.0)
        GL.Translatef(-4.075,0.8,-5)
      else
        GL.Translatef(-4.075+@g_radius/11,0.8,-5)
      end
      GL.Scalef(2,1.25,1)
      GL.Rotatef(-45,0,0,1)
      GL.Translatef(2*Math.cos(@g_radius),0.5*Math.sin(@g_radius),-@g_radius*1.5)

      GL.Rotatef(45,0,0,1)
      GL.Rotatef(20+@g_radius*20,1,0,0)

      if (@g_radius<0.0)
        GL.Rotatef(-5,0,1,0)
      else
        GL.Rotatef(-5+12.5*@g_radius,0,1,0)
      end

      @parts.each do |p|
        GL.PushMatrix()
        GL.Translatef(0, 0, p.z/25)
        GL.Color4f(p.r, p.r/2, p.r/4, p.g_a)
        GL.Rotatef(-5-@g_radius*8, 0, 1, 0)
        GL.Rotatef(-20-@g_radius*20, 1, 0, 0)
        GL.Scalef(0.35, 0.5, 1)
        g_drawquad(p.size/2.0)
        p.g_a -= 0.15
        p.z += p.spd*5
        p.reset if ((p.g_a<0.0)||(p.size<0.0))
        GL.PopMatrix()
      end

      GL.PushMatrix()
      GL.Color4f(1,1,1,0.25+0.0005*((rand(1000))))
      GL.Rotatef(20+@g_radius*20,1,0,0)
      if (@g_radius < 0.0)
        GL.Rotatef(5,0,1,0)
      else
        GL.Rotatef(5-12.5*@g_radius,0,1,0)
      end
      GL.Rotatef(-20-@g_radius*20,1,0,0)
      @texture["sun2"].use
      GL.Scalef(0.35, 0.7, 1)
      GL.Rotatef(-@g_radius*50,0,0,1)
      g_drawquad(1+Math.cos(@g_radius)*Math.cos(@g_radius))
      GL.PopMatrix()

      GL.LoadIdentity()
      GL.Translatef(-3+2*Math.cos(@g_radius*1.25),-1,-2-2*@g_radius)
      GL.Color4f(0.2,0.2,0.2,0.5)
      GL.BlendFunc(GL::ZERO,GL::ONE_MINUS_SRC_COLOR)
      GL.Rotatef(-90,1,0,0)
      @texture["basic2"].use
      GL.Rotatef(25*@g_radius,0,0,1)
      GL.Scalef(1,3,1)
      g_drawquad(1.0)
    end
    GL.Disable(GL::BLEND)
    GL.Enable(GL::TEXTURE_2D)
    GL.Enable(GL::DEPTH_TEST)
    if (@g_scene == 0)
      @g_zeta = 66.0 + 45.0*((@g_gettime-@limit)/13000.0)*((@g_gettime-@limit)/13000.0)
    elsif (@g_scene == 1)
      @g_zeta = 15.0 + 25.0*((@g_gettime-@limit)/1500.0)
    elsif (@g_rota < 3.0)
      @g_zeta = 15.0 + 25.0*((@g_gettime-@limit)/1500.0)
    else
      @g_zeta = 15.0 + 25.0*((@g_gettime-@limit)/1500.0) - 30.0*(1.0-Math.cos((@g_rota-3.0)/5.0*3.1415))
    end

    if ((@g_scene==2)&&(@g_radius<3))
      @g_radius = -6.0 + (@g_zeta-20.0)*(@g_zeta-20.0)/2000.0
    end

    GL.Enable(GL::BLEND)
    GL.Disable(GL::DEPTH_TEST)

    @texture["esaflr"].use
    GL.BlendFunc(GL::SRC_ALPHA,GL::ONE)
    GL.LoadIdentity()

    if (@g_scene == 0)
      GL.Translatef(0.23, -0.06, -1.0) # MOON
    elsif (@g_scene == 1)
      GL.Translatef(0.07, -0.07, -1.0) # DUSK
    else
      GL.Translatef(0.325, -0.08, -1.0) # SKY
    end

    @parts1.each_with_index do |ptcl,l|
      time=(@g_gettime-ptcl.init).to_f/1000.0
      if (50.0*ptcl.spd*time>2.0*3.1415)
        ptcl.reset(@g_gettime)
      else
        GL.PushMatrix()
        if (!@g_scene)
          GL.Color4f(ptcl.r/4,ptcl.r/2,ptcl.r,0.5*ptcl.h*ptcl.g_a*(1.0-Math.cos(50.0*ptcl.spd*time))) # MOON
        elsif (@g_scene==1)
          GL.Color4f(ptcl.r,ptcl.r,ptcl.r/2,0.5*ptcl.h*ptcl.g_a*(1.0-Math.cos(50.0*ptcl.spd*time)))   # DUSK
        else 
          GL.Color4f(ptcl.r/4,ptcl.r/2,ptcl.r,1.0*ptcl.h*ptcl.g_a*(1.0-Math.cos(50.0*ptcl.spd*time)))   # DUSK
        end

        if ((l%2)==0)
          GL.Translatef(@parts1[l+1].h*ptcl.h/@g_ext,0,0)
        else
          GL.Translatef(-@parts1[l-1].h*ptcl.h/@g_ext,0,0)
        end

        if (l>@g_num1*(3.0/4.0))
          GL.Translatef(0,-ptcl.h/3.0,0)
        elsif (l>@g_num1*(2.0/4.0))
          GL.Translatef(0,-ptcl.h/4.0,0)
        elsif (l>@g_num1*(1.0/4.0))
          GL.Translatef(0,-ptcl.h/5.0,0)
        else
          GL.Translatef(0,-ptcl.h/6.0,0)
        end
        GL.Rotatef(500.0*time*ptcl.spd,0,0,1)
        g_drawquad(0.015+((1.0-Math.cos(50.0*ptcl.spd*time)))*ptcl.size*ptcl.h/30.0)
        if (l<@g_num1/10)
          GL.LoadIdentity()
          if (!@g_scene)
            GL.Translatef(0.42,-0.25,-1.0) # MOON
          elsif (@g_scene==1)
            GL.Translatef(0.12,-0.22,-1.0) # DUSK
          else
            GL.Translatef(0.6,-0.2,-1.0) # DAY
          end
          GL.Translatef(0,-(l.to_f/(@g_num1/10))/1.5,-1.0)
          if (!@g_scene)
            GL.Color4f(0.25,0.75,1.0,0.25)# MOON
          elsif (@g_scene==1)
            GL.Color4f(1.0,1.0,0.5,0.5)# DUSK
          else
            GL.Color4f(0.25,0.75,1.0,0.25)# DAY
          end
          if ((l%2)==0)
            GL.Translatef((l.to_f/(@g_num1/10))/10.0+ptcl.h/30.0,0,0)
          else
            GL.Translatef((l.to_f/(@g_num1/10))/10.0-ptcl.h/30.0,0,0)
          end
          g_drawquad(0.015+((1.0-Math.cos(50.0*ptcl.spd*time)))*ptcl.size*ptcl.h/1.5)
        end
        GL.PopMatrix()
      end
    end

    cips = (@g_gettime-@limit)/1500.0
    GL.LoadIdentity()
    if (@g_scene == 0)
      @texture["basic2"].use
      GL.Translatef(0.2+@g_rota/1000.0, 0.185+@g_rota/1100.0, -1.0)
      GL.Color4f(1,1,1,0.5)
      g_drawquad(0.2+0.05*Math.sin(cips))
      GL.BlendFunc(GL::SRC_ALPHA,GL::ONE_MINUS_SRC_COLOR)
      GL.Color4f(1,1,1,1)
      @texture["moon1"].use
      g_drawquad(0.08)
    elsif (@g_scene == 1)
      @texture["white"].use
      GL.Translatef(0.068, 0.04+@g_rota/800.0,-1.0)
      GL.Color4f(1,1,1,0.35)
      GL.Rotatef(Math.sin(cips/2.0)*50,0,0,1)
      g_drawquad(0.4+0.75*Math.sin(cips/1.5)*Math.sin(cips/1.5))
      GL.Rotatef(Math.sin(cips/4.0)*100,0,0,1)
      @texture["esaflr"].use
      g_drawquad(0.2+0.3*Math.cos(cips)*Math.cos(cips))
    else
      @texture["white"].use
      GL.Translatef(0.3,0.3,-1.0)
      GL.Color4f(1,1,1,0.3)
      GL.Rotatef(Math.sin(cips/2.0)*50,0,0,1)
      g_drawquad(0.3+0.5*Math.sin(cips/1.5)*Math.sin(cips/1.5))
      GL.Rotatef(Math.sin(cips/4.0)*100,0,0,1)
      @texture["esaflr"].use
      g_drawquad(0.2+0.3*Math.cos(cips)*Math.cos(cips))
      @texture["basic2"].use
      g_drawquad(0.3)
    end

    GL.Enable(GL::BLEND)
    GL.Disable(GL::DEPTH_TEST)

    if ((@g_rota<1.0) ||
         ((@g_rota>9.2)&&(@g_scene==0)) ||
         ((@g_rota>5.7)&&(@g_scene==1)) ||
         ((@g_rota>4.0)&&(@g_scene==2))
        )
      if ((@g_scene==0)&&(@g_rota<1.0))
        GL.BlendFunc(GL::ZERO,GL::ONE_MINUS_SRC_ALPHA)
      else
        GL.BlendFunc(GL::SRC_ALPHA,GL::ONE)
      end
      GL.LoadIdentity()
      GL.Translatef(0,0,-0.9)
      if (@g_rota<0)
        GL.Color4f(1,1,1,1)
      elsif (@g_rota<1.0)
        GL.Color4f(1,1,1,0.5*(1.0+Math.cos(@g_rota*3.1415)))
      end

      GL.Color4f(1,1,1,0.5*(1.0+Math.cos(-3.1415+(@g_rota-9.2)*4.0*3.1415))) if (@g_rota>9.2)
      GL.Color4f(1,1,1,0.5*(1.0+Math.cos(-3.1415+(@g_rota-5.7)*4.0*3.1415))) if ((@g_scene==1)&&(@g_rota>5.7))
      GL.Color4f(1,1,1,0.5*(1.0+Math.cos(-3.1415+(@g_rota-4.0)*3.1415))) if ((@g_scene==2)&&(@g_rota>4.0))
      GL.Disable(GL::TEXTURE_2D)
      GL.Scalef(1.1,0.8,1)
      g_drawquad(1.0)
      GL.Enable(GL::TEXTURE_2D)
    end

    GL.Disable(GL::BLEND)
    @playjet = false if ((@g_scene==2)&&(@g_rota>1.6)&&(@playjet))

    if (((@g_scene==0)&&(@g_rota>9.45)) ||
        ((@g_scene==1)&&(@g_rota>5.95))
       )
      @g_scene += 1
    end

    if ((@g_scene==2)&&(@g_check==0)&&(@g_rota>5.0))
      return false
    end
    @g_gettime = @g_time

    return true
  end

end
