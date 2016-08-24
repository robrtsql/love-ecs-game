require 'util'
local bump = require 'bump'
local sti = require 'sti'
local anim8 = require 'anim8'

Player = {}
Player.__index = Player

Player.x = 50
Player.y = 50

--hitbox
Player.ox = 4
Player.oy = 10
Player.w = 10
Player.h = 7

function Player.load()
    Player.sheet = love.graphics.newImage('characters/1.png')
end

function Player.new()
    local self = {}
    setmetatable(self,Player)
    self.grid = anim8.newGrid(16, 16, 64, 112)
    self.anim = anim8.newAnimation(self.grid(1,'1-4'), 0.2)
    return self
end

function Player:update(dt)
    self.anim:update(dt)
end

function Player:draw()
    self.anim:draw(self.sheet, round(self.x), round(self.y))
end

function Player:keypressed(key, scancode, isrepeat)
    if not isrepeat then
        --if key == "," then
        --end
    end
end
