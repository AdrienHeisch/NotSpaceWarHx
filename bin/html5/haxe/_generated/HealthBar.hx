package ; #if !flash


import openfl._internal.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.Assets;


class HealthBar extends MovieClip {
	
	
	public var mcMask (default, null):openfl.display.MovieClip;
	public var mcFill (default, null):openfl.display.MovieClip;
	public var txtInfo (default, null):openfl.text.TextField;
	
	
	public function new () {
		
		super ();
		
		/*
		if (!SWFLite.instances.exists ("lib/swf-lib/swf-lib.bin")) {
			
			SWFLite.instances.set ("lib/swf-lib/swf-lib.bin", SWFLite.unserialize (Assets.getText ("lib/swf-lib/swf-lib.bin")));
			
		}
		*/
		
		var swfLite = SWFLite.instances.get ("lib/swf-lib/swf-lib.bin");
		var symbol = swfLite.symbols.get (27);
		
		__fromSymbol (swfLite, cast symbol);
		
	}
	
	
}


#else
@:bind @:native("HealthBar") class HealthBar extends flash.display.MovieClip {
	
	
	public var mcMask (default, null):openfl.display.MovieClip;
	public var mcFill (default, null):openfl.display.MovieClip;
	public var txtInfo (default, null):openfl.text.TextField;
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end