-- 定义`\FAQ`
--
-- ## 用法
--
-- ```latex
-- \usepackage{lt3luabridge}
-- ```
--
-- ```latex
-- \ExplSyntaxOn
-- \luabridge_now:n { require("faq").setup("path/to/faq.tex") }
-- \ExplSyntaxOff
--
-- \FAQ{word-font}  % https://bithesis.bitnp.net/faq/word-font.html
-- \FAQ{bib-sort}[sortkey]  % https://bithesis.bitnp.net/faq/bib-sort.html#sortkey
-- ```
--

local FAQ = {}

-- 所有`items`都是`id`、`title`的列表
-- `id`是`[-0-9a-z]+`，`title`可以含 LaTeX。

function FAQ.parse_faq(file_path)
    local file = io.open(file_path, "r")
    local content = file:read("*a")
    file:close()

    local items = {}

    for item in content:gmatch("\\item [^\r\n]+") do
        local id, title = item:match([[\href{https://bithesis%.bitnp%.net/faq/(.-)%.html}{(.-)}$]])
        table.insert(items, {id = id, title = title})
    end

    return items
end

function FAQ.declare_const(items)
    print([[\prop_const_from_keyval:Nn \c_faq_data_prop {]])
    for _, it in ipairs(items) do
        -- requires the hyperref package
        href = "疑难杂症：" .. it.title:gsub("？", "")
        print("  " .. it.id .. " = { " .. href .. " },")
    end
    print("}")
end

function FAQ.define_hook()
    print(
        [[
\msg_new:nnn { faq } { not-found } {
  FAQ~#1~not~found.\\
  Please~check~https://bithesis.bitnp.net/faq/#1.html.
}
\NewDocumentCommand \FAQ { m o } {
  \prop_get:NnNTF \c_faq_data_prop {#1} \l_tmpa_tl {
    \href {
      https://bithesis.bitnp.net/faq/ #1 .html
      \IfNoValueTF {#2} { } { \# #2 }
    } { \l_tmpa_tl }
  } {
    \msg_error:nnn { faq } { not-found } { #1 }
  }
}
        ]]
    )
end

function FAQ.setup(file_path)
    local items = FAQ.parse_faq(file_path)
    FAQ.declare_const(items)
    FAQ.define_hook()
end

return FAQ
