local M = {}

M.dark = {
    -- Base colors
    white = "#e8e6e3", -- Warm off-white for primary text
    darker_black = "#000000", -- Pure black for deepest elements
    black = "#0a0a0a", -- Main background (luxury dark)
    black2 = "#121212", -- Slight elevation

    -- Background layers (subtle luxury gradations)
    one_bg = "#161616", -- Base UI elements
    one_bg2 = "#1c1c1c", -- Secondary backgrounds
    one_bg3 = "#242424", -- Tertiary backgrounds

    -- Greys (warm undertones for luxury feel)
    grey = "#2d2d2d", -- Borders/dividers
    grey_fg = "#555555", -- Muted text
    grey_fg2 = "#777777", -- Secondary muted text
    light_grey = "#999999", -- Lighter muted text

    -- Accent colors (sophisticated, desaturated luxury palette)
    red = "#c97a7a", -- Muted rose
    light_red = "#1a0c0c",
    light_red2 = "#2a1414",
    baby_pink = "#d4a0a0", -- Soft rose
    pink = "#e8a0b0", -- Muted blush

    green = "#8aa87d", -- Sage green
    light_green = "#0d140a",
    light_green2 = "#162012",
    light_green3 = "#3d5a33",
    vibrant_green = "#7dab8a", -- Soft emerald

    nord_blue = "#7a9bb5", -- Muted steel blue
    blue = "#7a9bb5", -- Consistent muted blue

    yellow = "#d4c48a", -- Muted gold
    sun = "#d4b87a", -- Warm gold

    purple = "#b89ab8", -- Muted lavender
    dark_purple = "#a080a0", -- Deeper muted purple

    teal = "#6a9a9a", -- Muted teal
    orange = "#c99070", -- Muted terracotta
    cyan = "#8aaac0", -- Muted sky blue

    -- Statusline
    statusline_bg = "#0a0a0a",
    lightbg = "#161616",
    pmenu_bg = "#7a9bb5",
    folder_bg = "#7a9bb5",

    -- Base16 compatibility (with luxury touches)
    base00 = "#0a0a0a", -- Background
    base01 = "#161616", -- Slight lighter
    base02 = "#242424", -- Mid-tone
    base03 = "#3d3d3d", -- Visible separation
    base04 = "#666666", -- Muted text
    base05 = "#e8e6e3", -- Primary text (warm white)
    base06 = "#eeebe8", -- Slightly brighter text
    base07 = "#f5f2ef", -- Brightest text

    -- Base16 accent colors (luxury palette)
    base08 = "#c97a7a", -- Red (muted rose)
    base09 = "#c99070", -- Orange (terracotta)
    base0A = "#d4b87a", -- Yellow (gold)
    base0B = "#8aa87d", -- Green (sage)
    base0C = "#6a9a9a", -- Cyan (muted teal)
    base0D = "#7a9bb5", -- Blue (steel blue)
    base0E = "#b89ab8", -- Purple (lavender)
    base0F = "#b08070", -- Brown (warm taupe)

    -- Additional luxury elements
    special1 = "#d4c48a", -- Gold accent
    special2 = "#161616", -- Matching dark layer
    none = "NONE",

    -- Extra luxury accents (you can use these for specific elements)
    gold = "#c9a84c", -- Metallic gold
    rose_gold = "#c99a8a", -- Rose gold
    champagne = "#d4c4b0", -- Champagne
    ivory = "#f0ebe6", -- Ivory white
    charcoal = "#2a2a2a", -- Rich charcoal
    pewter = "#6a6a6a", -- Muted metallic
}

return M
