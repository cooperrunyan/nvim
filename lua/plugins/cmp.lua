return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-cmdline",
      'hrsh7th/cmp-calc',
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local compare = cmp.config.compare

      local opts = {
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 40,
            ellipsis_char = "...",
          }),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        completion = {
          completeopt = "menu,noinsert,preview",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping.confirm({ select = false }),
        }),

        sources = cmp.config.sources({
          { name = "crates",                   priority = 1000 },
          { name = "nvim_lsp",                 priority = 999 },
          { name = "nvim_lsp_signature_help",  priority = 998 },
          { name = "nvim_lsp_document_symbol", priority = 997 },
          { name = "nvim_lua",                 priority = 7 },
          { name = "luasnip",                  priority = 1 },
          { name = "buffer",                   priority = 2 },
          { name = "path",                     priority = 3 },
          { name = "git",                      priority = 4 },
          { name = "calc",                     priority = 5 },
          { name = "neorg",                    priority = 1001 }
        }),
        sorting = {
          priority_weight = 1.0,
          comparators = {
            -- compare.score_offset, -- not good at all
            compare.locality,
            compare.recently_used,
            compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            compare.offset,
            compare.order,
            -- compare.scopes, -- what?
            -- compare.sort_text,
            -- compare.exact,
            -- compare.kind,
            -- compare.length, -- useless
          },
        }
      }
      cmp.setup(opts)
      opts.sources = {
        { name = "cmdline" },
        { name = 'buffer' },
        { name = 'path' },
      }
      cmp.setup.cmdline({ '/', '?' }, opts)
      -- cmp.setup.cmdline(':', opts, { { name = 'cmdline' } })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    lazy = true,
    opts = {
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
}
