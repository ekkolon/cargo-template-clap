let project_name = variable::get("project-name");

// 📦 Binary (CLI) name
if !variable::is_set("cli_name") {
    let cli_default = project_name + "-cli";
    let cli_name = variable::prompt("Binary crate name (for CLI)", cli_default);
    variable::set("cli_name", cli_name);
    variable::set("binary_name", cli_name);
}

// 📚 Library name
if !variable::is_set("library_name") {
    let library_default = project_name;
    let library_name = variable::prompt("Library crate name", library_default);
    variable::set("library_name", library_name);
}

// 🔧 Executable command (invoked from CLI)
if !variable::is_set("command") {
    let command = variable::prompt("CLI command name", project_name);
    variable::set("command", command);
}

// 🖹 Display name for the CLI app (UI, docs)
if !variable::is_set("display_name") {
    let display_name = variable::prompt("Display name of your app", project_name);
    variable::set("display_name", display_name);
}

// 📅 License year (e.g. 2025)
if !variable::is_set("license_year") {
    let year = system::date().year.to_string();
    let license_year = variable::prompt("License year", year);
    variable::set("license_year", license_year);
}

// 👤 License holder (extracted from authors)
if !variable::is_set("license_holder") {
    let username = variable::get("username");
    let license_holder = variable::prompt("License holder", username);
    variable::set("license_holder", license_holder);
}