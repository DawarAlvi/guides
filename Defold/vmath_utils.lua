local M = {}

function M.look_at_2d(from, to, object_url) 
	local angle = math.atan2(from.x - to.x, to.y - from.y)
	go.set_rotation(vmath.quat_rotation_z(angle), object_url)
end

return M