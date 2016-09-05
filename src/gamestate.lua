local bump = require 'libs.bump'
local sti = require 'libs.sti'
local tiny = require 'libs.tiny'
local camera = require 'libs.hump.camera'

GameState = {}
GameState.__index = GameState
GameState.scale = 2
GameState.origWidth = 320
GameState.origHeight = 240
GameState.width = GameState.origWidth * GameState.scale
GameState.height = GameState.origHeight * GameState.scale

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

    local bgColor = {backgroundColor = {r = 255, g = 255, b = 255}}

    --BEGIN level specific stuff
    local map = sti(mapPath, { "bump" })
    local bumpWorld = bump.newWorld(64)
    map:bump_init(bumpWorld)
    objLayer = map.layers["obj"]
    for _, obj in ipairs(objLayer.objects) do
        bumpWorld:add(obj, obj.x, obj.y, obj.width, obj.height)
    end

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

    local bumpMoveSystem = require("src.systems.BumpMoveSystem")
    bumpMoveSystem:init(bumpWorld)
    --END level specific stuff

    local playerEntity = require("src.entity.Player"):createEntity()
    bumpWorld:add(playerEntity, playerEntity.position.x,
        playerEntity.position.y, playerEntity.hitbox.w, playerEntity.hitbox.h)

    local textbox = require("src.entity.Textbox"):createEntity(self.scale)
    playerEntity.textboxRef = textbox
    textbox.playerRef = playerEntity

    local cam = camera.new()
    cam:zoomTo(self.scale)

    local hudCam = camera.new()
    hudCam:zoomTo(self.scale)
    hudCam:lookAt(self.origWidth / 2, self.origHeight / 2)

    local playerControlSystem = require("src.systems.PlayerControlSystem")
    playerControlSystem:init(bumpWorld)

    local cameraFollowSystem = require("src.systems.CameraFollowSystem")
    cameraFollowSystem:init(cam)

    local cameraClampSystem = require("src.systems.CameraClampSystem")
    cameraClampSystem:init(cam)

    local renderSystem = require("src.systems.RenderSystem")
    renderSystem:init(cam)

    local textboxSystem = require("src.systems.TextboxSystem")
    textboxSystem:init(hudCam)


    local world = tiny.world(
        require("src.systems.PlayerControlSystem"),
        bumpMoveSystem,
        cameraFollowSystem,
        cameraClampSystem,
        require("src.systems.DrawBackgroundSystem"),
        renderSystem,
        textboxSystem,
        bgColor,
        bg,
        playerEntity,
        fg,
        textbox
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
