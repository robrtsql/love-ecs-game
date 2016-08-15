local DrawBackgroundSystem = tiny.processingSystem()

DrawBackgroundSystem.filter = tiny.requireAll("backgroundColor")

function DrawBackgroundSystem:process(e, dt)
    local r1, g1, b1, a = love.graphics.getColor()
    local bg = e.backgroundColor
    love.graphics.setColor(bg.r, bg.g, bg.b, 255)
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()
    local verts = {0, 0, w, 0, w, h, 0, h}
    love.graphics.polygon("fill", verts)
    love.graphics.setColor(r1, g1, b1, a)
end

return DrawBackgroundSystem
