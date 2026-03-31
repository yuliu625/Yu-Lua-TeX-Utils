# Yu Lua TeX Utils
A collection of personalized LaTeX utility packages designed to provide **automated patching**, **environment presets**, and **efficient macro definitions** for academic writing, powered by the LuaTeX engine.

This repository is primarily intended to facilitate the rapid synchronization of personal configurations during **Overleaf** academic collaborations, ensuring project structures comply with **TDS (TeX Directory Structure)** standards.


## 🚀 Key Features
- **Intelligent Patching**: Compatibility fixes for common academic paper templates (e.g., appendices, bibliography issues).
- **Modular Pre-loading**: Preset configurations for frequently used packages like algorithms, tables, and plotting to avoid redundant setup in every project.
- **Lua-Powered**: Leverages Lua to handle complex text processing and numerical logic, extending LaTeX's core capabilities.
- **`yu` Prefix Macros**: Provides a suite of semantic macros prefixed with `yu` to improve writing efficiency and minimize command conflicts.


## 📂 Project Structure
To adapt to Overleaf's file referencing mechanism, this project uses a **flat design** for distribution (where the main package and logic scripts are located in the root). However, the source code remains highly modularized via build scripts.

```bash
.
├── source/                # Source code (Modular development)
│   ├── macros/            # Custom macro definitions (\yu... series)
│   ├── patches/           # Compatibility patches for specific templates
│   ├── packages/          # Pre-loading and configuration of common packages
│   └── scripts/           # Helper Lua script logic
├── testfiles/             # Regression test cases
├── examples/              # Feature demonstrations (.tex)
├── build.lua              # l3build configuration
├── yu-configs.sty         # Flattened main package (Sync to Overleaf)
└── yu_logic.lua           # Flattened Lua module (Sync to Overleaf)
```


## 🚀 Overleaf Collaboration Guide
For the best experience on Overleaf, ensure that `yu-configs.sty` and `yu_logic.lua` in the root directory are kept up to date.

### 1. Import Files
Upload the following two files from the root directory to your Overleaf project's **root folder**:
- `yu-configs.sty`
- `yu_logic.lua`

### 2. Project Settings
Since this package relies on Lua script logic, it is recommended to switch the **Compiler** to **LuaLaTeX** in Overleaf's project settings to fully utilize its features.

### 3. Usage
Add the following line to the preamble of your `main.tex`:
```latex
\usepackage{yu-configs}
```


## 💡 Functional Modules Reference
You can inspect the logic directly in `yu-configs.sty` at the root, or browse the full modular source code in the `source/` directory.

| Module | Description | Source Path |
| :--- | :--- | :--- |
| **Patch** | Fixes bugs related to `appendix` or hyperref in specific journal templates | `source/patches/` |
| **Packages** | Pre-loads common packages with unified default configurations | `source/packages/` |
| **Macros** | Personal utility macros, prefixed with `\yu` to prevent conflicts | `source/macros/` |
| **Logic** | Complex string manipulation or mathematical logic | `source/scripts/` |


## 🏗️ Local Development & Building
This project is managed using `l3build`.

- **Run Tests**:
```bash
l3build check
```
- **Generate Local Installation (TDS)**:
```bash
l3build install
```
- **Clean Build Cache**:
```bash
l3build clean
```


## 🔧 Maintenance Tips
- **Adding Patches**: If you encounter a new template compatibility issue, create a new file under `source/patches/` and configure it in the main file.
- **Lua Logic Syncing**: After modifying `source/scripts/`, ensure that the root `yu_logic.lua` is updated. For complex logic, always add corresponding test cases in `testfiles/` to prevent regressions.
- **Build Reminder**: Before sharing with collaborators, run the build process to ensure all changes in `source/` are merged into the root `.sty` file. This prevents compilation failures on the collaborator's end due to missing components.
- **Version Control**: Keep the root distribution files consistent with the latest source code to ensure seamless use on Overleaf.

