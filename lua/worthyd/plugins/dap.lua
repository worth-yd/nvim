return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-jdtls",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- Java Debug Adapter
			dap.adapters.java = function(callback)
				callback({
					type = "server",
					host = "127.0.0.1",
					port = 5005,
				})
			end

			dap.configurations.java = {
				{
					type = "java",
					request = "attach",
					name = "Attach to Java (Spring Boot)",
					hostName = "127.0.0.1",
					port = 5005,
				},
			}

			-- Keymaps
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "DAP Continue" })
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end, { desc = "DAP Step Over" })
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end, { desc = "DAP Step Into" })
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end, { desc = "DAP Step Out" })
			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
		end,
	},
}
