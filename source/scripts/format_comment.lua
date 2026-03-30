-- format string via lua


local M = {}


function M.yu_format_comment(name, text, color)
    local formatted_text = string.format("\\textcolor{%s}{[\\textbf{%s}: %s]}", color, name, text)
    tex.print(formatted_text)
end


return M

