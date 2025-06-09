local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('python', {
  s('main', {
    t({'if __name__ == "__main__":', '    '}), i(0)
  })
})

ls.add_snippets('cpp', {
  s('main', {
    t({'int main() {', '    '}), i(0), t({'', '}'})
  })
}) 