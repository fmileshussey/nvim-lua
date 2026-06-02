return {
    'ellisonleao/glow.nvim',
    ft = { 'markdown' },
    cmd = 'Glow',
    keys = {
        {
            '<leader>rm',
            function()
                local function find_readme(path)
                    return vim.fs.find(function(name)
                        return name:lower() == 'readme.md'
                    end, { upward = true, path = path, type = 'file' })[1]
                end

                local readme = find_readme(vim.fn.expand('%:p:h'))
                    or find_readme(vim.fn.getcwd())

                if readme then
                    vim.cmd('Glow ' .. vim.fn.fnameescape(readme))
                else
                    vim.notify('No README.md found', vim.log.levels.WARN)
                end
            end,
            desc = 'Preview project README with Glow',
        },
        {
            '<leader>?',
            function()
                vim.cmd('Glow ' .. vim.fn.fnameescape(vim.fn.stdpath('config') .. '/README.md'))
            end,
            desc = 'Show nvim config keybindings (README) with Glow',
        },
    },
    opts = {
        border = 'rounded',
        width_ratio = 0.85,
        height_ratio = 0.85,
    },
}
