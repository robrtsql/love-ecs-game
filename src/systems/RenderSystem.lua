local RenderSystem = tiny.sortedProcessingSystem()

RenderSystem.filter = tiny.requireAll("renderPriority")

function RenderSystem:init(camera)
	self.cam = camera
    self.animationRenderSystem = require("src.systems.AnimationRenderSystem")
    self.animationRenderSystem:init(camera)
    self.spriteRenderSystem = require("src.systems.SpriteRenderSystem")
    self.spriteRenderSystem:init(camera)
    self.tileMapRenderSystem = require("src.systems.TileMapRenderSystem")
    self.tileMapRenderSystem:init(camera)
end

function RenderSystem:compare(e1, e2)
    return e1.renderPriority > e2.renderPriority
end

function RenderSystem:process(e, dt)
    if (e.animation and e.position) then
        self.animationRenderSystem:process(e, dt)
    elseif (e.sprite and e.position) then
        self.spriteRenderSystem:process(e, dt)
    elseif (e.tileMap and e.tileMapLayers) then
        self.tileMapRenderSystem:process(e, dt)
    end
end

return RenderSystem
