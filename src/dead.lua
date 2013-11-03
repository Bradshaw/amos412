local state = gstate.new()


function state:init()

end


function state:enter()
	for i,v in ipairs(music) do
		if i~=2 then
			v:stop()
		end
	end
	music[2]:setPitch(0.5)
	deathmusic:play()
	time = 0
	vib = 0.5
	blink = true
	flux = 1
end

function state:focus()

end


function state:mousepressed(x, y, btn)

end


function state:mousereleased(x, y, btn)
	
end


function state:joystickpressed(joystick, button)
	
end


function state:joystickreleased(joystick, button)
	
end


function state:quit()
	
end


function state:keypressed(key, uni)

end


function state:keyreleased(key, uni)
	
end


function state:update(dt)
	time = time + dt
	countdown = countdown - dt
	log.update(dt)
	flux = flux + dt
	if flux>1 then
		log.add(
			names[math.random(1,#names)].." "..
			surnames[math.random(1,#surnames)]..", age "
			..math.random(3,50)..
			": Died in chemical attack")
		flux = math.random()
	end
end


function state:draw()

	blink = not blink

	love.graphics.setCanvas(flexeffect)
	love.graphics.setBlendMode("alpha")
	local h = math.random(0,600)
	local col = math.random(0,255)
	love.graphics.setColor(col,col,col)
	love.graphics.rectangle("fill",0,h,1024,math.random(20,40))



	love.graphics.setCanvas(screen)

	love.graphics.setBlendMode("alpha")
	love.graphics.setColor(30,10,10)
	love.graphics.rectangle("fill",0,0,1024,600)
	love.graphics.setColor(0,0,0,127)
	love.graphics.draw(vig,0,0,0,love.graphics.getWidth()/vig:getWidth(),love.graphics.getHeight()/vig:getHeight())
	love.graphics.setColor(255,255,255)
	if blink then
		love.graphics.draw(useful.tri(math.floor(time*10)%2==0,skul1,skul2),512-skul1:getWidth()*(3/2),300-skul2:getHeight()*(3/2),0,3,3)
	end
	love.graphics.setColor(255,255,255,5)
	love.graphics.setBlendMode("additive")
	love.graphics.draw(flexeffect,0,math.random(-3,3))



	love.graphics.setCanvas()

	love.graphics.setColor(30,10,10)
	love.graphics.rectangle("fill",0,0,1024,600)
	love.graphics.setColor(0,0,0,127)
	love.graphics.draw(vig,0,0,0,love.graphics.getWidth()/vig:getWidth(),love.graphics.getHeight()/vig:getHeight())
	love.graphics.setColor(255,255,255)

	love.graphics.setBlendMode("additive")
	love.graphics.setColor(255,0,0)
	love.graphics.draw(screen,math.sin(countdown*90)*vib*5,math.sin(countdown*92)*vib*5)
	love.graphics.setColor(0,255,0)
	love.graphics.draw(screen,math.sin(countdown*92)*vib*5,math.sin(countdown*94)*vib*5-vib*10)
	love.graphics.setColor(0,0,255)
	love.graphics.draw(screen,math.sin(countdown*99)*vib*5+useful.tri(vib>0,-5,0),math.sin(countdown*97)*vib*10)
	love.graphics.setColor(255,255,255,5)
	--love.graphics.setBlendMode("alpha")
	love.graphics.draw(flexeffect,0,math.random(-3,3))


	love.graphics.setColor(25,25,25,255)
	love.graphics.draw(window,693,299)
	love.graphics.setColor(255,25,25,127)
	log.display(710,550)

end

return state
