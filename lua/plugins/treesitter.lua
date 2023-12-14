return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
  },
  -- cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  lazy = false,
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    autotag = { enable = true },
    incremental_selection = {
      enable = true,
    },
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "diff",
      "gitignore",
      "git_config",
      "gitignore",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "prisma",
      "query",
      "regex",
      "rust",
      "ron",
      "scss",
      "sql",
      "ssh_config",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      "glsl",
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  },
  config = function(_, opts)
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.cr8 = {
      install_info = {
        url = "~/dev/cr8/tool/lang/tree-sitter-cr8", -- local path or git repo
        files = { "src/parser.c" },                  -- note that some parsers also require src/scanner.c or src/scanner.cc
      },
      filetype = { "asm", "cr8" }
    }
    vim.treesitter.language.register('cr8', { 'asm', 'cr8' })
    require("nvim-treesitter.configs").setup(opts)
  end,
}
