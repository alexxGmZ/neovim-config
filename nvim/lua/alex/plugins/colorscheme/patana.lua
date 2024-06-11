return {
	"cvigilv/patana.nvim",
	event = "CmdlineChanged",
	config = function ()
		require("patana").setup()
	end
}
