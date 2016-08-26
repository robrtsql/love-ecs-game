local TileMapRenderSystem = {}

-- FILTERED BY "tileMap" and "tileMapLayers"

function TileMapRenderSystem:init(camera)
	self.tileMap = tileMap
	self.bumpWorld = bumpWorld
	self.cam = camera
	self.layers = layers
end

function TileMapRenderSystem:process(e, dt)
	--clamp values
	local tileMap = e.tileMap
	local layers = e.tileMapLayers
	local camX, camY = self.cam:position()
	local mapWidth = tileMap.width * tileMap.tilewidth
	local mapHeight = tileMap.height * tileMap.tileheight
	local factor = 2 * self.cam.scale
	local minX = love.graphics.getWidth() / factor
	local minY = love.graphics.getHeight() / factor
	local maxX = mapWidth - love.graphics.getWidth() / factor
	local maxY = mapHeight - love.graphics.getHeight() / factor
	camX = math.max(minX, camX)
	camX = math.min(maxX, camX)
	camY = math.max(minY, camY)
	camY = math.min(maxY, camY)
	self.cam:lookAt(camX, camY)
	self.cam:attach()
	tileMap:update(dt)
	--TODO: we should cull some tiles via this draw range
	--tileMap:setDrawRange(-l, -t, w, h)
	for _, layer in ipairs(layers) do tileMap:drawLayer(layer) end
	--tileMap:bump_draw(bumpWorld)
	self.cam:detach()
end

return TileMapRenderSystem
