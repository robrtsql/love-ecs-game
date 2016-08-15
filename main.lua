tiny = require "libs.tiny"
require 'src.gamestate'

function love.load()
    gamestate = GameState.new()
    gamestate:load()
end

function love.update(dt)
    gamestate:update(dt)
end

function love.draw()
    gamestate:draw()
end

function love.keypressed(key, scancode, isrepeat)
    gamestate:keypressed(key, scancode, isrepeat)
end

--local tiny = require("tiny")

--local talkingSystem = tiny.processingSystem()
--talkingSystem.filter = tiny.requireAll("name", "mass", "phrase")

--function talkingSystem:process(e, dt)
--    e.mass = e.mass + dt * 3
--    print(("%s who weighs %d pounds, says %q."):format(e.name, e.mass, e.phrase))
--end

--local joe = {
--    name = "Joe",
--    phrase = "I'm a plumber.",
--    mass = 150,
--    hairColor = "brown"
--}

--local jeff = {
--    name = "Jeff",
--    phrase = "I'm not a plumber.",
--    hairColor = "brown",
--    mass = 120
--}

--local world = tiny.world(talkingSystem, joe)
--world:addEntity(jeff)

--for i = 1, 20 do
--    world:update(1)
--end
