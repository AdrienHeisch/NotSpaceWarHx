package com.adrienheisch.spacewar.ui.buttons;

import com.adrienheisch.spacewar.ui.UIManager;
import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import com.adrienheisch.spacewar.ui.menus.Menu;
import openfl.Assets;
import openfl.display.MovieClip;
import openfl.display.SimpleButton;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class PlayButton extends CustomButton
{
    public var index : Int;
    public function new()
    {
		addChild(clip = Assets.getMovieClip("swf-lib:PlayButton"));
		
        super();
    }
    
    override private function onClick(pEvent : Event) : Void
    {
        cast((parent), Menu).destroy();
        UIManager.chooseNShips();
    }
}

