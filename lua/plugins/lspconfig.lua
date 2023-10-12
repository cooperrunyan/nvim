return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  event = "VeryLazy",
  config = function()
    local lspconfig = require("lspconfig")
    local def = lspconfig.util.default_config

    def.capabilities =
        vim.tbl_deep_extend("force", def.capabilities, require("cmp_nvim_lsp").default_capabilities())

    local on_attach = function() end

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      auto_format = true,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- lspconfig.rust_analyzer.setup({
    -- 	capabilities = capabilities,
    -- 	on_attach = on_attach,
    -- 	auto_format = true,
    -- 	filetypes = { "rust" },
    -- 	root_dir = util.root_pattern("Cargo.toml"),
    -- 	settings = {
    -- 		["rust-analyzer"] = {
    -- 			cargo = {
    -- 				allFeatures = true,
    -- 				loadOutDirsFromCheck = true,
    -- 				runBuildScripts = true,
    -- 			},
    -- 			checkOnSave = {
    -- 				allFeatures = true,
    -- 				command = "clippy",
    -- 				extraArgs = { "--no-deps" },
    -- 			},
    -- 			procMacro = {
    -- 				enable = true,
    -- 				ignored = {
    -- 					["async-trait"] = { "async_trait" },
    -- 					["napi-derive"] = { "napi" },
    -- 					["async-recursion"] = { "async_recursion" },
    -- 				},
    -- 			},
    -- 		},
    -- 	},
    -- })
  end,
}
