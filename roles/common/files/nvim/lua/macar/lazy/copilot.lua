return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            ["*"] = false,
            python = true,
        }
        vim.g.copilot_no_tab_map = true
        vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-line)')
        -- Create a toggle function
        local function toggle_copilot()
            if vim.g.copilot_enabled == false then
                vim.cmd('Copilot enable')
            else
                vim.cmd('Copilot disable')
            end
        end
        vim.keymap.set('n', '<M-e>', toggle_copilot, { desc = 'Toggle Copilot' })
    end
}
