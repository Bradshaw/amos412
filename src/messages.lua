messages = {}

function messages.corrupt(m)
	local str = messages[m]
	if math.random()>0.7 then
		for i=1,3 do
			local ind = math.random(2,str:len()-1)
			messages[m] = str:sub(1,ind-1)..chars[math.random(1,#chars)]..str:sub(ind+1,str:len())
		end
	elseif math.random()>0.7 then
		local n = math.random(1,#messages)
		local str2 = messages[n]
		local ind = math.random(2,math.min(str:len(),str2:len())-1)
		messages[m] = str:sub(1,ind)..str2:sub(ind+1,str2:len())
		messages[n] = str2:sub(1,ind)..str:sub(ind+1,str:len())
	end
end

table.insert(messages, "Remember: No good deed goes unpunished")
table.insert(messages, "You lived alone, and you will die alone")
table.insert(messages, "Curiosity killed the cat... painfully")
table.insert(messages, "Fail, and they die, succeed, and they suffer")
table.insert(messages, "Mc Pixel would probably know what to do...")
table.insert(messages, "Mind precedes all mental states. Mind is their chief.")
table.insert(messages, "Heedfulness is the path to the Deathless.")
table.insert(messages, "All tremble at the rod, all are fearful of death.")
table.insert(messages, "How is there joy, as this world is always burning?")
table.insert(messages, "Worn out is this body, a nest of diseases, dissolving.")
table.insert(messages, "One truly is the protector of oneself.")
table.insert(messages, "There are so few who see things as they truly are.")

