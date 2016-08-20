local gamera = require 'libs.gamera'
local bump = require 'libs.bump'
local sti = require 'libs.sti'
local tiny = require 'libs.tiny'

GameState = {}
GameState.__index = GameState
GameState.width = 640
GameState.height = 480

function GameState.new()
    local self = {}
    setmetatable(self,GameState)
    return self
end

function GameState:load()
    local mode = {}
    mode.vsync = true
    love.window.setMode(self.width, self.height, mode)
    love.graphics.setDefaultFilter("nearest", "nearest", 0)

    local map = sti("assets/maps/town1.lua", { "bump" })
    local bumpWorld = bump.newWorld(64)
    map:bump_init(bumpWorld)

    --local camera = gamera.new(0, 0, self.width, self.height)
    --camera:setScale(2)
    local bgEntity = {
        backgroundColor = {
            r = 255,
            g = 255,
            b = 255
        }
    }

    local tileMapRenderSystem = require("src.systems.TileMapRenderSystem")
    tileMapRenderSystem:init(map)

    local world = tiny.world(
        require("src.systems.DrawBackgroundSystem"),
        tileMapRenderSystem,
        bgEntity
    )

    self.world = world
end

function GameState:update(dt)
end

function GameState:draw()
    local dt = love.timer.getDelta()
    if self.world then
        self.world:update(dt)
    end
end

function GameState:keypressed(key, scancode, isrepeat)
    if not isrepeat then
        --if key == "," then
        --end
    end
end
