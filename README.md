# ⚓ ahoy.nvim
Export markdown files from neovim as PDF.

**Currently relies on [pandoc](https://pandoc.org)**

# Example Config

## lazy.nvim

This setup will map `<leader>sf` to the save_file function.

```lua
return {
  "calcu1on/ahoy.nvim",
  config = function()
    local ahoy = require("ahoy")
    vim.keymap.set('n', '<leader>sf', function() ahoy.save_file() end)
  end
}
```
--- 
# To Do
- [ ] Make more general purpose instesd of PDF only
- [ ] Create renderer to avoid need of pandoc
- [ ] Add tests
- [ ] Create configurable `Notes` path
  - [ ] This should also handle creating the directory gracefully
- [ ] Error message if `pandoc` is not available
- [ ] Determine styling options
