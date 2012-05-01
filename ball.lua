function hitBall()
   -- convert angle to radians
   shotAngle = math.pi / 180 * shotAngle
   speed = swingForce
   swingForce = 0
   xVel = math.cos(shotAngle) * speed
   yVel = math.sin(shotAngle) * speed
end

function resetBall()
   xVel = 0
   yVel = 0
   ballX = 400
   ballY = 500
end


function decelerateBall()
   speed = speed - 0.04
   xVel = math.cos(shotAngle) * speed
   yVel = math.sin(shotAngle) * speed
   if speed < 0 then speed = 0 end
end
