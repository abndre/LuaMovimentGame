--First Game in Love2D
--Move Sun

function love.load()

	love.window.setTitle('First')
	love.graphics.setBackgroundColor(159, 133, 87) --RGB

	player  = {} -- dictionary player
	torpedoes = {}

	sound = love.audio.newSource("AMemoryAway.ogg")
	--love.audio.play(sound)
	--love.graphics.print("Primeiro Jogo", 0, 0)
	player.graphics = love.graphics.newImage("l.png")
	torpedoImage = love.graphics.newImage("fogo.png")

	player.x = 30
   	player.y = 50
   	player.sizex=0.2
   	player.sizey=0.2
   	player.speed = 300
   	player.rotation=0
   	player.height = player.graphics:getHeight()*player.sizey
   	player.width = player.graphics:getWidth()*player.sizex



  	canFire = false
  	torpedoTimerMax = 0.2
  	torpedoTimer = torpedoTimerMax
  	torpedoStartSpeed = 100
  	torpedoMaxSpeed = 300


end

function moveplayer(dt)
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

   if love.keyboard.isDown("space") then
    	torpedoSpeed = torpedoStartSpeed
    	if(left) then
    	  torpedoSpeed = torpedoSpeed - player.speed/2
    	elseif(right) then
    	  torpedoSpeed = torpedoSpeed + player.speed/2
    	end
    	spawnTorpedo(player.x + player.sizex, player.y + player.height/2, torpedoSpeed)
   end

  if torpedoTimer > 0 then
    torpedoTimer = torpedoTimer - dt
  else
    canFire = true
  end



function updateTorpedoes(dt)
  for index, torpedo in ipairs(torpedoes) do
    torpedo.xPos = torpedo.xPos + dt * torpedo.speed
    if torpedo.speed < torpedoMaxSpeed then
      torpedo.speed = torpedo.speed + dt * 100
    end
    if torpedo.xPos > love.graphics.getWidth() then
      torpedo = nil
    end
  end
end

function spawnTorpedo(x, y, speed)
  if canFire then
    torpedo = {xPos = x, yPos = y, width = 16, height=16, speed=speed, img = torpedoImage}
    table.insert(torpedoes, torpedo)

    canFire = false
    torpedoTimer = torpedoTimerMax
  end
end

end

function love.update(dt)
   moveplayer(dt)
   updateTorpedoes(dt)
end

function love.draw()
	love.graphics.draw(player.graphics, player.x, player.y,player.rotation,player.sizex,player.sizey)--x,y,rotation,sizex,sizey

	for index, torpedo in ipairs(torpedoes) do
	    love.graphics.draw(torpedo.img, torpedo.xPos, torpedo.yPos,0,0.1,0.1)
	end
end