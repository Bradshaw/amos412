local state = gstate.new()


function state:init()

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
	countdown = 300
	vib = 0

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
		time = 0
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
		if love.keyboard.isDown("q") then
			time = time + dt
			countdown = countdown - dt * 4
		end
		if time>0.5 then
			setLights()
			time = time - 0.5
		end
	end
	if countdown<=0 then
		gstate.switch(dead)
	end
end


function state:draw()
	if init then
		love.graphics.setColor(255,255,255)
		love.graphics.translate(math.sin(countdown*100)*vib*100,math.sin(countdown*121)*vib*100)
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
		love.graphics.print(goodness,230,175)
		love.graphics.print(lastrel,230,235)
		love.graphics.print(math.floor(countdown*100)/100,230,255)
	end
end

return state
