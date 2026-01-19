
#import "Basic";

#if OS == .WINDOWS {
	#load "generated/windows.jai";
} else #if OS == .LINUX {
	#load "generated/linux.jai";
} else #if OS == .MACOS {
	#load "generated/macos.jai";
}

util :: #import,file "util.jai";
