# Yu Lua TeX Utils

这是一个个人定制的 LaTeX 工具宏包集合，旨在通过 LuaTeX 引擎实现学术论文写作中的**自动化补丁修复**、**环境预设**与**高效宏定义**。

本仓库的主要目的是方便在 **Overleaf** 上进行学术协作时快速同步个人配置，并确保项目结构符合 **TDS (TeX Directory Structure)** 规范。


## 🚀 核心特性

* **智能补丁**: 针对常见学术论文模板(如附件、参考文献等)的兼容性修复。
* **模块化预装**: 预设了算法、表格、绘图等常用工具包，避免每个项目重复配置。
* **Lua 驱动**: 利用 Lua 处理复杂的文本、数值逻辑，增强 LaTeX 处理能力。
* **yu 前缀宏**: 提供了一系列以 `yu` 为命名的语义化宏，提升写作效率且降低冲突。


## 📂 项目结构

为了适配 Overleaf 的文件引用机制，本项目在发布态采用**扁平化设计**（即主宏包与逻辑脚本均位于根目录）。但在源码阶段，通过构建脚本保持高度模块化。

```bash
.
├── src/                   # 源码目录 (分模块开发)
│   ├── macros/            # 自定义宏定义 (\yu... 系列)
│   ├── patches/           # 针对特定模板的兼容性补丁
│   ├── packages/          # 常用宏包的预导入与配置
│   └── scripts/           # 辅助 Lua 脚本逻辑
├── testfiles/             # 回归测试用例
├── examples/              # 功能演示示例 (.tex)
├── build.lua              # l3build 构建配置
├── yu-setup.sty           # 扁平化主宏包 (同步至 Overleaf)
└── yu_logic.lua           # 扁平化 Lua 模块 (同步至 Overleaf)
```


## 🚀 Overleaf 协作使用指南

为了在 Overleaf 中最方便地使用，建议保持根目录的 `yu-setup.sty` 和 `yu_logic.lua` 为最新版本。

### 1. 导入项目

将根目录下的以下两个文件上传至 Overleaf 项目的**根目录**:

- `yu-setup.sty`
- `yu_logic.lua`

### 2. 项目设置

由于本包依赖 Lua 脚本处理逻辑，建议在 Overleaf 的项目设置中将 **Compiler** 切换为 **LuaLaTeX**，可发挥这个包的最大能力。

### 3. 代码调用

在 `main.tex` 的导言区添加:

```latex
%%%%%%%%%%
% ----- Yu's setup start -----
\usepackage{yu-setup}
% ----- Yu's setup end -----
%%%%%%%%%%
```


## 💡 功能模块备忘

你可以直接在根目录的 `yu-setup.sty` 中查看逻辑，或者访问本 GitHub 仓库查看完整的 `src/` 拆分源码。

| 模块 | 功能描述 | 源码路径            |
| :--- | :--- |:----------------|
| **Patch** | 修复特定期刊模板中 `appendix` 或引用跳转的 Bug | `src/patches/`  |
| **Packages** | 预装常用宏包并统一配置默认参数 | `src/packages/` |
| **Macros** | 个人常用宏，统一以 `\yu` 开头以防冲突 | `src/macros/`   |
| **Logic** | 复杂的字符串处理或数学运算逻辑 | `src/scripts/`  |


## 🏗️ 本地开发与构建

使用 `l3build` 进行管理。

- **编译测试**:
```bash
l3build check
```
- **生成本地安装包 (TDS)**:
```bash
l3build install
```
- **清理构建缓存**:
```bash
l3build clean
```


## 🔧 常见维护操作

- **新增补丁**: 若遇到新的模板兼容性问题，在 `src/patches/` 下创建新文件，并在主文件中按需配置。
- **Lua 逻辑同步**: 修改 `src/scripts/` 后，需同步更新根目录的 `yu_logic.lua`。对于复杂的逻辑，务必在 `testfiles/` 中增加对应的测试用例以防迭代时出错。
- **构建提醒**: 在分发给他人协作项目前，务必运行构建流程确保 `src/` 中的改动已完全合并至根目录的 `.sty` 文件中，避免协作方因缺少组件导致编译失败。
- **版本管理**: 保持根目录产物与最新源码的一致性，确保 Overleaf 端能直接使用。

