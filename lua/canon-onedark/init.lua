local variants = require("canon-onedark.colors")
local utils = require("canon-onedark.utils")
local cfg = require("canon-onedark.config").config
local c = variants[cfg.variant]
local M = {}

local set_terminal_colors = function()
    vim.g.terminal_color_0 = c.base01
    vim.g.terminal_color_1 = c.base08
    vim.g.terminal_color_2 = c.base0B
    vim.g.terminal_color_3 = c.base0A
    vim.g.terminal_color_4 = c.base0D
    vim.g.terminal_color_5 = c.base0E
    vim.g.terminal_color_6 = c.base0C
    vim.g.terminal_color_7 = c.base05
    vim.g.terminal_color_8 = c.base03
    vim.g.terminal_color_9 = c.base08
    vim.g.terminal_color_10 = c.base0B
    vim.g.terminal_color_11 = c.base0A
    vim.g.terminal_color_12 = c.base0D
    vim.g.terminal_color_13 = c.base0E
    vim.g.terminal_color_14 = c.base0C
    vim.g.terminal_color_15 = c.base07
    vim.g.terminal_color_background = c.base05
    vim.g.terminal_color_foreground = c.base00
end

local set_link_groups = function()
    vim.cmd([[
        " Keywords
        " hi! link @attribute                             PreProc
        " hi! link @module                                Include

        "
        " hi! link @lsp.type.selfKeyword                      @variable.builtin
        " hi! link @lsp.type.selfTypeKeyword                  @variable.builtin
        " hi! link @lsp.typemod.variable.defaultLibrary       @variable.builtin
        "
        " hi! link @markup.environment                        Macro
        "
        " hi! link @constant                                  Constant
        " hi! link @lsp.type.enumMember                       @constant
        " hi! link @lsp.typemod.variable.static               @constant
        hi! link TreesitterContext                     CursorLine
        hi! link MatchParen                            MatchWord
        hi! link @conditional                          Conditional
        "hi! link @exception                                   Exception
        hi! link @include                              Include
        " hi! link @tag.attribute                             @property
        hi! link WhichKeyFloat                         NormalFloat
        hi! link @keyword.import                       Include
        hi! link TroubleSignWarning                    DiagnosticWarn
        hi! link TroubleSignHint                       DiagnosticHint
        hi! link TroubleSignOther                      DiagnosticNormal
        hi! link TroubleSignError                      DiagnosticError
        hi! link TroubleFoldIcon                       Folded
        hi! link TroubleIndent                         Comment
        hi! link MasonHighlightBlockBold               MasonHighlightBlock
        hi! link MasonHeaderSecondary                  MasonHighlightBlock

        " Semantic Tokens
        hi! link @lsp.type.class                       Structure
        hi! link @lsp.type.decorator                   Function
        hi! link @lsp.type.enum                        Type
        hi! link @lsp.type.enumMember                  Constant
        hi! link @lsp.type.function                    @function
        hi! link @lsp.type.interface                   Structure 
        hi! link @lsp.type.macro                       @macro 
        hi! link @lsp.type.method                      @function.method 
        hi! link @lsp.type.namespace                   @module 
        hi! link @lsp.type.parameter                   @variable.parameter 
        hi! link @lsp.type.property                    @property 
        hi! link @lsp.type.struct                      Structure 
        hi! link @lsp.type.type                        @type 
        hi! link @lsp.type.typeParamater               Typedef 
        hi! link @lsp.type.variable                    @variable 
        hi! link @lsp.type.variable                    @variable 

        hi! link @markup.heading.1.markdown             markdownH1
        hi! link @markup.heading.2.markdown             markdownH2
        hi! link @markup.heading.3.markdown             markdownH3
        hi! link @markup.heading.4.markdown             markdownH4
        hi! link @markup.heading.5.markdown             markdownH5
        hi! link @markup.heading.6.markdown             markdownH6
        hi! link @markup.heading.1.marker.markdown      @conceal
        hi! link @markup.heading.2.marker.markdown      @conceal
        hi! link @markup.heading.3.marker.markdown      @conceal
        hi! link @markup.heading.4.marker.markdown      @conceal
        hi! link @markup.heading.5.marker.markdown      @conceal
        hi! link @markup.heading.6.marker.markdown      @conceal
        hi! link @spell.markdown                        Normal
        hi! link markdownError                          Normal
        hi! link FzfLuaFilePart                         FzfLuaFzfNormal

        ]])
