tiny = require "libs.tiny"
require 'src.gamestate'

function love.load()
    gamestate = GameState.new()
    gamestate:load()
end

function love.update(dt)
end

function love.draw()
    gamestate:draw()
end

function love.keypressed(key, scancode, isrepeat)
    gamestate:keypressed(key, scancode, isrepeat)
end
