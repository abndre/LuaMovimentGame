--First Game in Love2D
--Move Sun

function love.load()
	player ={} -- dictionary player
	sound = love.audio.newSource("AMemoryAway.ogg")
	love.audio.play(sound)
	--love.graphics.print("Primeiro Jogo", 0, 0)
	player.graphics = love.graphics.newImage("l.png")

	player.x = 30
   	player.y = 50
   	player.sizex=0.2
   	player.sizey=0.2
   	player.speed = 300
   	player.rotation=0

end

function love.update(dt)
   -- right
   if love.keyboard.isDown("right") then
   		if player.x < (love.graphics.getWidth() - player.graphics:getWidth()*player.sizex) then
      		player.x = player.x + (player.speed * dt)
      	end
   end
   -- left
   if love.keyboard.isDown("left") then
      if player.x > 0 then
      	player.x = player.x - (player.speed * dt)
      end
   end
   --down
   if love.keyboard.isDown("down") then
	if player.y < (love.graphics.getHeight() - player.graphics:getHeight()*player.sizey) then
  		player.y = player.y + (player.speed * dt)
  	end	
   end
   --up
   if love.keyboard.isDown("up") then
      if player.y >0 then
      	player.y = player.y - (player.speed * dt)
      end
   end
end

function love.draw()
	love.graphics.draw(player.graphics, player.x, player.y,player.rotation,player.sizex,player.sizey)--x,y,rotation,sizex,sizey
end
