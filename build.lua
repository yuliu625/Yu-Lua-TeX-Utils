-- build.lua
-- l3build automation configuration file

-- =====
-- Project Metadata
-- =====
module = 'yu-setup'
ctanpkg = 'yu-setup'
license = 'lppl1.3c'
version = 'v0.0.1'
date = '2026/03/01'
author = 'Yu'


-- =====
-- Directory Structure
-- =====
sourcefiledir = "."
docfiledir = "docfiles"
testfiledir = "testfiles"
builddir = "build"


-- =====
-- File Rules
-- =====
-- Core source files and unpacking drivers
sourcefiles = {
    "*.dtx",
    "*.ins",
}
unpackfiles = {
    "*.ins",
}
-- Documentation files to be installed into the TDS structure
-- -- TDS: tex/latex/
installfiles = {
    "yu-setup.sty",
    "yu_utils.lua",
}
-- Documentation files to be installed into the TDS structure
-- -- doc/latex/
docfiles = {
    "*.tex",
    "README.md",
    "README.zh-CN.md",
}
-- Main master document used to typeset the user manual
typesetfiles = {
    "yu-setup-doc.tex",
}
-- Files treated as text during packaging and line-ending conversions
textfiles = {
    "README.md",
    "README.zh-CN.md",
}
-- Files treated as binary assets
-- -- Preserved without encoding/EOL modifications
binaryfiles = {
    "*.pdf",
    "*.png",
}
-- Patterns for files to exclude from build and release archives
excludefiles = {
  "*~",
  "*.tmp",
  "*.log",
  ".git*",
}


-- =====
-- Engines & Typesetting
-- =====
-- Default engine for unpacking and standard operations
stdengine = 'pdftex'
-- Target TeX engines used for automated regression testing
checkengines = {
  'pdftex',
  'xetex',
  'luatex',
}
-- Engine configuration for typesetting documentation
typesetengines = {
    'luatex',
}
typesetexe = 'lualatex'


-- =====
-- Hooks
-- =====

