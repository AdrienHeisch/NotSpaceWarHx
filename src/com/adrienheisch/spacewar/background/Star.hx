package com.adrienheisch.spacewar.background;

import openfl.Assets;
import openfl.display.MovieClip;
import openfl.display.Sprite;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Star extends MovieClip
{
    
    public static var list : Array<Star> = new Array<Star>();
	
	public var sprite:Sprite;
    
    public function new()
    {
        super();
        
        list.push(this);
        
		sprite = Assets.getMovieClip("swf-lib:Star");
		
        cacheAsBitmap = true;
        
        var lScale : Float = Math.random();
        scaleX = lScale;
        scaleY = lScale;
        
        alpha = Math.random() * 0.5 + 0.5;
    }
    
    public function destroy() : Void
    {
        list.splice(Lambda.indexOf(list, this), 1);
        if (parent != null)
        {
            parent.removeChild(this);
        }
    }
}

