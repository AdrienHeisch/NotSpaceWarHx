package com.adrienheisch.spacewar.game;

import openfl.Assets;
import openfl.display.MovieClip;
import openfl.display.Sprite;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Explosion extends Sprite
{
    
    public static var list : Array<Explosion> = new Array<Explosion>();
	
	public var clip:MovieClip;
    
    public function new()
    {
        super();
        
        list.push(this);
		
		addChild(clip = Assets.getMovieClip("swf-lib:Explosion"));
    }
    
    public function gameLoop() : Void
    {
        if (clip.currentFrame == clip.totalFrames)
        {
            destroy();
        }
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

