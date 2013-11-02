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