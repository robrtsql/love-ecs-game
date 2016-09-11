local Textblock = require("src.obj.Textblock")
local json = require("libs.json")

local Textbox = {}

function Textbox:createEntity(scale)
    local image = love.graphics.newImage(
        'assets/sprites/hud/textbox.png')
    local font = love.graphics.newFont("assets/fonts/DTM-Mono.otf", 14 * scale)
    font:setFilter("nearest", "nearest", 0)
    return {
        textbox = {
            dialogue = false,
            print = {},
            image = image,
            font = font,
            x = 0,
            y = 160,
            w = 320,
            h = 120,
            scale = scale,
            timer = 0,
            index = 0
        }
    }
end

function Textbox.setText(e, text)
    e.textbox.textblocks = {}

    local blocks = text.message

    for _, block in ipairs(blocks) do
        local effects = block.effects
        table.insert(e.textbox.textblocks,
            Textblock.new(block.text, e.textbox.font, effects))
    end

    e.textbox.index = 1
end

function Textbox.advance(e)
    if not e.textbox.textblocks[e.textbox.index]:advanceTextIfTyping() then
        e.textbox.index = e.textbox.index + 1
        if e.textbox.index > table.getn(e.textbox.textblocks) then
            e.textbox.index = 0
            e.playerRef.playerControl.enabled = true
        end
    end
end

function Textbox.interact(e, text)
    if e.textbox.index == 0 then
        Textbox.setText(e, text)
        e.playerRef.playerControl.enabled = false
    else
        Textbox.advance(e)
    end
end

return Textbox
