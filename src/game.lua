local state = gstate.new()


function state:init()
	backim = love.graphics.newImage("images/background.png")
	livery = love.graphics.newImage("images/titleScreen.png")
	vig = love.graphics.newImage("images/vignette.png")
end


function state:enter()
	keys = {}
	butts = {
		"lctrl",
		"lalt",
		" ",
		"lshift",
		"w",
		"x"
	}
	goodness = ""
	init = false
	lastrel = ""
	cntr = math.random(1,#chars)
	wire = getNext()
	setLights()
	time = 0
	countdown = 900
	vib = 0
	glitch = 0
end

function getNext()
	return butts[math.random(1,#butts)]
end

function setLight(str)
	local isIn = false
	for i,v in ipairs(butts) do
		if str==v then
			isIn = true
		end
	end
	if isIn then
		if str == wire then
			return chars[(cntr%#chars)+1]
		else
			return chars[math.random(1,#chars)]
		end
	else
		return " "
	end
end

function setLights()
	lights = {
		setLight("lctrl"),
		setLight("lalt"),
		setLight(" "),
		setLight("lshift"),
		setLight("w"),
		setLight("x")
	}
	cntr = cntr + 1
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
	if key=="escape" then
		love.event.push("quit")
	end
	if key=="right" then
		init = true
		goodness = "Initialised"
	end
	print("Key: "..key)
	--print("Uni: "..uni)
	keys[key]=true
	if key=="q" then
		vib = 0.5
	end
end


function state:keyreleased(key, uni)
	lastrel = key
	if useful.isIn(butts, key) then
		if key==wire then
			goodness = "GOOD!"
			if #butts==2 then
				goodness = "You win!"
				gstate.switch(win)
			end
		else
			goodness = "WRONG!"
			countdown = countdown - 45
			vib = 0.5
			if #butts==2 then
				goodness = "You deaded!"
				gstate.switch(dead)
			end
		end
		for i,v in ipairs(butts) do
			if v==key then
				table.remove(butts, i)
			end
		end
		wire = getNext()
		setLights()
	end
end


function state:update(dt)
	if init and #butts>1 then
		vib = math.max(0,vib-dt)
		countdown = countdown - dt
		time = time + dt
		if love.keyboard.isDown("q") then
			--countdown = countdown - dt * 4
		end
		if time>0.5 then
			setLights()
			time = time - 1
		end
	end
	if countdown<=0 then
		gstate.switch(dead)
	end
	if math.random()>0.99 then
		glitch = 1
	end
	glitch = math.max(glitch - dt*10, 0)
end


function state:draw()
	screen:clear()

	love.graphics.setCanvas(screen)

	love.graphics.setBlendMode("alpha")
	--if init then
		love.graphics.setColor(255,255,255)
		love.graphics.draw(backim)

		-- GLITCHED LIVERY

		local seg = math.random(1,3)
		local mebbe = useful.tri(math.random()>0.9,0.5,0)

		love.graphics.setScissor(700,10,300,94)
		love.graphics.setBlendMode("additive")
		for i=1,3 do
			love.graphics.setColor(useful.tri(i==1,255,0),useful.tri(i==2,255,0),useful.tri(i==3,255,0))
			local r = (math.random(0,1)/10)*(useful.tri(seg==1,glitch,math.random()*mebbe))
			local r2 = (math.random(-1,1)/10)*(useful.tri(seg==1,glitch,math.random()*mebbe))
			love.graphics.draw(livery,700-r*150*math.cos(countdown),-r2*150+math.random(-20,20)*glitch,0,1,1,0,0,r*math.sin(countdown),r2)
		end
		love.graphics.setBlendMode("alpha")
		love.graphics.setScissor()



		love.graphics.setScissor(700,10+94,300,94)
		love.graphics.setBlendMode("additive")
		for i=1,3 do
			love.graphics.setColor(useful.tri(i==1,255,0),useful.tri(i==2,255,0),useful.tri(i==3,255,0))
			local r = (math.random(0,1)/10)*(useful.tri(seg==2,glitch,math.random()*mebbe))
			local r2 = (math.random(-1,1)/10)*(useful.tri(seg==2,glitch,math.random()*mebbe))
			love.graphics.draw(livery,700-r*150*math.cos(countdown),-r2*150+math.random(-20,20)*glitch,0,1,1,0,0,r*math.sin(countdown),r2)
		end
		love.graphics.setBlendMode("alpha")
		love.graphics.setScissor()



		love.graphics.setScissor(700,10+94+94,300,94)
		love.graphics.setBlendMode("additive")
		for i=1,3 do
			love.graphics.setColor(useful.tri(i==1,255,0),useful.tri(i==2,255,0),useful.tri(i==3,255,0))
			local r = (math.random(0,1)/10)*(useful.tri(seg==3,glitch,math.random()*mebbe))
			local r2 = (math.random(-1,1)/10)*(useful.tri(seg==3,glitch,math.random()*mebbe))
			love.graphics.draw(livery,700-r*150*math.cos(countdown),-r2*150+math.random(-20,20)*glitch,0,1,1,0,0,r*math.sin(countdown),r2)
		end
		love.graphics.setBlendMode("alpha")
		love.graphics.setScissor()





		--love.graphics.rectangle("fill",10,560,1004*(countdown/300),30)
		i = 0
		for k,v in pairs(keys) do
			if love.keyboard.isDown(k) then
				love.graphics.print("["..k.."]",10,10+20*i)
				i=i+1
			else
				keys[k]=nil
			end
		end
		for i,v in ipairs(lights) do
			love.graphics.print(v,200+i*30,200)
		end
		love.graphics.setColor(255,255,255)
		--love.graphics.print(goodness,230,175)
		--love.graphics.print(lastrel,230,235)
		love.graphics.print(math.floor(countdown*100)/100,230,255)
	--end
	love.graphics.setCanvas()

	love.graphics.setColor(10,25,30)
	love.graphics.rectangle("fill",0,0,1024,600)
	love.graphics.setColor(0,0,0,127)
	love.graphics.draw(vig,0,0,0,love.graphics.getWidth()/vig:getWidth(),love.graphics.getHeight()/vig:getHeight())
	love.graphics.setColor(255,255,255)

	love.graphics.setBlendMode("additive")
	love.graphics.setColor(255,0,0)
	love.graphics.draw(screen,math.sin(countdown*90)*vib*10,math.sin(countdown*92)*vib*10)
	love.graphics.setColor(0,255,0)
	love.graphics.draw(screen,math.sin(countdown*92)*vib*10,math.sin(countdown*94)*vib*10-vib*100)
	love.graphics.setColor(0,0,255)
	love.graphics.draw(screen,math.sin(countdown*99)*vib*10+useful.tri(vib>0,-10,0),math.sin(countdown*97)*vib*10)
end

return state
