local Stumper = {}
local sodapop = require("libs.sodapop")

function Stumper:createEntity()
    local stumperSheet = love.graphics.newImage(
        'assets/sprites/enemy/stumper.png')
    local animatedSprite = sodapop.newAnimatedSprite(11,23)
    animatedSprite:addAnimation('walk', {
        image = stumperSheet,
        frameWidth = 11,
        frameHeight = 23,
        frames = {{1, 1, 2, 1, .3}}
    })
    animatedSprite:switch('walk')
    return {
        position = {x = 80, y = 128},
        animation = {
            _current = "walk",
            animatedSprite = animatedSprite,
            offset = {x=6,y=3}
        },
        bumpMotion = {x = 0, y = 0},
        hitbox = {w = 11, h = 13},
        renderPriority = 21,
        renderPriorityType = "entity"
    }
end

return Stumper
