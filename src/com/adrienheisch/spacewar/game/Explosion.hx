package com.adrienheisch.spacewar.game;

import openfl.Assets;
import openfl.display.DisplayObjectContainer;
import openfl.display.MovieClip;
import openfl.display.Sprite;

/**
 * ...
 * @author Adrien Heisch
 */
class Explosion extends Sprite
{
    
    public static var list : Array<Explosion> = new Array<Explosion>();
	public static var safeAnimationEndFrame:Int = 10;
	
	public var clip:MovieClip;
    
    public function new()
    {
        super();
        
        list.push(this);
		
		addChild(clip = Assets.getMovieClip("swf-lib:Explosion"));
    }
    
    public function gameLoop() : Void
    {
        if (clip.totalFrames == clip.currentFrame)// <= safeAnimationEndFrame)
        {
            destroy();
        }
    }
    
    public function destroy() : Void
    {
        list.splice(list.indexOf(this), 1);
        if (parent != null)
        {
            parent.removeChild(this);
        }
    }
}

