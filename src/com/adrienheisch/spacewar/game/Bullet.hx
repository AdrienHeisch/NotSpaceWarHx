package com.adrienheisch.spacewar.game;

import com.adrienheisch.spacewar.ui.Hud;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.geom.ColorTransform;
import openfl.geom.Point;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Bullet extends Sprite
{
    public var color(never, set) : Int;
    
    public static var list : Array<Bullet> = new Array<Bullet>();
    
    private static inline var DAMAGE : Float = 1;
    
    public static inline var SPEED : Float = 10;
    
    public var parentShip : Ship;
    public var parentShipId : Int;
    public var velocity : Point;
	
	public var sprite:Sprite;
    
    public function new()
    {
        super();
        
        list.push(this);
		
		addChild(sprite = Assets.getMovieClip("swf-lib:Bullet"));
        
        cacheAsBitmap = true;
    }
    
    private function set_color(pColor : Int) : Int
    {
        var lColorTransform : ColorTransform = new ColorTransform();
        lColorTransform.color = pColor;
        transform.colorTransform = lColorTransform;
        return pColor;
    }
    
    public function gameLoop() : Void
    {
        var lShip : Ship;
        var i = Ship.list.length - 1;
        while (i >= 0)
        {
            lShip = Ship.list[i];
            if (lShip != parentShip && lShip.hitTestPoint(x, y))
            {
                lShip.health -= DAMAGE;
                Ship.infoList[parentShipId][2]++;
                if (lShip.health <= 0)
                {
                    lShip.destroy();
                    Ship.infoList[parentShipId][1]++;
                }
                Hud.instance.refreshInfo();
                destroy();
                return;
            }
            i--;
        }
        
        if (x < -width || x > stage.stageWidth + width || y < -height || y > stage.stageHeight + height)
        {
            destroy();
        }
        else
        {
            x += velocity.x;
            y += velocity.y;
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

