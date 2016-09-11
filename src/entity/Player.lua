local Player = {}
local sodapop = require("libs.sodapop")

function Player:createEntity(x, y)
    local w = 16
    local h = 28
    local playerSheet = love.graphics.newImage(
        'assets/sprites/player/player.png')
    local animatedSprite = sodapop.newAnimatedSprite(w,h)
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
    return {
        tag = "player",
        position = {x = x, y = y},
        animation = {
            _current = "walkdown",
            animatedSprite = animatedSprite,
            offset = {x = 8, y = 1}
        },
        playerControl = {enabled=true,facing="down",speed=85},
        bumpMotion = {x = 0, y = 0},
        collisions = {},
        hitbox = {w = 15, h = 15},
        cameraFollow = true,
        renderPriority = 20,
        renderPriorityType = "entity",
    }
end

return Player
