; These custom queries/captures will be added to the default ones which are
; defined in nvim-treesitter-textobjects plugin.

(function_definition
  declarator: (function_declarator
    declarator: (identifier) @function.name))
