package com.adrienheisch.spacewar.ui.buttons;

import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import com.adrienheisch.spacewar.ui.menus.NumberChoiceMenu;
import openfl.Assets;
import openfl.errors.Error;
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
		addChild(clip = Assets.getMovieClip("swf-lib:NumberButton"));
		
        super();
        
        if (name != null)
        {
            index = Std.parseInt(name.substr( -1));
        }
        else
        {
            index = Lambda.indexOf(CustomButton.list, this) + 1;
            throw new Error(this + " should have an instance name (mcButton + int).");
        }
        
        txtDisplay.text = Std.string(index);
    }
    
    override private function onClick(pEvent : Event) : Void
    {
        cast((parent), NumberChoiceMenu).buttonClicked(index);
    }
}

