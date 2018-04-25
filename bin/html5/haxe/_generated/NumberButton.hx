package ; #if !flash


import openfl._internal.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.Assets;


class NumberButton extends MovieClip {
	
	
	public var btnMenu (default, null):openfl.display.SimpleButton;
	public var txtDisplay (default, null):openfl.text.TextField;
	
	
	public function new () {
		
		super ();
		
		/*
		if (!SWFLite.instances.exists ("lib/swf-lib/swf-lib.bin")) {
			
			SWFLite.instances.set ("lib/swf-lib/swf-lib.bin", SWFLite.unserialize (Assets.getText ("lib/swf-lib/swf-lib.bin")));
			
		}
		*/
		
		var swfLite = SWFLite.instances.get ("lib/swf-lib/swf-lib.bin");
		var symbol = swfLite.symbols.get (49);
		
		__fromSymbol (swfLite, cast symbol);
		
	}
	
	
}


#else
@:bind @:native("NumberButton") class NumberButton extends flash.display.MovieClip {
	
	
	public var btnMenu (default, null):openfl.display.SimpleButton;
	public var txtDisplay (default, null):openfl.text.TextField;
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end