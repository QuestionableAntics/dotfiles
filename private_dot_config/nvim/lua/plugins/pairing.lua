-- if not pairing, return empty plugin list
if not Pairing then
	return {}
end

-- Track mouse
return {
	{
		"edluffy/specs.nvim",
		config = function()
			require("specs").setup({
				popup = {
					inc_ms = 30, -- time increments used for fade/resize effects
				},
			})
		end,
	},
}
