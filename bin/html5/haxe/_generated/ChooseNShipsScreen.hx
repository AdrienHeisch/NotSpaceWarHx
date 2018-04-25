package ; #if !flash


import openfl._internal.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.Assets;


class ChooseNShipsScreen extends MovieClip {
	
	
	public var mcButton2 (default, null):NumberButton;
	public var mcButton3 (default, null):NumberButton;
	public var mcButton4 (default, null):NumberButton;
	
	
	public function new () {
		
		super ();
		
		/*
		if (!SWFLite.instances.exists ("lib/swf-lib/swf-lib.bin")) {
			
			SWFLite.instances.set ("lib/swf-lib/swf-lib.bin", SWFLite.unserialize (Assets.getText ("lib/swf-lib/swf-lib.bin")));
			
		}
		*/
		
		var swfLite = SWFLite.instances.get ("lib/swf-lib/swf-lib.bin");
		var symbol = swfLite.symbols.get (51);
		
		__fromSymbol (swfLite, cast symbol);
		
	}
	
	
}


#else
@:bind @:native("ChooseNShipsScreen") class ChooseNShipsScreen extends flash.display.MovieClip {
	
	
	public var mcButton2 (default, null):NumberButton;
	public var mcButton3 (default, null):NumberButton;
	public var mcButton4 (default, null):NumberButton;
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end