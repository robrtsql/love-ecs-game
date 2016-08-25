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

function GameState:load()
    local mode = {}
    mode.vsync = true
    love.window.setMode(self.width, self.height, mode)
    love.graphics.setDefaultFilter("nearest", "nearest", 0)

    local cam = camera.new()
    cam:zoomTo(2)
    cam:lookAt(200, 200)

    local map = sti("assets/maps/town1.lua", { "bump" })
    local bumpWorld = bump.newWorld(64)
    map:bump_init(bumpWorld)

    local bgEntity = {
        backgroundColor = {
            r = 255,
            g = 255,
            b = 255
        }
    }

    local tileMapRenderSystem = require("src.systems.TileMapRenderSystem")
    tileMapRenderSystem:init(map, bumpWorld, cam)

    local playerSheet = love.graphics.newImage('assets/sprites/player/player.png')
    local animatedSprite = sodapop.newAnimatedSprite(16,24)
    animatedSprite:addAnimation('walkdown', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{1, 1, 2, 1, .3}}
    })
    animatedSprite:addAnimation('walkleft', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{3, 1, 4, 1, .3}}
    })
    animatedSprite:addAnimation('walkup', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{5, 1, 6, 1, .3}}
    })
    animatedSprite:addAnimation('walkright', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{7, 1, 8, 1, .3}}
    })
    animatedSprite:addAnimation('idledown', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{1, 1, 1, 1, .3}}
    })
    animatedSprite:addAnimation('idleleft', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{3, 1, 3, 1, .3}}
    })
    animatedSprite:addAnimation('idleup', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{5, 1, 5, 1, .3}}
    })
    animatedSprite:addAnimation('idleright', {
        image = playerSheet,
        frameWidth = 16,
        frameHeight = 28,
        frames = {{7, 1, 7, 1, .3}}
    })
    animatedSprite:switch('walkdown')
    local playerEntity = {
        position = {x = 64, y = 64},
        animation = {
            _current = "walkdown",
            animatedSprite = animatedSprite,
            offset = {x=8,y=1}
        },
        playerControl = {enabled=true,facing="down",speed=85},
        bumpMotion = {x = 0, y = 0},
        cameraFollow = true
    }
    bumpWorld:add(playerEntity, playerEntity.position.x,
        playerEntity.position.y, 15, 15)

    local bumpMoveSystem = require("src.systems.BumpMoveSystem")
    bumpMoveSystem:init(bumpWorld)

    local spriteRenderSystem = require("src.systems.SpriteRenderSystem")
    spriteRenderSystem:init(cam)

    local animationRenderSystem = require("src.systems.AnimationRenderSystem")
    animationRenderSystem:init(cam)

    local cameraFollowSystem = require("src.systems.CameraFollowSystem")
    cameraFollowSystem:init(cam)

    local world = tiny.world(
        require("src.systems.DrawBackgroundSystem"),
        tileMapRenderSystem,
        spriteRenderSystem,
        animationRenderSystem,
        require("src.systems.PlayerControlSystem"),
        bumpMoveSystem,
        cameraFollowSystem,
        bgEntity,
        playerEntity
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
