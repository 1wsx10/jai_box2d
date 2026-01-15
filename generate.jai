LIBRARY_TYPE :: Build_Type.STATIC_LIBRARY;

#run build();
build :: ()
{
    set_build_options_dc(.{do_output=false});

    compile_args : [..] string;
    if OS == .WINDOWS
        array_add(*compile_args, "/I", "box2d/include", "/std:c17");
    else if OS == .LINUX
        array_add(*compile_args, "-I", "box2d/include", "-std=c17");

    sources : [..] string;
    array_add(*sources, ..enum_cpp_files("box2d/src"));
    
    array_add(*sources, "inlines.c");
    if !build_cpp("inlines", "inlines.c", type = .OBJ_FILE, extra = compile_args, debug=true)
        return;

    if !build_cpp("box2d", ..sources, type = LIBRARY_TYPE, extra = compile_args, debug=true)
        return;

    if !generate_bindings()
        return;

    delete_directory("generated");
    make_directory_if_it_does_not_exist("generated");

    generated_files :: string.[
        "box2d.lib",
        "box2d.a",
        "box2d.so",
        "box2d.dll",
        "box2d.pdb",
        "inlines.o",
        "inlines.obj",
        "inlines.pdb",
        "windows.jai",
        "linux.jai",
        "macos.jai",
        ];

    print("generated:\n");
    for generated_files
        if file_move(it, join("generated/", it))
            print("\tgenerated/%\n", it);

    copy_file("box2d/LICENSE", "generated/LICENSE");
}

generate_bindings :: () -> bool
{
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        #if OS == .WINDOWS {
            output_filename = "windows.jai";
            array_add(*extra_clang_arguments, "-DWIN32_LEAN_AND_MEAN");
        } else #if OS == .LINUX {
            output_filename = "linux.jai";
        } else #if OS == .MACOS {
            output_filename = "macos.jai";
        }

        array_add(*libraries, .{ filename = "box2d", identifier = "box2d" });
        array_add(*source_files, ..file_list("box2d/include/box2d"));
        array_add(*strip_prefixes, "b2");
    }

    return generate_bindings(opts, output_filename);
}

#scope_file

#import "Basic";
#import "Bindings_Generator";
#import "BuildCpp";
#import "Compiler";
#import "File";
#import "File_Utilities";
#import "String";
