package ; #if !flash


import openfl._internal.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.Assets;


class Ship extends MovieClip {
	
	
	public var mcColor (default, null):openfl.display.MovieClip;
	public var mcShootPoint (default, null):openfl.display.MovieClip;
	
	
	public function new () {
		
		super ();
		
		/*
		if (!SWFLite.instances.exists ("lib/swf-lib/swf-lib.bin")) {
			
			SWFLite.instances.set ("lib/swf-lib/swf-lib.bin", SWFLite.unserialize (Assets.getText ("lib/swf-lib/swf-lib.bin")));
			
		}
		*/
		
		var swfLite = SWFLite.instances.get ("lib/swf-lib/swf-lib.bin");
		var symbol = swfLite.symbols.get (11);
		
		__fromSymbol (swfLite, cast symbol);
		
	}
	
	
}


#else
@:bind @:native("Ship") class Ship extends flash.display.MovieClip {
	
	
	public var mcColor (default, null):openfl.display.MovieClip;
	public var mcShootPoint (default, null):openfl.display.MovieClip;
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end