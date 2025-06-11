# 🧪 cargo-template-clap — Production-Ready CLI Templates in Rust 🦀

A curated set of high-quality, modern Rust templates for building CLI tools — ready for **[`cargo-generate`](https://github.com/cargo-generate/cargo-generate)**.

## 📦 Available Templates

**[`clap-derive`](./clap-derive/)**

A complete CLI app scaffold using clap derive feature.

### ✨ Features

- 🧠 **Serde Support**: JSON/YAML config parsing for easy customization.
- 📜 **Man Page**: Auto-generated man page for system-wide usage.
- 💻 **Shell Completions**: Generate completions for Bash, Zsh, Fish.
- 🧪 **Tested**: Built-in unit and integration tests.
- 💡 **Helpful Errors**: Rich error messages via [`thiserror`](https://docs.rs/thiserror).
- 🛠 **CI Ready**: GitHub Actions with build + test workflows.

## 🚀 Getting Started

Install [cargo-generate](https://github.com/cargo-generate/cargo-generate) if you haven't already:

```bash
cargo install cargo-generate
```

### Generate Clap CLI project

```bash
cargo generate --git ekkolon/cargo-template-clap --path clap-derive
```

### Generate Clap CLI project with name

```bash
cargo generate --git ekkolon/cargo-template-clap --path clap-derive --name ripgrep
```

## 📄 License

Licensed under the MIT or Apache-2.0 license, at your option.

## 🔗 Related Links

- [Clap Documentation](https://docs.rs/clap)
- [Serde](https://serde.rs)
- [clig.dev – Command Line Interface Guidelines](https://clig.dev/)
