return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- locates a sqls.yml file in the project directory falling back to global config
      local function find_sqls_config_file(file_path)
        local dir = vim.fn.fnamemodify(file_path, ":p:h")
        local config_file = dir .. "/.sqls.yml"
        while dir ~= "/" do
          if vim.fn.filereadable(config_file) == 1 then
            return config_file
          end
          dir = vim.fn.fnamemodify(dir, ":h")
          config_file = dir .. "/.sqls.yml"
        end
        return os.getenv("HOME") .. "/.sqls.yml"
      end

      require("lspconfig").sqls.setup({
        on_new_config = function(new_config, new_root_dir)
          local config_file = find_sqls_config_file(vim.api.nvim_buf_get_name(0))
          new_config.cmd = { "sqls", "-config", config_file }
        end,
      })
    end,
  },
}
