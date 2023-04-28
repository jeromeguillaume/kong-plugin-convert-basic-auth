-- handler.lua
local plugin = {
    PRIORITY = 1800,
    VERSION = "0.1",
  }

function plugin:access(plugin_conf)

    kong.log.debug("access *** BEGIN ***")

    -- Handle Header
    local encode_base64 = ngx.encode_base64
    local xClientId     = kong.request.get_header (plugin_conf.client_id)
    local xClientSecret = kong.request.get_header (plugin_conf.client_secret)
    if xClientId and xClientSecret then
        kong.service.request.add_header ("Authorization", 'Basic ' .. encode_base64(xClientId .. ":" .. xClientSecret))
    else
        kong.log.debug("Unable to get headers " .. plugin_conf.client_id .. " and/or " .. plugin_conf.client_secret)
    end
    kong.log.debug("access *** END ***")
    
end

return plugin