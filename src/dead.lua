local state = gstate.new()


function state:init()

end


function state:enter()
	for i,v in ipairs(music) do
		v:stop()
	end
	deathmusic:play()
	time = 0
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
end


function state:draw()

	love.graphics.setCanvas(flexeffect)
	love.graphics.setBlendMode("alpha")
	local h = math.random(0,600)
	local col = math.random(0,255)
	love.graphics.setColor(col,col,col)
	love.graphics.rectangle("fill",0,h,1024,math.random(20,40))

	love.graphics.setCanvas()


	love.graphics.setBlendMode("alpha")
	love.graphics.setColor(10,25,30)
	love.graphics.rectangle("fill",0,0,1024,600)
	love.graphics.setColor(0,0,0,127)
	love.graphics.draw(vig,0,0,0,love.graphics.getWidth()/vig:getWidth(),love.graphics.getHeight()/vig:getHeight())
	love.graphics.setColor(255,255,255)
	love.graphics.draw(useful.tri(math.floor(time*2)%2==0,skul1,skul2),512-skul1:getWidth(),300-skul2:getHeight(),0,2,2)
	love.graphics.setColor(255,255,255,5)
	love.graphics.setBlendMode("alpha")
	love.graphics.draw(flexeffect,0,math.random(-3,3))
end

return state
