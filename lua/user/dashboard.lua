local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Custom header
dashboard.section.header.val = {
    [[                                               ]],
    [[  ___ _ __ ___   ___ | |     __   _(_)_ __ ___  ]],
    [[ / __| '_ ` _ \ / _ \| |_____\ \ / / | '_ ` _ \ ]],
    [[ \__ \ | | | | | (_) | |______\ V /| | | | | | ]],
    [[ |___/_| |_| |_|\___/|_|       \_/ |_|_| |_| |_|]],
    [[                                               ]],
}
dashboard.section.header.opts = { hl = "CatppuccinFlamingo", position = "center" }

-- Define a custom command for the new file prompt and then open an existing file
vim.api.nvim_create_user_command('DashboardNewFile', function()
    vim.ui.input({ prompt = 'Enter file name: ' }, function(filename)
        if not filename or filename == '' then return end
        vim.ui.input({ prompt = 'Enter directory (Tab for completion): ', completion = 'dir' }, function(dir)
            if not dir or dir == '' then dir = '.' end
            local path = dir .. '/' .. filename
            vim.cmd('edit ' .. vim.fn.fnameescape(path))
        end)
    end)
end, {})

-- Define a custom command for opening an existing file and then showing the file tree
vim.api.nvim_create_user_command('DashboardExistingFile', function()
    local fb = require('telescope').extensions.file_browser
    fb.file_browser({
        prompt_title = 'Browse Files',
        path = vim.loop.cwd(),
        select_buffer = true,
        grouped = true,
        hidden = true,
        respect_gitignore = false,
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('i', '<CR>', function(prompt_bufnr)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local entry = action_state.get_selected_entry()
                    if entry and entry.path then
                        vim.cmd('edit ' .. vim.fn.fnameescape(entry.path))
                        require('nvim-tree.api').tree.open()
                    end
                end)()
            end)
            return true
        end,
    })
end, {})

dashboard.section.buttons.val = {
    dashboard.button('n', '  NEW FILE', ':DashboardNewFile<CR>'),
    dashboard.button('e', '  EXISTING FILE', ':DashboardExistingFile<CR>'),
}
dashboard.section.buttons.opts = { hl = "CatppuccinMauve", position = "center" }

dashboard.section.footer.val = { '🚀 Happy Coding! | "The best way to get started is to quit talking and begin doing." – Walt Disney' }
dashboard.section.footer.opts = { hl = "CatppuccinGreen", position = "center" }

alpha.setup(dashboard.config) 