local bump = require 'libs.bump'
local sti = require 'libs.sti'

Level = {}
Level.__index = Level

function Level.new(bumpMoveSystem, playerControlSystem, world)
    local self = {}
    setmetatable(self,Level)
    self.playerControlSystem = playerControlSystem
    self.bumpMoveSystem = bumpMoveSystem
    self.world = world
    self.entities = {}
    return self
end

function Level:teardown()
    for _, entity in ipairs(self.entities) do
        self.world:removeEntity(entity)
    end
end

function Level:setup(mapPath, textbox)
    local path = "assets/maps/" .. mapPath .. ".lua"
    local map = sti(path, { "bump" })
    self.bumpWorld = bump.newWorld(64)
    map:bump_init(self.bumpWorld)
    objLayer = map.layers["obj"]
    for _, obj in ipairs(objLayer.objects) do
        self.bumpWorld:add(obj, obj.x, obj.y, obj.width, obj.height)
    end

    local bg = {
        tileMap = map,
        tileMapLayers = { map.layers[1], map.layers[2] },
        renderPriority = 100,
        renderPriorityType = "bg",
        cameraClamp = true
    }
    local fg = {
        tileMap = map,
        tileMapLayers = { map.layers[3] },
        renderPriority = 10,
        renderPriorityType = "fg"
    }

    local playerEntity = require("src.entity.Player"):createEntity()
    self.bumpWorld:add(playerEntity, playerEntity.position.x + (playerEntity.hitbox.w/2),
        playerEntity.position.y - (playerEntity.hitbox.h/2), playerEntity.hitbox.w, playerEntity.hitbox.h)

    local stumperEntity = require("src.entity.enemy.Stumper"):createEntity()
    self.bumpWorld:add(stumperEntity, stumperEntity.position.x,
        stumperEntity.position.y, stumperEntity.hitbox.w, stumperEntity.hitbox.h)

    self.bumpMoveSystem:init(self.bumpWorld)
    self.playerControlSystem:init(self.bumpWorld)

    self.world:addEntity(bg)
    self.world:addEntity(playerEntity)
    self.world:addEntity(stumperEntity)
    self.world:addEntity(fg)
    self.entities = {bg, playerEntity, stumperEntity, fg}

    playerEntity.textboxRef = textbox
    textbox.playerRef = playerEntity
end

return Level
