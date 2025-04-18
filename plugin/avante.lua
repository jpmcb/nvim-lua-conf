require("avante").setup({
	provider = "openai",
	openai = {
		endpoint = "https://api.openai.com/v1",
		model = "gpt-4.1",
		timeout = 30000,
		temperature = 0,
		max_completion_tokens = 8192,
	},
	system_prompt = function()
		local hub = require("mcphub").get_hub_instance()
		return hub:get_active_servers_prompt()
	end,
	custom_tools = function()
		return {
			require("mcphub.extensions.avante").mcp_tool(),
		}
	end,
})
