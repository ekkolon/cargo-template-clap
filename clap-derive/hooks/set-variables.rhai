// Get the base project name (required)
let project_name = variable::get("project-name");

// --- LIBRARY FALLBACKS ---
let lib_name = if variable::is_set("lib_name") && variable::get("lib_name") != "" {
    variable::get("lib_name")
} else {
    variable::set("lib_name", project_name);
    project_name
};

let lib_crate_name = if variable::is_set("lib_crate_name") && variable::get("lib_crate_name") != "" {
    variable::get("lib_crate_name")
} else {
    variable::set("lib_crate_name", lib_name);
    lib_name
};

let lib_crate_display_name = if variable::is_set("lib_crate_display_name") && variable::get("lib_crate_display_name") != "" {
    variable::get("lib_crate_display_name")
} else {
    variable::set("lib_crate_display_name", lib_name);
    lib_name
};

// --- BINARY FALLBACKS ---
let bin_name = if variable::is_set("bin_name") && variable::get("bin_name") != "" {
    variable::get("bin_name")
} else {
    let separator = if lib_name.contains("-") {
        "-cli"
    } else if lib_name.to_kebab_case() == lib_name {
        "-cli"
    } else {
        "_cli"
    };

    let fallback_bin_name = if lib_name == "" { project_name } else { lib_name + separator };
    variable::set("bin_name", fallback_bin_name);

    // bin_crate_name fallback
    if !variable::is_set("bin_crate_name") || variable::get("bin_crate_name") == "" {
        variable::set("bin_crate_name", fallback_bin_name);
    }

    fallback_bin_name
};

if !variable::is_set("bin_crate_display_name") || variable::get("bin_crate_display_name") == "" {
    variable::set("bin_crate_display_name", bin_name);
}

// --- EXECUTABLE FALLBACK ---
if !variable::is_set("exe_name") || variable::get("exe_name") == "" {
    variable::set("exe_name", lib_name);
}

// --- LICENSE FALLBACKS ---
let year = if variable::is_set("license_year") && variable::get("license_year") != "" {
    variable::get("license_year")
} else {
    let today = system::date();
    let y = today.year.to_string();
    variable::set("license_year", y);
    y
};

let holder = if variable::is_set("license_holder") && variable::get("license_holder") != "" {
    variable::get("license_holder")
} else {
    let a = variable::get("authors");
    variable::set("license_holder", a);
    a
};

// --- PROJECT OBJECT ---
variable::set("crate_command_name", variable::get("exe_name"));
variable::set("crate_name", project_name);
variable::set("crate_display_name", lib_name);
variable::set("crate_binary_name", bin_name);
variable::set("crate_license_year", year);
variable::set("crate_license_holder", holder);
variable::set("crate_description", variable::get("description"));