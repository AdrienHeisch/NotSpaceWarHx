package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Dynamic):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		
		#end
		
		var data, manifest, library;
		
		#if kha
		
		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);
		
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");
		
		#else
		
		data = '{"name":"swf-lib","assets":"aoy4:pathy22:lib%2Fswf-lib%2F56.pngy4:sizei240y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y27:lib%2Fswf-lib%2Fswf-lib.binR2i150440R3y4:TEXTR5R7R6tgh","rootPath":null,"version":2,"libraryArgs":["lib/swf-lib/swf-lib.bin"],"libraryType":"openfl._internal.swf.SWFLiteLibrary"}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("swf-lib", library);
		data = '{"name":null,"assets":"ah","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("swf-lib");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("swf-lib");
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
		#end
		
	}
	
	
}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__lib_swf_lib_56_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__lib_swf_lib_swf_lib_bin extends null { }
@:keep @:bind #if display private #end class __ASSET__lib_swf_lib_json extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("D:/Dev/Haxe/NotSpaceWar/bin/html5/obj/libraries/swf-lib/56.png") #if display private #end class __ASSET__lib_swf_lib_56_png extends lime.graphics.Image {}
@:keep @:file("D:/Dev/Haxe/NotSpaceWar/bin/html5/obj/libraries/swf-lib/swf-lib.bin") #if display private #end class __ASSET__lib_swf_lib_swf_lib_bin extends haxe.io.Bytes {}
@:keep @:file("") #if display private #end class __ASSET__lib_swf_lib_json extends haxe.io.Bytes {}
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end