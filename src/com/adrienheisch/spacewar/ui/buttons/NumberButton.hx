package com.adrienheisch.spacewar.ui.buttons;

import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import com.adrienheisch.spacewar.ui.menus.NumberChoiceMenu;
import openfl.Assets;
import openfl.events.Event;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class NumberButton extends CustomButton
{
    public var index : Int;
    
    public function new()
    {
        super();
		
		addChild(clip = Assets.getMovieClip("swf-lib:NumberButton"));
    }
	
	override public function init():Void 
	{
		super.init();
        
        if (clip.name != null)
        {
            index = Std.parseInt(clip.name.substr( -1));
        }
        else
        {
            index = Lambda.indexOf(CustomButton.list, this) + 1;
            trace(this + " should have an instance name (mcButton + int).");
        }
        
        txtDisplay.text = Std.string(index);
	}
    
    override private function onClick(pEvent : Event) : Void
    {
        cast(UIContainer.instance.getChildAt(0), NumberChoiceMenu).buttonClicked(index);
    }
}

