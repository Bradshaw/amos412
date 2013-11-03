log = {}
log.time = 0

function log.add(msg)
	table.insert(log,msg)
end

function log.corrupt()
	if #log>0 then
		m = math.random(1,#log)
		local str = log[m]
		if math.random()>0.7 then
			for i=1,3 do
				local ind = math.random(2,str:len()-1)
				log[m] = str:sub(1,ind-1)..chars[math.random(1,#chars)]..str:sub(ind+1,str:len())
			end
		elseif math.random()>0 then
			local n = math.random(1,#log)
			local str2 = log[n]
			local ind = math.random(2,math.min(str:len(),str2:len())-1)
			log[m] = str:sub(1,ind)..str2:sub(ind+1,str2:len())
			log[n] = str2:sub(1,ind)..str:sub(ind+1,str:len())
		end
	end
end

function log.display(x, y)
	log.update()
	love.graphics.setFont(tinyfnt)
	for i,v in ipairs(log) do
		love.graphics.printf(v,x, y+i*45-#log*45,280)
		--love.graphics.printf("---",x, y+i*45-#log*45+30,280)
	end
	love.graphics.setFont(smalfnt)
end

function log.update(dt)
	while #log > 6 do
		table.remove(log,1)
	end

end