local M = {}

local prettier = require("efm/prettier")
local eslint = require("efm/eslint")
-- local rubocop = require("efm/rubocop")
local standardrb = require("efm/standardrb")

M.languages = {
  css = {prettier},
  graphql = { prettier },
  html = {prettier},
  javascript = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  json = {prettier},
  less = { prettier },
  markdown = {prettier},
  ruby = { standardrb },
  sass = { prettier },
  scss = {prettier},
  typescript = {prettier, eslint},
  typescriptreact = {eslint, prettier},
  vue = { prettier },
  yaml = {prettier},
}

return M
