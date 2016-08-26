local TileMapRenderSystem = {}

-- FILTERED BY "tileMap" and "tileMapLayers"

function TileMapRenderSystem:init(camera)
	self.tileMap = tileMap
	self.bumpWorld = bumpWorld
	self.cam = camera
	self.layers = layers
end

function TileMapRenderSystem:process(e, dt)
	local tileMap = e.tileMap
	local layers = e.tileMapLayers
	self.cam:attach()
	--TODO: we should cull some tiles via this draw range
	--tileMap:setDrawRange(-l, -t, w, h)
	for _, layer in ipairs(layers) do tileMap:drawLayer(layer) end
	--tileMap:bump_draw(bumpWorld)
	self.cam:detach()
end

return TileMapRenderSystem
