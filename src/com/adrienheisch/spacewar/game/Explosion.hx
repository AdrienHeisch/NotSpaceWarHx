package com.adrienheisch.spacewar.game;

import flash.display.MovieClip;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Explosion extends MovieClip
{
    
    public static var list : Array<Explosion> = new Array<Explosion>();
    
    public function new()
    {
        super();
        
        list.push(this);
    }
    
    public function gameLoop() : Void
    {
        if (currentFrame == totalFrames)
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

