package ; #if !flash


import openfl._internal.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.Assets;


class Star extends MovieClip {
	
	
	
	
	public function new () {
		
		super ();
		
		/*
		if (!SWFLite.instances.exists ("lib/swf-lib/swf-lib.bin")) {
			
			SWFLite.instances.set ("lib/swf-lib/swf-lib.bin", SWFLite.unserialize (Assets.getText ("lib/swf-lib/swf-lib.bin")));
			
		}
		*/
		
		var swfLite = SWFLite.instances.get ("lib/swf-lib/swf-lib.bin");
		var symbol = swfLite.symbols.get (4);
		
		__fromSymbol (swfLite, cast symbol);
		
	}
	
	
}


#else
@:bind @:native("Star") class Star extends flash.display.MovieClip {
	
	
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end