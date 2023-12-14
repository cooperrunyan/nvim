return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "creativenull/efmls-configs-nvim",
    "simrat39/rust-tools.nvim",
    'j-hui/fidget.nvim',
  },
  -- event = { "VeryLazy", "BufEnter" },
  config = function(_, opts)
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require('lspconfig')

    local lsp_defaults = lspconfig.util.default_config

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    lspconfig.glsl_analyzer.setup({
      on_attach = on_attach
    })

    mason_lspconfig.setup_handlers({
      function(srv)
        local o = {
          on_attach = on_attach,
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

        if srv == "taplo" then
          local inspect = function(f)
            return function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                f()
              end
            end
          end

          vim.keymap.set("n", "K", inspect(vim.lsp.buf.hover))
          vim.keymap.set("n", "<C-Space>", inspect(vim.lsp.buf.code_action))
        end

        lspconfig[srv].setup(o)
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
            "graphql",
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
          root_dir = require('lspconfig.util').root_pattern('Cargo.toml'),
          server = {
            settings = {
              ["rust-analyzer"] = opts.settings['rust-analyzer'],
            },
            root_dir = require('lspconfig.util').root_pattern('Cargo.toml'),
            standalone = false,
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
              -- vim.keymap.set("n", "<C-Space>", rt.code_action_group.code_action_group, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rc", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rp", rt.parent_module.parent_module, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rr", "<cmd>RustRun<CR>", { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rt", "<cmd>RustTest!<CR>", { buffer = bufnr })
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
