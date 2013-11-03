useful = {}


function useful.isIn(tab, elem, ...)
	if elem then
		for k,v in pairs(tab) do
			if v==elem then
				return true
			end
		end
		return useful.isIn(tab, ...)
	else
		return false
	end
end

function useful.tri(cond, yes, no)
	if cond then
		return yes
	else
		return no
	end
end

function useful.secToString(secs)
	local m = string.format("%02d",useful.tri(vib<=0,math.floor(secs/60),math.random(0,99))  )
	local s = string.format("%02d",useful.tri(vib<=0,math.floor(secs)-(m*60),math.random(0,99) ))
	local ms = string.format("%02d",useful.tri(vib<=0,math.floor((secs - math.floor(secs))*100 ),math.random(0,99) ) )

	return m, s, ms
end

function useful.drawTime(secs, green)
	love.graphics.setFont(bigfnt)
	local i = 0
	local m,s,ms = useful.secToString(secs)
	while m:len()>0 do
		local a = m:sub(1,1)
		m = m:sub(2)
		if green then
			love.graphics.setColor(25,255,25,45)
		else
			love.graphics.setColor(255,25,25,45)
		end
		love.graphics.print(8,130+90*i-love.graphics.getFont():getWidth(8),30)
		if green then
			love.graphics.setColor(25,255,25)
		else
			love.graphics.setColor(255,25,25)
		end
		if tonumber(a)==1 then
			love.graphics.print(a,130+90*i-love.graphics.getFont():getWidth(a)+10,30)
		else
			love.graphics.print(a,130+90*i-love.graphics.getFont():getWidth(a),30)
		end
		i=i+1
	end
	while s:len()>0 do
		local a = s:sub(1,1)
		s = s:sub(2)
		if green then
			love.graphics.setColor(25,255,25,45)
		else
			love.graphics.setColor(255,25,25,45)
		end
		love.graphics.print(8,150+90*i-love.graphics.getFont():getWidth(8),30)
		if green then
			love.graphics.setColor(25,255,25)
		else
			love.graphics.setColor(255,25,25)
		end
		if tonumber(a)==1 then
			love.graphics.print(a,150+90*i-love.graphics.getFont():getWidth(a)+10,30)
		else
			love.graphics.print(a,150+90*i-love.graphics.getFont():getWidth(a),30)
		end
		i=i+1
	end
	while ms:len()>0 do
		local a = ms:sub(1,1)
		ms = ms:sub(2)
		if green then
			love.graphics.setColor(25,255,25,45)
		else
			love.graphics.setColor(255,25,25,45)
		end
		love.graphics.print(8,170+90*i-love.graphics.getFont():getWidth(8),30)
		if green then
			love.graphics.setColor(25,255,25)
		else
			love.graphics.setColor(255,25,25)
		end
		if tonumber(a)==1 then
			love.graphics.print(a,170+90*i-love.graphics.getFont():getWidth(a)+10,30)
		else
			love.graphics.print(a,170+90*i-love.graphics.getFont():getWidth(a),30)
		end
		i=i+1
	end
	if math.floor(countdown*2)%2==1 then
		if green then
			love.graphics.setColor(25,255,25)
		else
			love.graphics.setColor(255,25,25)
		end
	else
		if green then
			love.graphics.setColor(25,255,25,45)
		else
			love.graphics.setColor(255,25,25,45)
		end
	end
	love.graphics.print(":",203,20)
	love.graphics.print(":",403,20)
	love.graphics.setFont(smalfnt)
end