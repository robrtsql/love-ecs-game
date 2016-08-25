local AnimationRenderSystem = tiny.processingSystem()

AnimationRenderSystem.filter = tiny.requireAll("animation", "position")

function AnimationRenderSystem:init(camera)
    self.cam = camera
end

function AnimationRenderSystem:process(e, dt)
    self.cam:attach()
    local animatedSprite = e.animation.animatedSprite
    local offset = e.animation.offset
    animatedSprite.x = e.position.x
    animatedSprite.y = e.position.y
    animatedSprite:draw(offset.x, offset.y)
    animatedSprite:update(dt)
    self.cam:detach()
end

return AnimationRenderSystem
