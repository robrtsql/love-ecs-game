local Hud = {}

function Hud:createEntity(scale)
    local image = love.graphics.newImage(
        'assets/sprites/hud/textbox.png')
    local font = love.graphics.newFont("assets/fonts/DTM-Mono.otf", 14 * scale)
    font:setFilter("nearest", "nearest", 0)
    return {
        hud = {
            dialogue = false,
            print = {},
            image = image,
            font = font,
            x = 0,
            y = 160,
            w = 320,
            h = 120,
            scale = scale,
            timer = 0
        }
    }
end

return Hud
