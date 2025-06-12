# 🦀 Templates for Rust CLIs with clap

A set of ready-to-use templates for building modern CLI tools in Rust using [`clap`](https://docs.rs/clap/latest/clap).

Designed to work out of the box with [`cargo-generate`](https://github.com/cargo-generate/cargo-generate).

## 📦 Available Templates

- ### [`clap-derive`](./clap-derive/)

    Cargo workspace scaffold using clap `derive` feature.

  #### ✨ Features

  🧠 **Serde Support**: JSON config parsing for easy customization.
  
  📜 **Man Page**: Auto-generated man page for system-wide usage.
  
  💻 **Shell Completions**: Generate completions for Bash, Zsh, Fish.
  
  🧪 **Tested**: Built-in unit and integration tests.
  
  💡 **Helpful Errors**: Rich error messages via [`thiserror`](https://docs.rs/thiserror).
  
  🛠 **CI Ready**: GitHub Actions with test workflows.

## 🚀 Getting Started

Install [cargo-generate](https://github.com/cargo-generate/cargo-generate) if you haven't already:

```bash
cargo install cargo-generate
```

### Generate CLI project

```bash
cargo generate ekkolon/cargo-template-clap clap-derive
```

#### or

```bash
cargo generate --name mytool ekkolon/cargo-template-clap clap-derive
```

## 🔗 Related Links

- 📚 [Clap](https://docs.rs/clap) - Documentation
- 🧑‍💻 [Serde](https://serde.rs) – Serialization Framework
- 🧭 [clig.dev](https://clig.dev/) – Command-Line Interface Guidelines
- 🛠️ [cargo-generate](https://cargo-generate.github.io/cargo-generate/) – Template generator for Rust projects

## 📄 License

This project is dual-licensed under MIT or Apache-2.0, at your choice.

> © 2025 Nelson Dominguez

## 🤝 Contributing

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in this work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.
