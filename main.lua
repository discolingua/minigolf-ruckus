lg = love.graphics



-- require modules
HC = require 'hardoncollider'

-- require callbacks
--require 'load'
--require 'update'
require 'draw'
--require 'collide'


-- require entities
require 'camera'
require 'ball'

function love.conf(t)
   t.screen.width = 800
   t.screen.height = 600
end


function love.load()
   ballX = 400
   ballY = 500
   xVel = 0
   yVel = 0
   mode = 'play'
   shotAngle = 0
   maxSpeed = 5
   speed = 0
   swingForce = 0
   maxSwingForce = 6
   grassTile = lg.newImage('gfx/grasstile.png')
end

function love.keypressed(key)
   if key == ' ' and speed == 0 then 
      if mode == 'play' then
	 swingForce = 0
	 mode = 'swing'
      elseif mode == 'swing' then 
	 hitBall() 
	 mode = 'play'
      end
   end
   if key == 'r' then resetBall() end
   if key == 'w' then shotAngle = 270 end
   if key == 's' then shotAngle = 90 end
   if key == 'a' then shotAngle = 180 end
   if key == 'd' then shotAngle = 0 end
end


function love.update()
   if love.keyboard.isDown('left') then shotAngle = shotAngle - 0.5 end
   if love.keyboard.isDown('right') then shotAngle = shotAngle + 0.5 end
   if mode == 'swing' then movePowerBar() end
   if speed > 0 then 
      decelerateBall()
      ballX = ballX + xVel
      ballY = ballY + yVel
   end
end

function movePowerBar()
   if swingForce <= 0 then
      barMove = .2
   elseif swingForce >= maxSwingForce then
      barMove = -.2
   end
   swingForce = swingForce + barMove
end


function love.draw()
   camera:set()
   drawBg()
--   if mode == 'swing' then drawPowerBar() end
   drawBall()
   drawHUD()
   camera:unset()
end


