vim.g.platform_detected = "none"
local handle = io.popen("lsb_release -i")
if handle ~= nil then
    local result = handle:read("*a")
    handle:close()
    -- From here, match on whichever distro you're looking to handle
    if result:match("Ubuntu") then
        vim.g.platform_detected = "Ubuntu"
    end
    if result:match("RedHat") then
        vim.g.platform_detected = "RedHat"
    end
else
    vim.g.platform_detected = "RedHat"
end
print("platform_detected = " .. vim.g.platform_detected)
