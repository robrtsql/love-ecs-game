local AnimationRenderSystem = {}

--FILTERED BY "animation" and "position"

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

    animatedSprite.x = math.floor(e.position.x + 0.5)
    animatedSprite.y = math.floor(e.position.y + 0.5)

    self.cam:attach()
    animatedSprite:draw(e.animation.offset.x, e.animation.offset.y)
    self.cam:detach()

    animatedSprite:update(dt)
end

return AnimationRenderSystem
