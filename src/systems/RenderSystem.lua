local RenderSystem = tiny.sortedProcessingSystem()

RenderSystem.filter = tiny.requireAll("renderPriorityType")

function RenderSystem:init(camera)
	self.cam = camera
    self.animationRenderSystem = require("src.systems.AnimationRenderSystem")
    self.animationRenderSystem:init(camera)
    self.spriteRenderSystem = require("src.systems.SpriteRenderSystem")
    self.spriteRenderSystem:init(camera)
    self.tileMapRenderSystem = require("src.systems.TileMapRenderSystem")
    self.tileMapRenderSystem:init(camera)
end

-- Should e1 be drawn after e2?
function RenderSystem:compare(e1, e2)
	print('comparing!!')
	local e1type = e1.renderPriorityType
	local e2type = e2.renderPriorityType
	if e1type == "bg" and e2type == "bg" then return true
	elseif e1type == "bg" then return true
	elseif e2type == "bg" then return false
	elseif e1type == "fg" and e2type == "fg" then return false
	elseif e1type == "fg" then return false
	elseif e2type == "fg" then return true
	elseif e1type == "entity" and e2type == "entity" then
		return e1.position.y > e2.position.y
	elseif e1type == "entity" then return true
	elseif e2type == "entity" then return false
	end
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
