package com.adrienheisch.spacewar.ui.menus;

import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Menu extends MovieClip
{
	
	public var sprite:Sprite;
	
    public function new()
    {
        super();
		
		x = 0;
		y = 0;
		
		graphics.beginFill(0xFF0000);
		graphics.drawRect(0, 0, width, height);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
    }
	
	function init(pEvent:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		width = Main.instance.stage.stageWidth;
		height = Main.instance.stage.stageHeight;
	}
    
    public function destroy() : Void
    {
        var i = CustomButton.list.length - 1;
        while (i >= 0)
        {
            CustomButton.list[i].destroy();
            i--;
        }
        if (parent != null)
        {
            parent.removeChild(this);
        }
    }
}