end
local set_groups = function()
    local highlights = {
        -- Semantic Tokens
        { hg = "@event", fg = c.base08, bg = c.none },
        { hg = "@modifier", fg = c.base08, bg = c.none },
        { hg = "@regexp", fg = c.base0F, bg = c.none },

        { hg = "Added", fg = c.green, bg = c.none },
        { hg = "Removed", fg = c.red, bg = c.none },
        { hg = "Changed", fg = c.yellow, bg = c.none },
        { hg = "NvimInternalError", fg = c.red, bg = c.none },
        { hg = "DevIconDefault", fg = c.red, bg = c.none },
        { hg = "healthSuccess", fg = c.black, bg = c.green },
        { hg = "WinSeparator", fg = c.line, bg = c.none },
        { hg = "CursorLineNr", fg = c.white, bg = c.none },
        { hg = "CursorLine", fg = c.none, bg = c.black2 },
        { hg = "Normal", fg = c.base05, bg = cfg.transparent and c.none or c.base00 },
        { hg = "NormalNC", fg = c.base05, bg = c.base00 }, -- normal text
        { hg = "NormalFloat", fg = c.none, bg = c.darker_black }, -- Normal text in floating windows.
        { hg = "SignColumn", fg = c.base03, bg = c.none, guisp = c.none }, -- column where signs are displayed
        { hg = "MsgArea", fg = c.base05, bg = c.base00 },
        { hg = "ModeMsg", fg = c.base0B, bg = c.none }, --' showmode' message (e.g., "-- INSERT --")
        { hg = "MsgSeparator", fg = c.base05, bg = c.base00 },
        { hg = "WarningMsg", fg = c.base08, bg = c.none },
        { hg = "ErrorMsg", fg = c.base08, bg = c.base00 },
        { hg = "MoreMsg", fg = c.base0B, bg = c.none }, -- more-prompt
        { hg = "SpellBad", fg = c.none, bg = c.none, guisp = c.base08, gui = "undercurl" },
        { hg = "SpellCap", fg = c.none, bg = c.none, guisp = c.base0D, gui = "undercurl" },
        { hg = "SpellLocal", fg = c.none, bg = c.none, guisp = c.base0C, gui = "undercurl" },
        { hg = "SpellRare", fg = c.none, bg = c.none, guisp = c.base0E, gui = "undercurl" },
        { hg = "Pmenu", fg = c.none, bg = c.one_gb },
        { hg = "PmenuSel", fg = c.black, bg = c.pmenu_bg },
        { hg = "PmenuSbar", fg = c.none, bg = c.one_gb },
        { hg = "PmenuThumb", fg = c.none, bg = c.grey },
        { hg = "WildMenu", fg = c.base08, bg = c.base0A },
        { hg = "Comment", fg = c.grey_fg, gb = c.none, gui = cfg.comment_style },
        { hg = "Folded", fg = c.light_grey, bg = c.black2 },
        { hg = "FoldColumn", fg = c.base0C, bg = c.base00 },
        { hg = "LineNr", fg = c.grey, bg = c.none },
        { hg = "FloatBorder", fg = c.blue, bg = c.none },
        { hg = "FloatTitle", fg = c.white, bg = c.grey },
        { hg = "VertSplit", fg = c.line, bg = c.none },
        { hg = "Cursor", fg = c.base00, bg = c.base05 },
        { hg = "CursorColumn", fg = c.none, bg = c.base01, guisp = c.none },
        -- { hg = "lCursor", fg = c.black, bg = c.fg }, -- the character under the cursor
        -- { hg = "CursorIM" }, -- like Cursor, but used when in IME mode
        { hg = "ColorColumn", fg = c.none, bg = c.black2 },
        { hg = "Visual", fg = c.none, bg = c.base02 },
        { hg = "VisualNOS", fg = c.base08, bg = c.none },
        { hg = "QuickFixLine", fg = c.none, bg = c.base01, guisp = c.none },
        { hg = "MatchWord", fg = c.white, bg = c.grey, gui = "bold", cterm = "underline" },
        { hg = "Conceal", fg = c.none, bg = c.none },
        { hg = "Directory", fg = c.base0D, bg = c.none },
        { hg = "SpecialKey", fg = c.base03, bg = c.none },
        { hg = "Special", fg = c.base0C, bg = c.none },
        { hg = "SpecialChar", fg = c.base0F, bg = c.none },
        -- { hg = "SpecialComment", fg = c.grey_fg },
        { hg = "TooLong", fg = c.base08, bg = c.none },
        { hg = "Title", fg = c.base0D, bg = c.none, guisp = c.none },
        { hg = "Search", fg = c.base01, bg = c.base0A },
        { hg = "IncSearch", fg = c.base01, bg = c.base09 },
        { hg = "Substitute", fg = c.base01, bg = c.base0A, guisp = c.none },
        { hg = "Question", fg = c.base0D, bg = c.none },
        { hg = "NonText", fg = c.base03, bg = c.none },
        { hg = "Variable", fg = c.base05, bg = c.none },
        { hg = "String", fg = c.base0B, bg = c.none },
        { hg = "Character", fg = c.base08, bg = c.none },
        { hg = "Constant", fg = c.base08, bg = c.none },
        { hg = "Number", fg = c.base09, bg = c.none },
        { hg = "Boolean", fg = c.base09, bg = c.none, cfg.boolean_style },
        { hg = "Float", fg = c.base09, bg = c.none },
        { hg = "Identifier", fg = c.base08, bg = c.none, guisp = c.none, cfg.variable_style },
        { hg = "Function", fg = c.base0D, bg = c.none, gui = cfg.function_style },
        { hg = "Operator", fg = c.base05, bg = c.none, guisp = c.none },
        { hg = "Type", fg = c.base0A, bg = c.none, guisp = c.none },
        { hg = "StorageClass", fg = c.base0A, bg = c.none },
        { hg = "Structure", fg = c.base0E, bg = c.none },
        { hg = "Typedef", fg = c.base0A, bg = c.none },
        { hg = "Keyword", fg = c.base0E, bg = c.none, gui = cfg.keyword_style },
        { hg = "Statement", fg = c.base08, bg = c.none },
        { hg = "Conditional", fg = c.base0E, bg = c.none },
        { hg = "Repeat", fg = c.base0A, bg = c.none },
        { hg = "Label", fg = c.base0A, bg = c.none },
        { hg = "Exception", fg = c.base08, bg = c.none },
        { hg = "Include", fg = c.base0D, bg = c.none },
        { hg = "PreProc", fg = c.base0A, bg = c.none },
        { hg = "Define", fg = c.base0E, bg = c.none, guisp = c.none },
        { hg = "Delimiter", fg = c.base0F, bg = c.none },
        { hg = "Macro", fg = c.base08, bg = c.none },
        { hg = "Tag", fg = c.base0A, bg = c.none },
        { hg = "Debug", fg = c.base08, bg = c.none },
        { hg = "Underlined", fg = c.none, bg = c.none, gui = "underline" },
        { hg = "Bold", fg = c.none, bg = c.none, gui = "bold" },
        { hg = "Italic", fg = c.none, bg = c.none, gui = "italic" },
        { hg = "Ignore", fg = c.cyan, bg = c.base01 },
        { hg = "Todo", fg = c.base0A, bg = c.base01 },
        { hg = "Error", fg = c.base00, bg = c.base08 },
        { hg = "TabLine", fg = c.light_grey }, -- tab pages line, not active tab page label
        { hg = "TabLineFill", fg = c.white }, -- tab pages line, where there are no labels
        { hg = "TabLineSel", fg = c.line }, -- tab pages line, active tab page label
        -- Related to nvim-navic
        -- { hg = "TabLine", fg = c.light_gray, bg = c.line },
        -- { hg = "TabLineFill", fg = c.white, bg = c.line },
        -- { hg = "TabLineSel", fg = c.line, bg = c.line },

        -- Treesitter
        { hg = "@annotation", fg = c.base0F, bg = c.none },
        { hg = "@attribute", fg = c.base0A, bg = c.none },
        { hg = "@constructor", fg = c.base0C, bg = c.none },
        -- { hg = "@constructor.javascript", fg = c.yellow },
        { hg = "@type.builtin", fg = c.base0A, bg = c.none },
        -- { hg = "@type.qualifier", fg = c.white, gui = "bold" },
        { hg = "@definition", fg = c.none, bg = c.none, guisp = c.base04, gui = "underline" },
        { hg = "@exception", fg = c.base08, bg = c.none },
        { hg = "@keyword.exception", fg = c.base08, bg = c.none },
        { hg = "@keyword", fg = c.base0E, bg = c.none },
        { hg = "@keyword.function", fg = c.base0E, bg = c.none, gui = cfg.keyword_style },
        { hg = "@keyword.return", fg = c.base0E, bg = c.none },
        { hg = "@keyword.operator", fg = c.base0E, bg = c.none },
        { hg = "@keyword.conditional", fg = c.base0E, bg = c.none },
        { hg = "@keyword.conditional.ternary", fg = c.base0E, bg = c.none },
        { hg = "@keyword.repeat", fg = c.base0A, bg = c.none },
        { hg = "@keyword.storage", fg = c.base0A, bg = c.none },
        { hg = "@keyword.directive.define", fg = c.base0E, bg = c.none },
        { hg = "@keyword.directive", fg = c.base0A, bg = c.none },
        -- { hg = "@keyword.clojure", fg = c.bright_cyan, gui = cfg.keyword_style },
        -- { hg = "@keyword.function.clojure", fg = c.bright_cyan, gui = cfg.function_style },
        -- TypeScript, REACT
        { hg = "@keyword.function.tsx", fg = c.cyan },
        { hg = "@namespace", fg = c.base08, bg = c.none },
        { hg = "@constant", fg = c.base08, bg = c.none },
        { hg = "@constant.builtin", fg = c.base09, bg = c.none },
        { hg = "@constant.macro", fg = c.base08, bg = c.none },
        { hg = "@number", fg = c.base09, bg = c.none },
        { hg = "@number.float", fg = c.base09, bg = c.none },
        { hg = "@float", fg = c.base09, bg = c.none },
        { hg = "@character", fg = c.base08, bg = c.none },
        -- { hg = "@character.special", fg = c.base08, bg = c.none },
        { hg = "@error", fg = c.base08, bg = c.none },
        { hg = "@function", fg = c.base0D, bg = c.none },
        { hg = "@function.builtin", fg = c.base0D, bg = c.none },
        { hg = "@function.macro", fg = c.base08, bg = c.none },
        { hg = "@function.call", fg = c.base0D, bg = c.none },
        { hg = "@function.method", fg = c.base0D, bg = c.none },
        { hg = "@function.method.call", fg = c.base0D, bg = c.none },
        { hg = "@operator", fg = c.base05, bg = c.none },
        { hg = "@reference", fg = c.base05, bg = c.none },
        { hg = "@method", fg = c.base0D, bg = c.none },
        { hg = "@variable", fg = c.base05, bg = c.none, gui = cfg.variable_style },
        { hg = "@variable.builtin", fg = c.base09, bg = c.none, gui = cfg.variable_style },
        { hg = "@variable.parameter", fg = c.base08, bg = c.none, gui = cfg.variable_style },
        { hg = "@variable.member", fg = c.base08, bg = c.none },
        { hg = "@variable.member.key", fg = c.base08, bg = c.none },
        { hg = "@module", fg = c.base08, bg = c.none },
        -- { hg = "@module.builtin", fg = c.base08 },
        { hg = "@property", fg = c.base08, bg = c.none },
        { hg = "@field", fg = c.base0D, bg = c.none },
        { hg = "@parameter", fg = c.base08, bg = c.none },
        { hg = "@parameter.reference", fg = c.base05, bg = c.none },
        { hg = "@symbol", fg = c.base0B, bg = c.none },
        { hg = "@text", fg = c.base05, bg = c.none },
        { hg = "@text.uri", fg = c.base09, bg = c.none },
        { hg = "@text.emphasis", fg = c.base09, bg = c.none },
        { hg = "@text.strike", fg = c.base0F, bg = c.none, gui = "strikethrough" },
        { hg = "@punctuation.bracket", fg = c.base0F, bg = c.none },
        { hg = "@punctuation.delimiter", fg = c.base0F, bg = c.none },
        -- { hg = "@punctuation.special", fg = c.base08, bg = c.none },
        -- { hg = "@punctuation.bracket.rust", fg = c.yellow },
        { hg = "@tag.attribute", fg = c.base08, bg = c.none },
        { hg = "@tag.delimiter", fg = c.base0F, bg = c.none },
        -- { hg = "@tag.tsx", fg = c.cyan },
        { hg = "@string", fg = c.base0B, bg = c.none },
        { hg = "@string.regex", fg = c.base0C, bg = c.none },
        { hg = "@string.escape", fg = c.base0C, bg = c.none },
        { hg = "@emphasis", fg = c.base09, bg = c.none },
        { hg = "@literal", fg = c.base09, bg = c.none },
        { hg = "@strong", fg = c.none, bg = c.none, gui = "bold" },
        { hg = "@scope", fg = c.none, bg = c.none, gui = "bold" },
        { hg = "@comment", fg = c.grey_fg, bg = c.none },
        { hg = "@comment.todo", fg = c.grey, bg = c.white },
        { hg = "@comment.warning", fg = c.black2, bg = c.base09 },
        { hg = "@comment.note", fg = c.black, bg = c.blue },
        { hg = "@comment.danger", fg = c.black2, bg = c.red },
        { hg = "@diff.plus", fg = c.green, bg = c.none },
        { hg = "@diff.minus", fg = c.red, bg = c.none },
        { hg = "@diff.plus", fg = c.light_grey, bg = c.none },

        { hg = "@markup.heading", fg = c.base0D, gui = "bold" },
        -- { hg = "@markup.heading.1.markdown", fg = c.red, gui = "bold" },
        -- { hg = "@markup.heading.1.marker.markdown", fg = c.red, gui = "bold" },
        -- { hg = "@markup.heading.2.markdown", fg = c.orange2, gui = "bold" },
        -- { hg = "@markup.heading.2.marker.markdown", fg = c.orange2, gui = "bold" },
        -- { hg = "@markup.heading.3.markdown", fg = c.yellow, gui = "bold" },
        -- { hg = "@markup.heading.3.marker.markdown", fg = c.yellow, gui = "bold" },
        -- { hg = "@markup.heading.4.markdown", fg = c.green, gui = "bold" },
        -- { hg = "@markup.heading.4.marker.markdown", fg = c.green, gui = "bold" },
        -- { hg = "@markup.heading.5.markdown", fg = c.gray_blue, gui = "bold" },
        -- { hg = "@markup.heading.5.marker.markdown", fg = c.gray_blue, gui = "bold" },
        -- { hg = "@markup.heading.6.markdown", fg = c.magenta, gui = "bold" },
        -- { hg = "@markup.heading.6.marker.markdown", fg = c.magenta, gui = "bold" },
        -- { hg = "@text.reference.markdown_inline", fg = c.gray07  },
        -- { hg = "@markup.raw.markdown_inline", fg = c.gray05, bg = c.gray09, gui = "bold" },
        { hg = "@markup.raw", fg = c.base09, bg = c.none },
        { hg = "@markup.link", fg = c.base08 },
        -- { hg = "@markup.link.url.markdown_inline", fg = c.gray04, gui = "underline" },
        { hg = "@markup.link.url", fg = c.base09, bg = c.none, gui = "underline" },
        { hg = "@markup.link.label", fg = c.base0C, bg = c.none },
        { hg = "@markup.list", fg = c.base08, bg = c.none },
        { hg = "@markup.strong", fg = c.none, bg = c.none, gui = "bold" },
        -- { hg = "@markup.strong.markdown_inline", fg = c.gray07, gui = "bold" },
        { hg = "@markup.underline", fg = c.none, bg = c.none, gui = "underline" },
        -- { hg = "@markup.italic.markdown_inline", fg = c.medium_gray_blue, gui = "italic" },
        { hg = "@markup.italic", fg = c.none, bg = c.none, gui = "italic" },
        -- { hg = "@markup.quote.markdown", fg = c.bright_white, bg = c.gray08, gui = "bold,italic" },
        { hg = "@markup.strikethrough", fg = c.none, bg = c.none, gui = "strikethrough" },
        { hg = "@markup.quote", fg = c.none, bg = c.black2 },

        -- markdown

        { hg = "markdownBlockquote", fg = c.green, bg = c.none },
        { hg = "markdownCode", fg = c.orange, bg = c.none },
        { hg = "markdownCodeBlock", fg = c.orange, bg = c.none },
        { hg = "markdownCodeDelimiter", fg = c.orange, bg = c.none },
        { hg = "markdownH1", fg = c.blue, bg = c.none, gui = "bold" },
        { hg = "markdownH2", fg = c.sun, bg = c.none, gui = "bold" },
        { hg = "markdownH3", fg = c.green, bg = c.none, gui = "bold" },
        { hg = "markdownH4", fg = c.vibrant_green, bg = c.none, gui = "bold" },
        { hg = "markdownH5", fg = c.dark_purple, bg = c.none, gui = "bold" },
        { hg = "markdownH6", fg = c.purple, bg = c.none, gui = "bold" },
        { hg = "markdownHeadingDelimiter", fg = c.blue, bg = c.none },
        { hg = "markdownHeadingRule", fg = c.base05, bg = c.none, gui = "bold" },
        { hg = "markdownId", fg = c.purple, bg = c.none },
        { hg = "markdownIdDeclaration", fg = c.blue, bg = c.none },
        { hg = "markdownIdDelimiter", fg = c.light_grey, bg = c.none },
        { hg = "markdownLinkDelimiter", fg = c.light_grey, bg = c.none },
        { hg = "markdownBold", fg = c.blue, bg = c.none, gui = "bold" },
        { hg = "markdownItalic", fg = c.none, bg = c.none, gui = "italic" },
        { hg = "markdownBoldItalic", fg = c.yellow, bg = c.none, gui = "bold,italic" },
        { hg = "markdownListMarker", fg = c.blue, bg = c.none },
        { hg = "markdownOrderedListMarker", fg = c.blue, bg = c.none },
        { hg = "markdownRule", fg = c.base01, bg = c.none },
        { hg = "markdownUrl", fg = c.cyan, bg = c.none, gui = "underline" },
        { hg = "markdownLinkText", fg = c.blue, bg = c.none },
        { hg = "markdownFootnote", fg = c.orange, bg = c.none },
        { hg = "markdownFootnoteDefinition", fg = c.orange, bg = c.none },
        { hg = "markdownEscape", fg = c.yellow, bg = c.none },

        -- Whichkey
        { hg = "WhichKey", fg = c.blue, bg = c.none },
        { hg = "WhichKeySeperator", fg = c.light_grey, bg = c.none },
        { hg = "WhichKeyDesc", fg = c.red, bg = c.none },
        { hg = "WhichKeyGroup", fg = c.green, bg = c.none },
        { hg = "WhichKeyValue", fg = c.green, bg = c.none },

        -- Git
        { hg = "SignAdd", fg = c.green, bg = c.none },
        { hg = "SignChange", fg = c.blue, bg = c.none },
        { hg = "SignDelete", fg = c.red, bg = c.none },
        { hg = "GitSignsAdd", fg = c.green, bg = c.none },
        { hg = "GitSignsChange", fg = c.blue, bg = c.none },
        { hg = "GitSignsDelete", fg = c.red, bg = c.none },

        -- LSP
        -- Lsp Diagnostics
        { hg = "DiagnosticError", fg = c.base08, bg = c.none },
        { hg = "DiagnosticWarning", fg = c.base09, bg = c.none },
        { hg = "DiagnosticHint", fg = c.purple, bg = c.none },
        { hg = "DiagnosticWarn", fg = c.yellow, bg = c.none },
        { hg = "DiagnosticInfo", fg = c.green, bg = c.none },
        { hg = "LspSignatureActiveParameter", fg = c.black, bg = c.green },

        { hg = "RenamerTitle", fg = c.black, bg = c.red },
        { hg = "RenamerBorder", fg = c.red, bg = c.none },

        { hg = "LspInlayHint", fg = c.light_grey, bg = c.black2 },

        -- { hg = "DiagnosticOk", fg = c.green },
        -- { hg = "DiagnosticUnderlineError", bg = c.dark_red, fg = c.red, gui = "underline" },
        -- { hg = "DiagnosticUnderlineWarn", bg = c.dark_yellow, fg = c.yellow, gui = "underline" },
        -- { hg = "DiagnosticUnderlineInfo", bg = c.dark_blue, fg = c.blue, gui = "underline" },
        -- { hg = "DiagnosticUnderlineHint", bg = c.dark_cyan, fg = c.cyan, gui = "underline" },
        { hg = "LspDiagnosticsDefaultError", fg = c.base08, bg = c.none },
        { hg = "LspDiagnosticsDefaultWarning", fg = c.base09, bg = c.none },
        { hg = "LspDiagnosticsDefaultInformation", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsDefaultInfo", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsDefaultHint", fg = c.purple, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextError", fg = c.base08, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextWarning", fg = c.base09, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextInformation", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextInfo", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsDefaultHint", fg = c.purple, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextError", fg = c.base08, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextWarning", fg = c.base09, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextInformation", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextInfo", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsVirtualTextHint", fg = c.purple, bg = c.none },
        { hg = "LspDiagnosticsFloatingError", fg = c.base08, bg = c.none },
        { hg = "LspDiagnosticsFloatingWarning", fg = c.base09, bg = c.none },
        { hg = "LspDiagnosticsFloatingInformation", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsFloatingInfo", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsFloatingHint", fg = c.purple, bg = c.none },
        { hg = "DiagnosticSignError", fg = c.base08, bg = c.none },
        { hg = "DiagnosticSignWarning", fg = c.base09, bg = c.none },
        { hg = "DiagnosticSignInformation", fg = c.sun, bg = c.none },
        { hg = "DiagnosticSignInfo", fg = c.sun, bg = c.none },
        { hg = "DiagnosticSignHint", fg = c.purple, bg = c.none },
        { hg = "LspDiagnosticsSignError", fg = c.base08, bg = c.none },
        { hg = "LspDiagnosticsSignWarning", fg = c.base09, bg = c.none },
        { hg = "LspDiagnosticsSignInformation", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsSignInfo", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsSignHint", fg = c.purple, bg = c.none },
        { hg = "LspDiagnosticsError", fg = c.base08, bg = c.none },
        { hg = "LspDiagnosticsWarning", fg = c.base09, bg = c.none },
        { hg = "LspDiagnosticsInformation", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsInfo", fg = c.sun, bg = c.none },
        { hg = "LspDiagnosticsHint", fg = c.purple, bg = c.none },
        { hg = "LspDiagnosticsUnderlineError", fg = c.none, bg = c.none, gui = "underline" },
        { hg = "LspDiagnosticsUnderlineWarning", fg = c.none, bg = c.none, gui = "underline" },
        { hg = "LspDiagnosticsUnderlineInformation", fg = c.none, bg = c.none, gui = "underline" },
        { hg = "LspDiagnosticsUnderlineInfo", fg = c.none, bg = c.none, gui = "underline" },
        { hg = "LspDiagnosticsUnderlineHint", fg = c.none, bg = c.none, gui = "underline" },

        -- LSP Reference
        { hg = "LspReferenceRead", fg = c.none, bg = c.line2 },
        { hg = "LspReferenceText", fg = c.none, bg = c.line2 },
        { hg = "LspReferenceWrite", fg = c.none, bg = c.line2 },

        { hg = "LspCodeLens", fg = c.base04, bg = c.none, gui = "italic" },
        { hg = "LspCodeLensSeparator", fg = c.base04, bg = c.none, gui = "italic" },

        -- Telescope
        -- { hg = "TelescopeMatching", fg = c.yellow, gui = "bold" },
        { hg = "TelescopeNormal", fg = c.none, bg = c.darker_black },
        { hg = "TelescopePreviewTitle", fg = c.black, bg = c.green, gui = "bold" },
        { hg = "TelescopePromptTitle", fg = c.black, bg = c.red, gui = "bold" },
        { hg = "TelescopeResultsTitle", fg = c.darker_black, bg = c.darker_black, gui = "bold" },
        { hg = "TelescopeSelection", fg = c.white, bg = c.black2 },
        { hg = "TelescopeBorder", fg = c.darker_black, bg = c.darker_black },
        { hg = "TelescopePromptBorder", fg = c.black2, bg = c.black2 },
        { hg = "TelescopePromptNormal", fg = c.white, bg = c.black2 },
        { hg = "TelescopePromptPrefix", fg = c.red, bg = c.black2 },
        { hg = "TelescopeResultsDiffAdd", fg = c.green, bg = c.none },
        { hg = "TelescopeResultsDiffChange", fg = c.blue, bg = c.none },
        { hg = "TelescopeResultsDiffDelete", fg = c.red, bg = c.none },

        -- NvimTree
        { hg = "NvimTreeFolderIcon", fg = c.blue, bg = c.none },
        { hg = "NvimTreeIndentMarker", fg = c.special1, bg = c.none },
        { hg = "NvimTreeNormal", fg = c.none, bg = c.darker_black },
        { hg = "NvimTreeVertSplit", fg = c.darker_black, bg = c.darker_black },
        { hg = "NvimTreeFolderName", fg = c.blue, bg = c.darker_black },
        { hg = "NvimTreeOpenedFolderName", fg = c.blue, bg = c.none, gui = "bold,italic" },
        { hg = "NvimTreeEmptyFolderName", fg = c.grey, bg = c.none, gui = "italic" },
        { hg = "NvimTreeEmptyFolderName", fg = c.grey, bg = c.none, gui = "italic" },
        { hg = "NvimTreeGitIgnored", fg = c.grey, bg = c.none, gui = "italic" },
        { hg = "NvimTreeImageFile", fg = c.light_grey, bg = c.none },
        { hg = "NvimTreeSpecialFile", fg = c.orange, bg = c.none },
        { hg = "NvimTreeEndOfBuffer", fg = c.darker_black, bg = c.none },
        { hg = "NvimTreeCursorLine", fg = c.none, bg = c.special2 },
        { hg = "NvimTreeGitignoreIcon", fg = c.red, bg = c.none },
        { hg = "NvimTreeGitStaged", fg = c.vibrant_green, bg = c.none },
        { hg = "NvimTreeGitNew", fg = c.vibrant_green, bg = c.none },
        { hg = "NvimTreeGitRenamed", fg = c.vibrant_green, bg = c.none },
        { hg = "NvimTreeGitDeleted", fg = c.red, bg = c.none },
        { hg = "NvimTreeGitMerge", fg = c.blue, bg = c.none },
        { hg = "NvimTreeGitDirty", fg = c.blue, bg = c.none },
        { hg = "NvimTreeSymlink", fg = c.cyan, bg = c.none },
        { hg = "NvimTreeRootFolder", fg = c.base05, bg = c.none, gui = "bold" },
        { hg = "NvimTreeExecFile", fg = c.green, bg = c.none },

        -- Buffer
        { hg = "BufferCurrent", fg = c.base05, bg = c.base00 },
        { hg = "BufferCurrentIndex", fg = c.base05, bg = c.base00 },
        { hg = "BufferCurrentMod", fg = c.sun, bg = c.base00 },
        { hg = "BufferCurrentSign", fg = c.purple, bg = c.base00 },
        { hg = "BufferCurrentTarget", fg = c.red, bg = c.base00, gui = "bold" },
        { hg = "BufferVisible", fg = c.base05, bg = c.base00 },
        { hg = "BufferVisibleIndex", fg = c.base05, bg = c.base00 },
        { hg = "BufferVisibleMod", fg = c.sun, bg = c.base00 },
        { hg = "BufferVisibleSign", fg = c.grey, bg = c.base00 },
        { hg = "BufferVisibleTarget", fg = c.red, bg = c.base00, gui = "bold" },
        { hg = "BufferInactive", fg = c.grey, bg = c.darker_black },
        { hg = "BufferInactiveIndex", fg = c.grey, bg = c.darker_black },
        { hg = "BufferInactiveMod", fg = c.sun, bg = c.darker_black },
        { hg = "BufferInactiveSign", fg = c.grey, bg = c.darker_black },
        { hg = "BufferInactiveTarget", fg = c.red, bg = c.darker_black, gui = "bold" },

        -- StatusLine
        { hg = "StatusLine", fg = c.line, bg = c.statusline_bg },
        { hg = "StatusLineNC", fg = c.none, bg = c.statusline_bg },
        { hg = "StatusLineSeparator", fg = c.line, bg = c.none },
        { hg = "StatusLineTerm", fg = c.line, bg = c.none },
        { hg = "StatusLineTermNC", fg = c.line, bg = c.none },

        -- IndentBlankline
        { hg = "IndentBlanklineContextChar", fg = c.grey, bg = c.none },
        { hg = "IndentBlanklineContextStart", fg = c.none, bg = c.one_bg2 },
        { hg = "IndentBlanklineChar", fg = c.line, bg = c.none },
        { hg = "IndentBlanklineSpaceChar", fg = c.line, bg = c.none },
        { hg = "IndentBlanklineSpaceCharBlankline", fg = c.sun, bg = c.none },

        -- Dashboard
        { hg = "DashboardHeader", fg = c.blue, bg = c.none },
        { hg = "DashboardCenter", fg = c.purple, bg = c.none },
        { hg = "DashboardFooter", fg = c.cyan, bg = c.none },

        -- Cmp

        { hg = "CursorLineBG", bg = c.blue },
        { hg = "CmpItemAbbr", fg = c.white, bg = c.none },
        { hg = "CmpItemAbbrMatch", fg = c.blue, bg = c.none },
        { hg = "CmpDoc", fg = c.black, bg = c.none },
        { hg = "CmpDocBorder", fg = c.grey_fg, bg = c.none },
        { hg = "CmpPmenu", fg = c.black, bg = c.none },
        { hg = "CmpSel", fg = c.black, bg = c.pmenu_bg, gui = "bold" },
        -- { hg = "CmpItemAbbrDeprecated", fg = c.grey, bg = c.none, gui = "strikethrough" },
        -- { hg = "CmpItemAbbrMatchFuzzy", fg = c.blue, bg = c.none },
        { hg = "CmpItemMenu", fg = c.light_grey, gui = "italic" },

        { hg = "CmpItemKindConstant", fg = c.base09, bg = c.none },
        { hg = "CmpItemKindFunction", fg = c.base0D, bg = c.none },
        { hg = "CmpItemKindIdentifier", fg = c.base08, bg = c.none },
        { hg = "CmpItemKindField", fg = c.base08, bg = c.none },
        { hg = "CmpItemKindVariable", fg = c.base0E, bg = c.none },
        { hg = "CmpItemKindSnippet", fg = c.red, bg = c.none },
        { hg = "CmpItemKindText", fg = c.base0B, bg = c.none },
        { hg = "CmpItemKindStructure", fg = c.base0E, bg = c.none },
        { hg = "CmpItemKindType", fg = c.base0A, bg = c.none },
        { hg = "CmpItemKindKeyword", fg = c.base07, bg = c.none },
        { hg = "CmpItemKindMethod", fg = c.base0D, bg = c.none },
        { hg = "CmpItemKindConstructor", fg = c.blue, bg = c.none },
        { hg = "CmpItemKindFolder", fg = c.base07, bg = c.none },
        { hg = "CmpItemKindModule", fg = c.base0A, bg = c.none },
        { hg = "CmpItemKindProperty", fg = c.base08, bg = c.none },
        { hg = "CmpItemKindEnum", fg = c.blue, bg = c.none },
        { hg = "CmpItemKindUnit", fg = c.base0E, bg = c.none },
        { hg = "CmpItemKindClass", fg = c.teal, bg = c.none },
        { hg = "CmpItemKindFile", fg = c.base07, bg = c.none },
        { hg = "CmpItemKindInterface", fg = c.green, bg = c.none },
        { hg = "CmpItemKindColor", fg = c.white, bg = c.none },
        { hg = "CmpItemKindReference", fg = c.base05, bg = c.none },
        { hg = "CmpItemKindEnumMember", fg = c.purple, bg = c.none },
        { hg = "CmpItemKindStruct", fg = c.base0E, bg = c.none },
        { hg = "CmpItemKindValue", fg = c.cyan, bg = c.none },
        { hg = "CmpItemKindEvent", fg = c.yellow, bg = c.none },
        { hg = "CmpItemKindOperator", fg = c.base05, bg = c.none },
        { hg = "CmpItemKindTypeParameter", fg = c.base08, bg = c.none },
        { hg = "CmpItemKindCopilot", fg = c.green, bg = c.none },
        { hg = "CmpItemKindCodeium", fg = c.vibrant_green, bg = c.none },
        { hg = "CmpItemKindTabNine", fg = c.baby_pink, bg = c.none },
        { hg = "CmpItemKindSuperMaven", fg = c.yellow, bg = c.none },

        -- ToggleTerm
        { hg = "ToggleTerm1FloatBorder", fg = c.line, bg = c.none },

        -- Illuminate
        { hg = "illuminatedWord", fg = c.none, bg = c.base02, guisp = c.none },
        { hg = "illuminatedCurWord", fg = c.none, bg = c.base02, guisp = c.none },
        { hg = "IlluminatedWordText", fg = c.none, bg = c.base02, guisp = c.none },
        { hg = "IlluminatedWordRead", fg = c.none, bg = c.base02, guisp = c.none },
        { hg = "IlluminatedWordWrite", fg = c.none, bg = c.base02, guisp = c.none },

        -- Lazy.nvim
        { hg = "LazyH1", fg = c.black, bg = c.green },
        { hg = "LazyButton", fg = c.light_grey, bg = c.one_gb },
        { hg = "LazyH2", fg = c.red, bg = c.none, gui = "bold,underline" },
        { hg = "LazyReasonPlugin", fg = c.red, bg = c.none },
        { hg = "LazyValue", fg = c.teal, bg = c.none },
        { hg = "LazyDir", fg = c.base05, bg = c.none },
        { hg = "LazyUrl", fg = c.base05, bg = c.none },
        { hg = "LazyCommit", fg = c.green, bg = c.none },
        { hg = "LazyNoCond", fg = c.red, bg = c.none },
        { hg = "LazySpecial", fg = c.blue, bg = c.none },
        { hg = "LazyReasonFt", fg = c.purple, bg = c.none },
        { hg = "LazyOperator", fg = c.white, bg = c.none },
        { hg = "LazyReasonKeys", fg = c.teal, bg = c.none },
        { hg = "LazyTaskOutput", fg = c.white, bg = c.none },
        { hg = "LazyCommitIssue", fg = c.pink, bg = c.none },
        { hg = "LazyReasonEvent", fg = c.yellow, bg = c.none },
        { hg = "LazyReasonStart", fg = c.white, bg = c.none },
        { hg = "LazyReasonRuntime", fg = c.nord_blue, bg = c.none },
        { hg = "LazyReasonCmd", fg = c.sun, bg = c.none },
        { hg = "LazyReasonSource", fg = c.cyan, bg = c.none },
        { hg = "LazyReasonImport", fg = c.white, bg = c.none },
        { hg = "LazyProgressDone", fg = c.green, bg = c.none },

        { hg = "Winbar", fg = c.none, bg = c.none },
        { hg = "WinbarNC", fg = c.none, bg = c.none },

        -- Git
        { hg = "diffOldFile", fg = c.baby_pink },
        { hg = "diffNewFile", fg = c.blue },
        { hg = "DiffAdd", fg = c.blue, bg = c.none },
        { hg = "DiffAdded", fg = c.green },
        { hg = "DiffChange", fg = c.light_grey, bg = c.none, cterm = "underline" },
        { hg = "DiffChangeDelete", fg = c.red, bg = c.none },
        { hg = "DiffModified", fg = c.orange, bg = c.none },
        { hg = "DiffDelete", fg = c.red, bg = c.none },
        { hg = "DiffRemoved", fg = c.bright_red, bg = c.none },
        { hg = "DiffText", fg = c.white, bg = c.black2 },
        -- { hg = "diffChanged", fg = c.bright_yellow },
        -- { hg = "diffFile", fg = c.gray05 },
        -- { hg = "diffLine", fg = c.cyan },
        -- { hg = "diffIndexLine", fg = c.magenta },

        -- git commits
        { hg = "gitcommitOverflow", fg = c.base08, bg = c.none },
        { hg = "gitcommitSummary", fg = c.base0B, bg = c.none },
        { hg = "gitcommitComment", fg = c.base03, bg = c.none },
        { hg = "gitcommitUntracked", fg = c.base03, bg = c.none },
        { hg = "gitcommitDiscarded", fg = c.base03, bg = c.none },
        { hg = "gitcommitSelected", fg = c.base03, bg = c.none },
        { hg = "gitcommitHeader", fg = c.base0E, bg = c.none },
        { hg = "gitcommitSelectedType", fg = c.base0D, bg = c.none },
        { hg = "gitcommitUnmergedType", fg = c.base0D, bg = c.none },
        { hg = "gitcommitDiscardedType", fg = c.base0D, bg = c.none },
        { hg = "gitcommitBranch", fg = c.base09, bg = c.none, gui = "bold" },
        { hg = "gitcommitUntrackedFile", fg = c.base0A, bg = c.none },
        { hg = "gitcommitUnmergedFile", fg = c.base08, bg = c.none, gui = "bold" },
        { hg = "gitcommitDiscardedFile", fg = c.base08, bg = c.none, gui = "bold" },
        { hg = "gitcommitSelectedFile", fg = c.base0B, bg = c.none, gui = "bold" },

        -- Neogit
        { hg = "NeogitGraphAuthor", fg = c.orange, bg = c.none },
        { hg = "NeogitGraphRed", fg = c.red, bg = c.none },
        { hg = "NeogitGraphWhite", fg = c.white, bg = c.none },
        { hg = "NeogitGraphYellow", fg = c.yellow, bg = c.none },
        { hg = "NeogitGraphGreen", fg = c.green, bg = c.none },
        { hg = "NeogitGraphCyan", fg = c.cyan, bg = c.none },
        { hg = "NeogitGraphBlue", fg = c.blue, bg = c.none },
        { hg = "NeogitGraphPurple", fg = c.purple, bg = c.none },
        { hg = "NeogitGraphGray", fg = c.grey, bg = c.none },
        { hg = "NeogitGraphOrange", fg = c.orange, bg = c.none },
        { hg = "NeogitGraphBoldOrange", fg = c.orange, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldRed", fg = c.red, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldWhite", fg = c.white, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldYellow", fg = c.yellow, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldGreen", fg = c.green, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldCyan", fg = c.cyan, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldBlue", fg = c.blue, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldPurple", fg = c.purple, bg = c.none, gui = "bold" },
        { hg = "NeogitGraphBoldGray", fg = c.grey, bg = c.none, gui = "bold" },

        { hg = "NeogitHunkMergeHeader", fg = c.black2, bg = c.grey, gui = "bold" },
        { hg = "NeogitHunkMergeHeaderHighlight", fg = c.black, bg = c.cyan, gui = "bold" },
        { hg = "NeogitHunkMergeHeaderCursor", fg = c.black, bg = c.cyan, gui = "bold" },
        { hg = "NeogitHunkHeader", fg = c.black, bg = c.grey, gui = "bold" },
        { hg = "NeogitHunkHeaderHighlight", fg = c.black, bg = c.grey, gui = "bold" },
        { hg = "NeogitHunkHeaderCursor", fg = c.black, bg = c.dark_purple, gui = "bold" },

        { hg = "NeogitDiffContext", fg = c.none, bg = c.one_gb },
        { hg = "NeogitDiffContextHighlight", fg = c.none, bg = c.black2 },
        { hg = "NeogitDiffContextCursor", fg = c.green, bg = c.none },
        { hg = "NeogitDiffAdditions", fg = c.none, bg = c.one_gb },
        { hg = "NeogitDiffAdd", fg = c.green, bg = c.light_green },
        { hg = "NeogitDiffAddHighlight", fg = c.green, bg = c.light_green2 },
        { hg = "NeogitDiffAddCursor", fg = c.green, bg = c.one_gb },
        { hg = "NeogitDiffDeletions", fg = c.red, bg = c.one_gb },
        { hg = "NeogitDiffDelete", fg = c.red, bg = c.light_red },
        { hg = "NeogitDiffDeleteHighlight", fg = c.red, bg = c.light_red2 },
        { hg = "NeogitDiffDeleteCursor", fg = c.red, bg = c.one_gb },

        { hg = "NeogitPopupSwitchKey", fg = c.purple, bg = c.none },
        { hg = "NeogitPopupOptionKey", fg = c.purple, bg = c.none },
        { hg = "NeogitPopupConfigKey", fg = c.purple, bg = c.none },
        { hg = "NeogitPopupActionKey", fg = c.purple, bg = c.none },

        { hg = "NeogitFilePath", fg = c.blue, bg = c.none, gui = "bold" },
        { hg = "NeogitCommitViewHeader", fg = c.black, bg = c.cyan },
        { hg = "NeogitDiffHeader", fg = c.blue, bg = c.one_bg2, gui = "bold" },
        { hg = "NeogitDiffHeaderHighlight", fg = c.orange, bg = c.one_bg2, gui = "bold" },
        { hg = "NeogitBranch", fg = c.blue, bg = c.none, gui = "bold" },
        { hg = "NeogitBranchHead", fg = c.blue, bg = c.none, gui = "bold,underline" },
        { hg = "NeogitRemote", fg = c.green, bg = c.none, gui = "bold" },
        { hg = "NeogitUnmergedInto", fg = c.purple, bg = c.none, gui = "bold" },
        { hg = "NeogitUnpushedTo", fg = c.purple, bg = c.none, gui = "bold" },
        { hg = "NeogitUnpulledFrom", fg = c.purple, bg = c.none, gui = "bold" },

        { hg = "NeogitChangeModified", fg = c.purple, bg = c.none, gui = "bold,italic" },

        { hg = "NeogitChangeAdded", fg = c.green, bg = c.light_green3, gui = "bold,italic" },

        { hg = "NeogitChangeDeleted", fg = c.red, bg = c.none, gui = "bold,italic" },
        { hg = "NeogitChangeRenamed", fg = c.purple, bg = c.none, gui = "bold,italic" },
        { hg = "NeogitChangeUpdated", fg = c.orange, bg = c.none, gui = "bold,italic" },
        { hg = "NeogitChangeCopied", fg = c.cyan, bg = c.none, gui = "bold,italic" },
        { hg = "NeogitChangeUnmerged", fg = c.yellow, bg = c.none, gui = "bold,italic" },
        { hg = "NeogitChangeNewFile", fg = c.green, bg = c.none, gui = "bold,italic" },
        { hg = "NeogitSectionHeader", fg = c.green, bg = c.none, gui = "bold" },

        { hg = "NeogitTagName", fg = c.yellow, bg = c.none },
        { hg = "NeogitTagDistance", fg = c.cyan, bg = c.none },
        { hg = "NeogitFloatHeader", fg = c.none, bg = c.black, gui = "bold" },
        { hg = "NeogitFloatHeaderHighlight", fg = c.cyan, bg = c.black2, gui = "bold" },

        -- Notify
        -- { hg = "NotifyBackground", fg = c.fg, bg = c.bg },
        -- border
        { hg = "NotifyERRORBorder", fg = c.red, bg = c.none },
        { hg = "NotifyWARNBorder", fg = c.orange, bg = c.none },
        { hg = "NotifyINFOBorder", fg = c.green, bg = c.none },
        { hg = "NotifyDEBUGBorder", fg = c.grey, bg = c.none },
        { hg = "NotifyTRACEBorder", fg = c.purple, bg = c.none },
        -- icon
        { hg = "NotifyERRORIcon", fg = c.red, bg = c.none },
        { hg = "NotifyWARNIcon", fg = c.orange, bg = c.none },
        { hg = "NotifyINFOIcon", fg = c.green, bg = c.none },
        { hg = "NotifyDEBUGIcon", fg = c.grey, bg = c.none },
        { hg = "NotifyTRACEIcon", fg = c.purple, bg = c.none },
        -- title
        { hg = "NotifyERRORTitle", fg = c.red, bg = c.none },
        { hg = "NotifyWARNTitle", fg = c.orange, bg = c.none },
        { hg = "NotifyINFOTitle", fg = c.green, bg = c.none },
        { hg = "NotifyDEBUGTitle", fg = c.grey, bg = c.none },
        { hg = "NotifyTRACETitle", fg = c.purple, bg = c.none },
        -- body
        -- { hg = "NotifyERRORBody", fg = c.white, bg = c.bg },
        -- { hg = "NotifyWARNBody", fg = c.white, bg = c.bg },
        -- { hg = "NotifyINFOBody", fg = c.white, bg = c.bg },
        -- { hg = "NotifyDEBUGBody", fg = c.white, bg = c.bg },
        -- { hg = "NotifyTRACEBody", fg = c.white, bg = c.bg },

        -- Trouble
        { hg = "TroubleCount", fg = c.pink, bg = c.none },
        { hg = "TroubleCode", fg = c.white, bg = c.none },
        { hg = "TroubleWarning", fg = c.orange, bg = c.none },
        { hg = "TroubleTextWarning", fg = c.white, bg = c.none },
        { hg = "TroublePreview", fg = c.red, bg = c.none },
        { hg = "TroubleSource", fg = c.cyan, bg = c.none },
        { hg = "TroubleTextHint", fg = c.white, bg = c.none },
        { hg = "TroubleHint", fg = c.orange, bg = c.none },
        { hg = "TroubleSignInformation", fg = c.white, bg = c.none },
        { hg = "TroubleTextInformation", fg = c.white, bg = c.none },
        { hg = "TroubleInformation", fg = c.white, bg = c.none },
        { hg = "TroubleError", fg = c.red, bg = c.none },
        { hg = "TroubleTextError", fg = c.white, bg = c.none },
        { hg = "TroubleText", fg = c.white, bg = c.none },
        { hg = "TroubleFile", fg = c.yellow, bg = c.none },
        { hg = "TroubleFoldIcon", fg = c.none, bg = c.none },
        { hg = "TroubleNormal", fg = c.white, bg = c.none },
        { hg = "TroubleLocation", fg = c.red, bg = c.none },

        -- Lspsaga
        { hg = "SagaBorder", fg = c.none, bg = c.darker_black },
        { hg = "SagaNormal", fg = c.none, bg = c.darker_black },

        -- Mason
        { hg = "MasonHeader", fg = c.black, bg = c.red },
        { hg = "MasonHighlight", fg = c.blue, bg = c.none },
        { hg = "MasonHighlightBlock", fg = c.black, bg = c.green },
        { hg = "MasonMuted", fg = c.light_grey, bg = c.none },
        { hg = "MasonMutedBlock", fg = c.light_grey, bg = c.one_bg },

        -- navic
        { hg = "NavicIconsConstant", fg = c.base09, bg = c.none },
        { hg = "NavicIconsFunction", fg = c.base0D, bg = c.none },
        { hg = "NavicIconsIdentifier", fg = c.base08, bg = c.none },
        { hg = "NavicIconsField", fg = c.base08, bg = c.none },
        { hg = "NavicIconsVariable", fg = c.base0E, bg = c.none },
        { hg = "NavicIconsSnippet", fg = c.red, bg = c.none },
        { hg = "NavicIconsText", fg = c.base0B, bg = c.none },
        { hg = "NavicIconsStructure", fg = c.base0E, bg = c.none },
        { hg = "NavicIconsType", fg = c.base0A, bg = c.none },
        { hg = "NavicIconsKeyword", fg = c.base07, bg = c.none },
        { hg = "NavicIconsMethod", fg = c.base0D, bg = c.none },
        { hg = "NavicIconsConstructor", fg = c.blue, bg = c.none },
        { hg = "NavicIconsFolder", fg = c.base07, bg = c.none },
        { hg = "NavicIconsModule", fg = c.base0A, bg = c.none },
        { hg = "NavicIconsProperty", fg = c.base08, bg = c.none },
        { hg = "NavicIconsEnum", fg = c.blue, bg = c.none },
        { hg = "NavicIconsUnit", fg = c.base0E, bg = c.none },
        { hg = "NavicIconsClass", fg = c.teal, bg = c.none },
        { hg = "NavicIconsFile", fg = c.base07, bg = c.none },
        { hg = "NavicIconsInterface", fg = c.green, bg = c.none },
        { hg = "NavicIconsColor", fg = c.white, bg = c.none },
        { hg = "NavicIconsReference", fg = c.base05, bg = c.none },
        { hg = "NavicIconsEnumMember", fg = c.purple, bg = c.none },
        { hg = "NavicIconsStruct", fg = c.base0E, bg = c.none },
        { hg = "NavicIconsValue", fg = c.cyan, bg = c.none },
        { hg = "NavicIconsEvent", fg = c.yellow, bg = c.none },
        { hg = "NavicIconsOperator", fg = c.base05, bg = c.none },
        { hg = "NavicIconsTypeParameter", fg = c.base08, bg = c.none },
        { hg = "NavicIconsNamespace", fg = c.teal, bg = c.none },
        { hg = "NavicIconsPackage", fg = c.green, bg = c.none },
        { hg = "NavicIconsString", fg = c.green, bg = c.none },
        { hg = "NavicIconsNumber", fg = c.pink, bg = c.none },
        { hg = "NavicIconsBoolean", fg = c.orange, bg = c.none },
        { hg = "NavicIconsArray", fg = c.blue, bg = c.none },
        { hg = "NavicIconsObject", fg = c.base0E, bg = c.none },
        { hg = "NavicIconsKey", fg = c.red, bg = c.none },
        { hg = "NavicIconsNull", fg = c.cyan, bg = c.none },
        { hg = "NavicText", fg = c.light_grey, bg = c.none },
        { hg = "NavicSeparator", fg = c.red, bg = c.none },

        -- Flash
        { hg = "FlashBackdrop", fg = c.grey_fg },
        { hg = "FlashLabel", fg = c.pink, bg = c.grey, gui = "bold" },
        { hg = "FlashMatch", fg = c.white, bg = c.grey, gui = "bold" },

        -- FZF-lua
        { hg = "FzfLuaNormal", fg = c.base05, bg = c.darker_black }, --main fg/bg
        { hg = "FzfLuaBorder", fg = c.base05, bg = c.black }, --main border
        -- { hg = "FzfLuaBorder", fg = c.blue, bg = c.none },
        { hg = "FzfLuaTitle", fg = c.base05, bg = c.grey, gui = "bold" }, -- main title
        -- FzfLuaPreviewNormal = { link = "FzfLuaNormal" }, -- builtin preview fg/bg
        { hg = "FzfLuaPreviewTitle", fg = c.base05, bg = c.grey, gui = "bold" }, -- builtin preview title
        { hg = "FzfLuaPreviewBorder", fg = c.base05, bg = c.black }, -- builtin preview border
        { hg = "FzfLuaCursor", fg = c.base01, bg = c.base09 }, -- builtin preview `Cursor`
        { hg = "FzfLuaCursorLine", fg = c.none, bg = c.black2 }, -- builtin preview `Cursorline`
        { hg = "FzfLuaCursorLineNr", fg = c.white, bg = c.none },  -- builtin preview `CursorLineNr`
        { hg = "FzfLuaSearch", fg = c.base01, bg = c.base09 }, -- builtin preview search matches


        { hg = "FzfLuaPrompt", fg = c.base05, bg = c.none }, -- The Text>... and the current open file
        { hg = "FzfLuaLine", fg = c.base05, bg = c.black },
        { hg = "FzfLuaLinePlus", fg = c.teal, bg = c.one_bg, gui = "bold" }, -- Selection line
        { hg = "FzfLuaItemKindVariable", fg = c.base0A, bg = c.one_bg }, -- Coloured text when you search for a word
        { hg = "FzfLuaPath", fg = c.base0D, bg = c.none },
        { hg = "FzfLuaFzfSeparator", fg = c.orange, bg = c.black },
        { hg = "FzfLuaFzfPointer", fg = c.dark_purple, bg = c.none },
        { hg = "FzfLuaDirPart", fg = c.base00, bg = c.none },
        { hg = "FzfLuaHeaderText", fg = c.base0D, bg = c.none, guisp = c.none },
        { hg = "FzfLuaHeaderBind", fg = c.base0F, bg = c.none },

        -- FzfLuaScrollBorderEmpty = { fg = c.red, gui = bold }, -- builtin preview `border` scroll empty
        -- FzfLuaScrollBorderFull = { fg = c.green, gui = bold }, -- builtin preview `border` scroll full
        -- FzfLuaScrollFloatEmpty = { link = "PmenuSbar" }, -- builtin preview `float` scroll empty
        -- FzfLuaScrollFloatFull = { link = "PmenuThumb" }, -- builtin preview `float` scroll full
        -- FzfLuaHelpNormal = { link = "FzfLuaNormal" }, -- help win `fg/bg`
        -- FzfLuaHelpBorder = { fg = c.salmon, gui = bold }, -- help win border
        -- FzfLuaHeaderBind = { fg = c.beaver }, -- header keybind
        -- FzfLuaHeaderText = { fg = c.slate_grey }, -- header text
        -- FzfLuaBufName = { link = "Title" }, -- buffer name (`lines`)
        -- FzfLuaBufNr = { link = "Type" }, -- buffer number (all buffers)
        -- FzfLuaBufLineNr = { link = "CursorLineNr" }, -- buffer line (`lines`)
        -- FzfLuaBufFlagCur = { link = "Constant" }, -- buffer line (`buffers`)
        -- FzfLuaBufFlagAlt = { link = "Tag" }, -- buffer line (`buffers`)
        -- FzfLuaTabTitle = { link = "Title" }, -- tab title (`tabs`)
        -- FzfLuaTabMarker = { link = "Constant" }, -- tab marker (`tabs`)

        -- HTML
        -- { hg = "@string.special.url", fg = c.gray_blue },
        -- { hg = "htmlArg", fg = c.bright_red, gui = "italic" }, -- attributes
        -- { hg = "htmlEndTag", fg = c.gray06 }, -- end tag />
        -- { hg = "htmlTitle", fg = c.gray07 }, -- title tag text
        -- { hg = "htmlTag", fg = c.gray06 }, -- tag delimiters
        -- { hg = "htmlTagN", fg = c.gray06 },
        -- { hg = "htmlTagName", fg = c.cyan }, -- tag text

        -- -- LSP Semantic Token Groups
        -- { hg = "@lsp.typemod.macro.defaultLibrary", fg = c.cyan },
        -- { hg = "@lsp.typemod.function.defaultLibrary", fg = c.cyan },
        -- { hg = "@lsp.typemod.method.defaultLibrary", fg = c.cyan },
        -- { hg = "@lsp.typemod.enumMember.defaultLibrary", fg = c.white, gui = "bold" },
        --
        -- { hg = "@lsp.type.enumMember", fg = c.white, gui = "bold" },
        -- -- { hg = "@lsp.type.keyword", fg = c.gray_blue },
        -- -- { hg = "@lsp.type.namespace", fg = c.gray_blue },
        -- { hg = "@lsp.type.macro", fg = c.bright_white },
        -- { hg = "@lsp.type.struct", fg = c.gray_blue, gui = "bold" },
        -- { hg = "@lsp.typemod.enum", fg = c.gray_blue, gui = "bold" },
        -- { hg = "@lsp.type.interface", fg = c.gray_blue, gui = "bold" },
        -- { hg = "@lsp.type.parameter", fg = c.fg },

        -- { hg = "NeotestAdapterName", fg = c.magenta },
        -- { hg = "NeotestDir", fg = c.cyan },
        -- { hg = "NeotestExpandMarker", fg = c.gray02 },
        -- { hg = "NeotestFailed", fg = c.bright_red },
        -- { hg = "NeotestFile", fg = c.cyan },
        -- { hg = "NeotestFocused", gui = "bold" },
        -- { hg = "NeotestIndent", fg = c.fg },
        -- { hg = "NeotestNamespace", fg = c.blue },
        -- { hg = "NeotestPassed", fg = c.green },
        -- { hg = "NeotestRunning", fg = c.yellow },
        -- { hg = "NeotestSkipped", fg = c.cyan },

        -- Others
        -- { hg = "yamlFlowIndicator", fg = c.yellow, gui = "bold" },
        -- { hg = "yamlFlowString", fg = c.bright_cyan },
        -- { hg = "yamlBlockMappingKey", fg = c.gray_blue },
        -- { hg = "yamlPlainScalar", fg = c.medium_gray_blue, gui = "bold" },
    }

    utils.highlight(highlights)
end

M.colorscheme = function()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "canon-onedark"

    set_terminal_colors()
    set_groups()
    set_link_groups()
end

return M
