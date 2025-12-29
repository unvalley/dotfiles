# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managed with [chezmoi](https://chezmoi.io) containing personal development environment configurations for macOS. The repository includes configurations for various development tools, editors, shell environments, and programming language toolchains.

## Common Commands

### Dotfiles Management
- Apply dotfiles changes: `chezmoi apply`
- Edit dotfiles: `chezmoi edit <file>`
- Add new files: `chezmoi add <file>`
- View diff: `chezmoi diff`

### Setup Commands (via justfile)
```bash
just setup-brewfile      # Install all Homebrew packages
just setup-chezmoi       # Initialize and apply dotfiles
just setup-fish          # Set fish as default shell
just setup-rust          # Install Rust via rustup
just setup-nodejs        # Install Node.js via Volta
just setup-git-config    # Configure Git user
just setup-vscode        # Enable key-repeating for Vim plugin
```

### Development Commands

#### Rust
```bash
cargo b     # Build
cargo t     # Test
cargo ta    # Test all
cargo cl    # Run Clippy linter
cargo w     # Watch with explanation
```

#### JavaScript/TypeScript
- Formatter: Biome (configured in VS Code)
- Package manager: Volta for Node.js version management
- Also available: Deno, Bun

#### Git (with fish shell aliases)
```bash
g         # git
ga        # git add
gaa       # git add --all
gc        # git commit
gcm       # czg (conventional commits)
gst       # git status
```

## Code Architecture

### Directory Structure
- `dot_config/` - Configuration files for CLI tools (git, fish, starship, wezterm, zellij)
- `private_Library/` - macOS application support files (VS Code settings, cargo-atcoder)
- `browser_extensions/` - Browser extension configurations
- Fish shell functions in `dot_config/private_fish/functions/`

### Key Configurations
- **Shell**: fish with extensive aliases and custom functions
- **Editors**: VS Code (primary) with Vim mode
- **Terminal**: Wezterm with Zellij multiplexer
- **Version Control**: Git with delta diff tool, conventional commits via cz-git
- **Prompt**: Starship

### Development Tool Integration
- **Rust**: rust-analyzer in VS Code, cargo aliases for common tasks
- **TypeScript/JavaScript**: Biome formatter, ESLint integration
- **Go**: goimports, gopls
- **Python**: ms-python formatter
- All languages have format-on-save enabled in VS Code
