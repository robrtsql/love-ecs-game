local SpriteRenderSystem = tiny.processingSystem()

SpriteRenderSystem.filter = tiny.requireAll("sprite", "position")

function SpriteRenderSystem:process(e, dt)
    love.graphics.draw(e.sprite, e.position.x, e.position.y)
end

return SpriteRenderSystem
