-- set color preferences
function MakeColorsPop(color)
    -- theme
    color = color or "rose-pine"

    -- set the theme
    vim.cmd.colorscheme(color)
    --
    -- color on normal mode
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

    -- color on float boxes
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

MakeColorsPop('tokyonight-night')
