// Resolve the project name (required field set by cargo-generate)
let project_name = variable::get("project-name");

// ---- LIBRARY FALLBACKS ----
if !variable::is_set("lib_name") || variable::get("lib_name") == "" {
    variable::set("lib_name", project_name);
}

if !variable::is_set("lib_crate_name") || variable::get("lib_crate_name") == "" {
    variable::set("lib_crate_name", variable::get("lib_name"));
}

if !variable::is_set("lib_crate_display_name") || variable::get("lib_crate_display_name") == "" {
    variable::set("lib_crate_display_name", variable::get("lib_name"));
}

// ---- BINARY FALLBACKS ----
if !variable::is_set("bin_name") || variable::get("bin_name") == "" {
    let lib_name = variable::get("lib_name");
    let project_name = variable::get("project-name");

    if lib_name == "" {
        variable::set("bin_name", project_name);

        if !variable::is_set("bin_crate_name") || variable::get("bin_crate_name") == "" {
            variable::set("bin_crate_name", project_name + "-cli");
        }

    } else {
        let separator = if lib_name.contains("-") {
            "-cli"
        } else if lib_name.to_kebab_case() == project_name {
            "-cli"
        } else if lib_name.to_snake_case() == project_name {
            "_cli"
        } else {
            "-cli"
        };

        let new_bin_name = lib_name + separator;
        variable::set("bin_name", new_bin_name);

        if !variable::is_set("bin_crate_name") || variable::get("bin_crate_name") == "" {
            variable::set("bin_crate_name", lib_name + separator);
        }
    }
}




if !variable::is_set("bin_crate_display_name") || variable::get("bin_crate_display_name") == "" {
    // FIXED: added parentheses for variable::get call (missing in your code)
    variable::set("bin_crate_display_name", variable::get("bin_name"));
}

if !variable::is_set("exe_name") || variable::get("exe_name") == "" {
    variable::set("exe_name", variable::get("lib_name"));
}

// ---- LICENSE FALLBACKS ----
if !variable::is_set("license_year") || variable::get("license_year") == "" {
    let today = system::date();
    variable::set("license_year", today.year.to_string());
}

if !variable::is_set("license_holder") || variable::get("license_holder") == "" {
    let authors = variable::get("authors");
    variable::set("license_holder", authors);
}
