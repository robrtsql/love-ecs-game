local AnimationRenderSystem = tiny.processingSystem()

AnimationRenderSystem.filter = tiny.requireAll("animation", "position")

function AnimationRenderSystem:init(camera)
    self.cam = camera
end

function AnimationRenderSystem:process(e, dt)
    local animatedSprite = e.animation.animatedSprite
    if (e.animation.next and e.animation.next ~= e.animation._current) then
        e.animation._current = e.animation.next
        e.animation.next = nil
        animatedSprite:switch(e.animation._current)
    end

    local offset = e.animation.offset
    animatedSprite.x = e.position.x
    animatedSprite.y = e.position.y

    self.cam:attach()
    animatedSprite:draw(offset.x, offset.y)
    self.cam:detach()

    animatedSprite:update(dt)
end

return AnimationRenderSystem
