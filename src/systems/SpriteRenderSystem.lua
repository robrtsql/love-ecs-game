local SpriteRenderSystem = tiny.processingSystem()

SpriteRenderSystem.filter = tiny.requireAll("sprite", "position")

function SpriteRenderSystem:process(e, dt)
    local image = e.sprite.image
    local offset = e.sprite.offset
    love.graphics.draw(image, e.position.x + offset.x, e.position.y + offset.y)
end

return SpriteRenderSystem
