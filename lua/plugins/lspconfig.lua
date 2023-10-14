return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "lukas-reineke/lsp-format.nvim",
    "simrat39/rust-tools.nvim",
    "creativenull/efmls-configs-nvim",
  },
  event = "BufEnter",
  config = function(_, opts)
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local on_attach = function(client, bufnr)
      require('lsp-format').on_attach(client, bufnr)
    end

    vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)

    mason_lspconfig.setup_handlers({
      function(srv)
        local o = {
          on_attach = on_attach,
          capabilities = capabilities,
          auto_format = true,
        }

        if srv == "lua_ls" then
          o.settings = {
            Lua = opts.settings.Lua
          }
        end

        if srv == "bashls" then
          o.filetypes = { "zsh", "bash", "sh" }
        end

        if srv == "denols" then
          o.root_dir = require('lspconfig.util').root_pattern('deno.json')
        end


        require('lspconfig')[srv].setup(o)
      end,
      ['biome'] = function() end,
      ['efm'] = function()
        local fs = require('efmls-configs.fs')
        local biome = require('efmls-configs.formatters.biome')
        local prettierd = require('efmls-configs.formatters.prettier_d')
        local denomd = {
          formatStdin = true,
          formatCommand = fs.executable("deno") .. " fmt --ext md -",
        }

        require('lspconfig').efm.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          auto_format = true,
          init_options = { documentFormatting = true },
          filetypes = {
            "javascriptreact",
            "javascript",
            "typescriptreact",
            "typescript",
            "css",
            "html",
            "markdown",
            "yaml",
            "graphql"
          },
          settings = {
            languages = {
              javascript = { biome },
              javascriptreact = { biome },
              typescript = { biome },
              typescriptreact = { biome },
              css = { biome },
              html = { biome },
              markdown = { denomd },
              yaml = { prettierd },
              graphql = { prettierd },
            }
          }
        })
      end,
      ['rust_analyzer'] = function()
        local rt = require("rust-tools")

        rt.setup({
          server = {
            settings = {
              ["rust-analyzer"] = opts.settings['rust-analyzer'],
            },
            capabilities = capabilities,
            auto_format = true,
            standalone = false,
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rc", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rp", rt.parent_module.parent_module, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rr", "<cmd>RustRun<CR>", { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rt", "<cmd>RustTest!<CR>", { buffer = bufnr })
              vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
              vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)
            end,
          },
        })
      end
    })
  end,
  opts = {
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
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  }
}
