local CameraFollowSystem = tiny.processingSystem()

CameraFollowSystem.filter = tiny.requireAll("cameraFollow", "position")

function CameraFollowSystem:init(camera)
    self.cam = camera
end

function CameraFollowSystem:process(e, dt)
    if (e.cameraFollow) then
        self.cam:lookAt(e.position.x, e.position.y)
    end
end

return CameraFollowSystem
