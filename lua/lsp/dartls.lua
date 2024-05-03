local configs = require 'lspconfig'

local find_dart_sdk_root_path = function()
  if vim.fn["executable"]("dart") == 1 then
    return vim.fn["resolve"](vim.fn["exepath"]("dart"))
  elseif vim.fn["executable"]("flutter") == 1 then
    local flutter_path = vim.fn["resolve"](vim.fn["exepath"]("flutter"))
    local flutter_bin = vim.fn["fnamemodify"](flutter_path, ":h")
    local dart_sdk_root_path = flutter_bin.."/cache/dart-sdk/bin/dart"
    if vim.fn["executable"](dart_sdk_root_path) == 1 then
      return dart_sdk_root_path
    end
  end
  error("[LSP] Could not find Dart SDK root path")
end

local analysis_server_snapshot_path = function()
  local dart_sdk_root_path = vim.fn["fnamemodify"](find_dart_sdk_root_path(), ":h")
  local snapshot = dart_sdk_root_path.."/snapshots/analysis_server.dart.snapshot"

  if vim.fn["has"]("win32") == 1 or vim.fn["has"]("win64") == 1 then
    snapshot = snapshot:gsub("/", "\\")
  end

  if vim.fn["filereadable"](snapshot) == 1 then
    return snapshot
  else
    error("[LSP] Could not find analysis server snapshot")
  end
end

-- dart LSP settings
return {
  cmd = { 'dart', analysis_server_snapshot_path(), '--protocol=lsp' },
  filetypes = { 'dart' },
  root_dir = configs.util.root_pattern 'pubspec.yaml',
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = false,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = true,
    flutterOutline= true,
  },
  docs = {
    vscode = "Dart-Code.dart-code",
    description = [[
https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec

Language server for dart.
]],
    default_config = {
      root_dir = [[root_pattern("pubspec.yaml")]],
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
