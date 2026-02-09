
#import "Basic";

#if OS == .WINDOWS {
	#load "generated/windows.jai";
} else #if OS == .LINUX {
	#load "generated/linux.jai";

	#run {
		#import "Compiler";

		// TODO: module param for static/dynamic library?

		// if box2d is a static library, on linux that means
		// it's not bundled with libm (the standard c math library).
		// so we need to link it in our final program.
		set_build_options_dc(.{ append_linker_arguments = .[ "-lm" ] });
	}

} else #if OS == .MACOS {
	#load "generated/macos.jai";
}

util :: struct {
	// workaround because #load doesn't work within a struct scope.
	#insert #run read_file("util.jai");
}

#scope_file

read_file :: (filename: string, loc := #caller_location) -> string
{
	#import "File";
	#import "File_Utilities";
	path := parse_path(loc.fully_pathed_filename);
	path.words[path.words.count-1] = filename;
	return read_entire_file(path_to_string(path));
}
