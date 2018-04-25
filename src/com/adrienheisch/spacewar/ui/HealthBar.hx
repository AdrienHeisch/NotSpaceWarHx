package com.adrienheisch.spacewar.ui;

import flash.errors.Error;
import com.adrienheisch.spacewar.game.Ship;
import flash.display.MovieClip;
import flash.geom.ColorTransform;
import flash.text.TextField;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class HealthBar extends MovieClip
{
    public var index(never, set) : Int;

    public static var list : Array<HealthBar> = new Array<HealthBar>();
    
    public static var a : Int = 0;
    
    private var ship : Ship;
    private var initMaskWidth : Float;
    
    public var mcFill : MovieClip;
    public var mcMask : MovieClip;
    public var txtInfo : TextField;
    
    public function new()
    {
        super();
        
        list.push(this);
        
        initMaskWidth = mcMask.width;
    }
    
    private function set_index(pIndex : Int) : Int
    {
        ship = Ship.list[pIndex];
        var lColorTransform : ColorTransform = new ColorTransform();
        lColorTransform.color = Ship.COLORS[pIndex];
        mcFill.transform.colorTransform = lColorTransform;
        
        refresh();
        return pIndex;
    }
    
    public function refresh() : Void
    {
        if (ship != null)
        {
            mcMask.width = initMaskWidth * ship.health / Ship.MAX_HEALTH;
            txtInfo.text = Ship.infoList[ship.id][0] + " wins, " + Ship.infoList[ship.id][1] + " kills, " + Ship.infoList[ship.id][2] + " damage";
        }
        else
        {
            throw new Error(this + " has no corresponding ship !");
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

