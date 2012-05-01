function drawBg()
   for h = 0, 25, 1 do
      for v = 0, 19, 1 do
	 lg.draw(grassTile,h * 32, v * 32)
      end
   end
end


function drawBall()
   lg.rectangle('fill', ballX, ballY, 8, 8)
end

function drawHUD()
   lg.print(shotAngle, 20, 20)
   lg.print(speed, 20, 30)

   if speed == 0 then
      drawReticule()
   end

end


function drawReticule()
   local myShotAngle = math.pi / 180 * shotAngle
   local myX = math.cos(myShotAngle) * 20
   local myY = math.sin(myShotAngle) * 20
   lg.line(ballX+8, ballY+8, ballX + myX + 8, ballY + myY + 8 )

end
