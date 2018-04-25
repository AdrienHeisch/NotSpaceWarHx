package com.adrienheisch.spacewar.ui.buttons;

import com.adrienheisch.spacewar.ui.UIManager;
import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import com.adrienheisch.spacewar.ui.menus.Menu;
import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class PlayButton extends CustomButton
{
    public var index : Int;
    public function new()
    {
        super();
    }
    
    override private function onClick(pEvent : Event) : Void
    {
        cast((parent), Menu).destroy();
        UIManager.chooseNShips();
    }
}

