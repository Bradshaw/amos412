local state = gstate.new()


function state:init()

end


function state:enter()
	for i,v in ipairs(music) do
		if i~=3 and i~=4 then
			v:stop()
		end
	end
	vib = 0
	brutal:stop()
	vol = 0
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
	vol = math.min(1,vol+dt/3)
	music[3]:setVolume(vol)
	music[4]:setVolume(1-vol)
end


function state:draw()
	

	love.graphics.setCanvas(flexeffect)
	love.graphics.setBlendMode("alpha")
	local h = math.random(0,600)
	local col = math.random(0,255)
	love.graphics.setColor(col,col,col)
	love.graphics.rectangle("fill",0,h,1024,math.random(20,40))

	love.graphics.setCanvas()







	screen:clear()

	love.graphics.setCanvas(screen)

	love.graphics.setBlendMode("alpha")
	--if init then
		love.graphics.setColor(255,255,255)
		love.graphics.draw(backim)

		-- GLITCHED LIVERY

		local seg = math.random(1,1)
		local mebbe = useful.tri(math.random()>1,0.5,0)
		if math.random()>1 then
			love.graphics.setScissor(700,10,300,280)
			love.graphics.draw(skul1,700,-25,0,2,2)
			love.graphics.setScissor()
		else
			love.graphics.setScissor(700,10,300,280)
			love.graphics.setBlendMode("additive")
			for i=1,3 do
				love.graphics.setColor(useful.tri(i==1,255,0),useful.tri(i==2,255,0),useful.tri(i==3,255,0))
				local r = (math.random(0,0)/10)*(useful.tri(seg==1,glitch,0*mebbe))
				local r2 = (math.random(0,0)/10)*(useful.tri(seg==1,glitch,0*mebbe))
				love.graphics.draw(livery,700-r*150*math.cos(countdown),-r2*150+math.random(0)*glitch,0,1,1,0,0,r*math.sin(countdown),r2)
			end
			love.graphics.setBlendMode("alpha")
			love.graphics.setScissor()
		end




		--love.graphics.rectangle("fill",10,560,1004*(countdown/300),30)
		i = 0
		for k,v in pairs(keys) do
			if love.keyboard.isDown(k) then
				--love.graphics.print("["..k.."]",10,10+20*i)
				i=i+1
			else
				keys[k]=nil
			end
		end
		love.graphics.setColor(255,255,255)
		love.graphics.draw(wireim)
		love.graphics.setColor(255,0,255)
		for i,v in ipairs(lights) do
			love.graphics.setColor(25,25,25,127)
			love.graphics.rectangle("fill",27+((-1+i)*110),320,80,80)
			love.graphics.setColor(25,25,25,200)
			love.graphics.rectangle("fill",27+((-1+i)*110)+3,323,74,74)

			if i==1 then
				love.graphics.setColor(88,58,32)
			elseif i==2 then
				love.graphics.setColor(12,22,108)
			elseif i==3 then
				love.graphics.setColor(175,11,11)
			elseif i==4 then
				love.graphics.setColor(29,88,16)
			elseif i==5 then
				love.graphics.setColor(92,13,86)
			elseif i==6 then
				love.graphics.setColor(214,169,7)
			end
			love.graphics.print(v,67+((-1+i)*110)-smalfnt:getWidth(v)/2,325)
			if v==" " then
				love.graphics.draw(cabOff,52+((-1+i)*110),415)
			else
				love.graphics.draw(cabOn,52+((-1+i)*110),415)
			end

		end
		love.graphics.setColor(255,255,255)
		--love.graphics.print(goodness,230,175)
		--love.graphics.print(lastrel,230,235)
		useful.drawTime(countdown, true)
	--end
	love.graphics.setColor(255,25,25)
	if vib>0 then
		love.graphics.draw(useful.tri(math.floor(time*10)%2==0,skul1,skul2),512-skul1:getWidth()*(3/2),300-skul2:getHeight()*(3/2),0,3,3)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.draw(window,693,299)
	if logd then
		--log.display(710,550)
	else
		--love.graphics.draw(content[windowcont],693,299)
	end

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
	love.graphics.draw(screen,math.sin(countdown*92)*vib*10,math.sin(countdown*94)*vib*10-vib*10)
	love.graphics.setColor(0,0,255)
	love.graphics.draw(screen,math.sin(countdown*99)*vib*10+useful.tri(vib>0,-10,0),math.sin(countdown*97)*vib*10)
	love.graphics.setColor(255,255,255,5)
	--love.graphics.setBlendMode("alpha")
	love.graphics.draw(flexeffect,0,math.random(-3,3))

end

return state
