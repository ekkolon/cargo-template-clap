use cargo_generate::{GenerateArgs, TemplatePath, generate};
use std::env;
use std::fs;
use std::path::Path;
use std::time::{SystemTime, UNIX_EPOCH};

#[test]
fn should_generate_clap_derive_template() {
    // Create a temp dir manually using system time to avoid conflicts
    let base_tmp = env::temp_dir();
    let unique_name = format!(
        "cargo_generate_test_{}",
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis()
    );
    let out_dir = base_tmp.join(unique_name);
    fs::create_dir(&out_dir).expect("failed to create temp output directory");

    // Locate the template path (e.g., <CRATE_ROOT>/templates/clap-derive)
    let template_dir = Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("templates")
        .join("clap-derive");

    // Name of the generated project
    let project_name = "example_project";

    let args = GenerateArgs {
        allow_commands: true,
        template_path: TemplatePath {
            path: Some(template_dir.to_string_lossy().to_string()),
            // 'subfolder' is only used if 'template_dir' was a parent directory
            // of the actual template, and 'clap-derive' was a subfolder *within* it.
            // 'clap-derive' is the template root here
            ..Default::default()
        },
        name: Some(project_name.into()),
        destination: Some(out_dir.clone()),
        ..Default::default()
    };

    // Run the generator
    generate(args).expect("template generation failed");

    // Verify output
    let generated_path = out_dir.join(project_name);
    assert!(
        generated_path.exists(),
        "Generated project directory was not created"
    );

    let expected_lib_path = generated_path.join(project_name).join("src").join("lib.rs");
    let expected_bin_path = generated_path
        .join(format!("{}-cli", project_name))
        .join("src")
        .join("main.rs");

    let found_main_or_lib = expected_lib_path.exists() || expected_bin_path.exists();

    assert!(
        found_main_or_lib,
        "Neither expected lib.rs at {:?} nor main.rs at {:?} found in generated project",
        expected_lib_path, expected_bin_path
    );

    fs::remove_dir_all(&out_dir).expect("failed to clean up test directory");
}
