local lualine = require("lualine")

local function lsp_status()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return ""
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return " " .. client.name
        end
    end
    return ""
end

lualine.setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = ' ', right = ' ' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype', { lsp_status } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
})
