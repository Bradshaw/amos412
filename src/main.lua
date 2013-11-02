function love.load(arg)
	love.graphics.setDefaultFilter("nearest","nearest")
	math.randomseed(os.time())
	require("useful")
	require("chars")

	smalfnt = love.graphics.newFont("images/smal.ttf",32)
	bigfnt = love.graphics.newFont("images/digi.ttf",200)
	love.graphics.setFont(smalfnt)
	screen = love.graphics.newCanvas(1024,1024)
	flexeffect = love.graphics.newCanvas(1024,1024)
	gstate = require "gamestate"
	game = require("game")
	win = require("win")
	dead = require("dead")
	deathmusic = love.audio.newSource("audio/everyonedies.ogg")

	skul1 = love.graphics.newImage("images/Gameover_Skull1.png")
	skul2 = love.graphics.newImage("images/Gameover_Skull2.png")

	wireim = love.graphics.newImage("images/window_code.png")

	music = {}
	for i=1,5 do
		music[i] = love.audio.newSource("audio/prep_Track 0"..i..".ogg")
		music[i]:setLooping(true)
	end
	--music[1]:setVolume(0)
	--music[2]:setVolume(0)
	music[3]:setVolume(0)
	--music[4]:setVolume(0)
	--music[5]:setVolume(0)
	for i,v in ipairs(music) do
		v:play()
	end
	gstate.switch(game)
end


function love.focus(f)
	gstate.focus(f)
end

function love.mousepressed(x, y, btn)
	gstate.mousepressed(x, y, btn)
end

function love.mousereleased(x, y, btn)
	gstate.mousereleased(x, y, btn)
end

function love.joystickpressed(joystick, button)
	gstate.joystickpressed(joystick, button)
end

function love.joystickreleased(joystick, button)
	gstate.joystickreleased(joystick, button)
end

function love.quit()
	gstate.quit()
end

function love.keypressed(key, uni)
	gstate.keypressed(key, uni)
end

function love.keyreleased(key, uni)
	gstate.keyreleased(key)
end

function love.update(dt)
	gstate.update(dt)
end

function love.draw()
	gstate.draw()
end

