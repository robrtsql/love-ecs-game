local SpriteRenderSystem = {}

-- FILTER BY "sprite" and "position"

function SpriteRenderSystem:init(camera)
    self.cam = camera
end

function SpriteRenderSystem:process(e, dt)
    self.cam:attach()
    local image = e.sprite.image
    local offset = e.sprite.offset
    love.graphics.draw(image, e.position.x + offset.x, e.position.y + offset.y)
    self.cam:detach()
end

return SpriteRenderSystem
