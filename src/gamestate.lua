local bump = require 'libs.bump'
local sti = require 'libs.sti'
local tiny = require 'libs.tiny'
local camera = require 'libs.hump.camera'
local sodapop = require 'libs.sodapop'

GameState = {}
GameState.__index = GameState
GameState.width = 640
GameState.height = 480

function GameState.new()
    local self = {}
    setmetatable(self,GameState)
    return self
end

function GameState:load(mapPath)
    local mode = {}
    mode.vsync = true
    love.window.setMode(self.width, self.height, mode)
    love.graphics.setDefaultFilter("nearest", "nearest", 0)

    local cam = camera.new()
    cam:zoomTo(2)
    cam:lookAt(200, 200)

    local map = sti(mapPath, { "bump" })
    local bumpWorld = bump.newWorld(64)
    map:bump_init(bumpWorld)

    local bgEntity = {backgroundColor = {r = 255, g = 255, b = 255}}

    local bg = {
        tileMap = map,
        tileMapLayers = { map.layers[1], map.layers[2] },
        renderPriority = 100,
        cameraClamp = true
    }

    local fg = {
        tileMap = map,
        tileMapLayers = { map.layers[3] },
        renderPriority = 10
    }

    local renderSystem = require("src.systems.RenderSystem")
    renderSystem:init(cam)

    local playerEntity = require("src.entity.Player"):createEntity()
    bumpWorld:add(playerEntity, playerEntity.position.x,
        playerEntity.position.y, playerEntity.hitbox.w, playerEntity.hitbox.h)

    local bumpMoveSystem = require("src.systems.BumpMoveSystem")
    bumpMoveSystem:init(bumpWorld)

    local animationRenderSystem = require("src.systems.AnimationRenderSystem")
    animationRenderSystem:init(cam)

    local cameraFollowSystem = require("src.systems.CameraFollowSystem")
    cameraFollowSystem:init(cam)

    local cameraClampSystem = require("src.systems.CameraClampSystem")
    cameraClampSystem:init(cam)

    local world = tiny.world(
        require("src.systems.PlayerControlSystem"),
        bumpMoveSystem,
        cameraFollowSystem,
        cameraClampSystem,
        require("src.systems.DrawBackgroundSystem"),
        renderSystem,
        bgEntity,
        bg,
        playerEntity,
        fg
    )

    self.world = world
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
