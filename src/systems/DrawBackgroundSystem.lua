local DrawBackgroundSystem = tiny.processingSystem()

function DrawBackgroundSystem:process(e, dt)
    local r1, g1, b1, a = love.graphics.getColor()
    love.graphics.setColor(100, 100, 0, 255)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(r1, g1, b1, a)
end

return DrawBackgroundSystem
