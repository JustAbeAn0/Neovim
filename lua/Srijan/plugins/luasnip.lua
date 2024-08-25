return {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local c = ls.choice_node
  
      ls.add_snippets("c", {
        s("include", {
          t({"#include <stdio.h>", "int main(){", ""}),
          i(1),
          t({"", "return 0;", "}"})
        }),
        s("for", {
          t("for ("),
          c(1, {t("size_t"), t("int")}),
          t(" "),
          i(2, "i"),
          t(" = "),
          i(3, "0"),
          t("; "),
          f(function(args) return args[1][1] end, {2}),
          t(" < "),
          i(4, "length"),
          t("; "),
          f(function(args) return args[1][1] end, {2}),
          t("++)"),
          t({"", "{", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("forr", {
          t("for (int "),
          i(1, "i"),
          t(" = "),
          i(2, "length"),
          t(" - 1; "),
          f(function(args) return args[1][1] end, {1}),
          t(" >= "),
          i(3, "0"),
          t("; "),
          f(function(args) return args[1][1] end, {1}),
          t("--)"),
          t({"", "{", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("while", {
          t("while ("),
          i(1),
          t(")"),
          t({"", "{", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("if", {
          t("if ("),
          i(1),
          t(")"),
          t({"", "{", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("else", {
          t({"else", "{", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("else if", {
          t("else if ("),
          i(1),
          t(")"),
          t({"", "{", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("enum", {
          t("enum "),
          i(1, "MyEnum"),
          t({" {", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("#ifdef", {
          t("#ifdef "),
          i(1, "DEBUG"),
          t({"", ""}),
          i(0),
          t({"", "#endif // "}),
          f(function(args) return args[1][1] end, {1})
        }),
        s("#ifndef", {
          t("#ifndef "),
          i(1, "1"),
          t({"", ""}),
          i(0),
          t({"", "#endif // !"}),
          f(function(args) return args[1][1] end, {1})
        }),
        s("#if", {
          t("#if "),
          i(1, "0"),
          t({"", ""}),
          i(0),
          t({"", "#endif // "}),
          f(function(args) return args[1][1] end, {1})
        }),
        s("struct", {
          t("struct "),
          i(1, "MyStruct"),
          t({" {", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("switch", {
          t("switch ("),
          i(1, "switch_on"),
          t({") {", "default:", "\tbreak;"}),
          i(0),
          t({"", "}"})
        }),
        s("union", {
          t("union "),
          i(1, "MyUnion"),
          t({" {", "\t"}),
          i(0),
          t({"", "}"})
        }),
        s("#inc", {
          t("#include \""),
          i(1),
          t("\"")
        }),
        s("#inc<", {
          t("#include <"),
          i(1),
          t(">")
        }),
        s("#def", {
          t("#define "),
          i(1),
          t(" "),
          i(2)
        }),
        s("printf", {
          t("printf(\""),
          i(1),
          t("\\n\");")
        }),
        s("scanf", {
          t("scanf(\""),
          i(1),
          t("\");")
        }),
      })
    end,
  }