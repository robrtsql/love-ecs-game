local bump = require 'libs.bump'
local sti = require 'libs.sti'
local tiny = require 'libs.tiny'
local camera = require 'libs.hump.camera'
local Level = require "src.obj.Level"

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

function GameState:load(levelName)
    local mode = {}
    mode.vsync = true
    love.window.setMode(self.width, self.height, mode)
    love.graphics.setDefaultFilter("nearest", "nearest", 0)

    local bgColor = {backgroundColor = {r = 255, g = 255, b = 255}}

    self.bumpMoveSystem = require("src.systems.BumpMoveSystem")

    self.textbox = require("src.entity.Textbox"):createEntity(self.scale)

    local cam = camera.new()
    cam:zoomTo(self.scale)

    local hudCam = camera.new()
    hudCam:zoomTo(self.scale)
    hudCam:lookAt(self.origWidth / 2, self.origHeight / 2)

    self.playerControlSystem = require("src.systems.PlayerControlSystem")

    local collisionHandlerSystem = require("src.systems.CollisionHandlerSystem")
    collisionHandlerSystem.gameState = self

    local cameraFollowSystem = require("src.systems.CameraFollowSystem")
    cameraFollowSystem:init(cam)

    local cameraClampSystem = require("src.systems.CameraClampSystem")
    cameraClampSystem:init(cam)

    local renderSystem = require("src.systems.RenderSystem")
    renderSystem:init(cam)
    self.bumpMoveSystem.renderSystem = renderSystem

    local textboxSystem = require("src.systems.TextboxSystem")
    textboxSystem:init(hudCam)


    self.world = tiny.world(
        self.playerControlSystem,
        self.bumpMoveSystem,
        collisionHandlerSystem,
        cameraFollowSystem,
        cameraClampSystem,
        require("src.systems.DrawBackgroundSystem"),
        renderSystem,
        textboxSystem,
        bgColor,
        --bg,
        --playerEntity,
        --stumperEntity,
        --fg,
        self.textbox
    )

    --BEGIN level specific stuff
    self.currentLevel = Level.new(self.bumpMoveSystem, self.playerControlSystem,
        self.world, {destination=levelName})
    self.currentLevel:setup(self.textbox)
    --END level specific stuff
end

function GameState:draw()
    local dt = love.timer.getDelta()
    if self.world then
        self.world:update(dt)
    end
    if self.levelSwitch then
        self:switchLevel()
    end
end

function GameState:switchLevel()
    local oldPlayerEntity = self.currentLevel.playerEntity
    self.currentLevel:teardown()
    self.currentLevel = Level.new(self.bumpMoveSystem, self.playerControlSystem,
        self.world, self.levelSwitch)
    self.currentLevel:setup(self.textbox, oldPlayerEntity)
    self.levelSwitch = nil
end

function GameState:keypressed(key, scancode, isrepeat)
    if not isrepeat then
        --if key == "," then
        --end
    end
end
