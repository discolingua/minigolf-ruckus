lg = love.graphics



-- require modules
HC = require 'hardoncollider'

-- require callbacks
--require 'load'
--require 'update'
--require 'draw'
--require 'collide'


-- require entities
require 'camera'

function love.conf(t)
   t.screen.width = 800
   t.screen.height = 600
end


function love.load()
   ballX = 400
   ballY = 500
   xVel = 0
   yVel = 0
   shotAngle = 0
   speed = 5
   grassTile = lg.newImage('gfx/grasstile.png')
end

function love.keypressed(key)
   if key == ' ' then hitBall() end
   if key == 'r' then resetBall() end
end

function hitBall()
   -- convert angle to radians
   shotAngle = math.pi / 180 * shotAngle

   xVel = math.cos(shotAngle) * speed
   yVel = math.sin(shotAngle) * speed
   shotAngle = 0
end

function resetBall()
   xVel = 0
   yVel = 0
   ballX = 400
   ballY = 500
end


function love.update()
   if love.keyboard.isDown('left') then shotAngle = shotAngle - 0.5 end
   if love.keyboard.isDown('right') then shotAngle = shotAngle + 0.5 end
   ballX = ballX + xVel
   ballY = ballY + yVel
end


function love.draw()
   camera:set()
   drawBg()
   drawBall()
   drawHUD()
   camera:unset()
end


function drawBg()
   for h = 0, 25, 1 do
      for v = 0, 19, 1 do
	 lg.draw(grassTile,h * 32, v * 32)
      end
   end
end


function drawBall()
   lg.rectangle('fill', ballX, ballY, 16, 16)
end

function drawHUD()
   lg.print(shotAngle, 20, 20)

   local myShotAngle = math.pi / 180 * shotAngle
   local myX = math.cos(myShotAngle) * 20
   local myY = math.sin(myShotAngle) * 20
   lg.line(ballX+8, ballY+8, ballX + myX + 8, ballY + myY + 8 )
   lg.print(myShotAngle, 20, 30)
end
