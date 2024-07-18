-- NoHPCap v1.0.0
-- SmoothSpatula

log.info("Successfully loaded ".._ENV["!guid"]..".")

-- Getting the callback
local callback_names = gm.variable_global_get("callback_names")
local on_player_init_callback_id = 0
for i = 1, #callback_names do
    local callback_name = callback_names[i]
    if callback_name:match("onPlayerInit") then
        on_player_init_callback_id = i - 1
    end
end

-- Using the callback
gm.post_script_hook(gm.constants.callback_execute, function(self, other, result, args)
    if args[1].value == on_player_init_callback_id then
        self.maxhp_cap = 100000000
    end
end)
