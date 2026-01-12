local M = {}
--- Convert screen to world coordinates taking into account
-- the view and projection of a specific camera
-- @param camera URL of camera to use for conversion
-- @param screen_x Screen x coordinate to convert
-- @param screen_y Screen y coordinate to convert
-- @param z optional z coordinate to pass through the conversion, defaults to 0
-- @return world_x The resulting world x coordinate of the screen coordinate
-- @return world_y The resulting world y coordinate of the screen coordinate
-- @return world_z The resulting world z coordinate of the screen coordinate
function M.screen_to_world(camera_url, screen_x, screen_y, z)
	z = z or 0
	local projection = go.get(camera_url, "projection")
	local view = go.get(camera_url, "view")
	local w = sys.get_config_int("display.width")
	local h = sys.get_config_int("display.height")

	-- https://defold.com/manuals/camera/#converting-mouse-to-world-coordinates
	local inv = vmath.inv(projection * view)
	local x = (2 * screen_x / w) - 1
	local y = (2 * screen_y / h) - 1
	local x1 = x * inv.m00 + y * inv.m01 + z * inv.m02 + inv.m03
	local y1 = x * inv.m10 + y * inv.m11 + z * inv.m12 + inv.m13
	return x1, y1, z or 0
end

local function adapt_zoom(self, camera_url, original_zoom)
	local display_width = sys.get_config_int("display.width")
	local display_height = sys.get_config_int("display.height")
	local window_width,window_height = window.get_size()
	local display_scale = window.get_display_scale()
	local zoom = original_zoom * math.max(window_width / display_scale / display_width, window_height / display_scale / display_height)
	go.set(camera_url, "orthographic_zoom", zoom)
end

function M.enable_adaptive_zoom(self, camera_url)
	local original_zoom = go.get(camera_url, "orthographic_zoom")
	adapt_zoom(self, camera_url, original_zoom)
	window.set_listener(function(self, event, data)
		if event == window.WINDOW_EVENT_RESIZED then
			adapt_zoom(self, camera_url, original_zoom)
		end
	end)
end

return M
