package com.adrienheisch.spacewar.ui.buttons;

import com.adrienheisch.spacewar.ui.UIManager;
import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import com.adrienheisch.spacewar.ui.menus.Menu;
import openfl.Assets;
import openfl.events.Event;

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
		
		addChild(clip = Assets.getMovieClip("swf-lib:PlayButton"));
    }
    
    override public function onClick(pEvent : Event) : Void
    {
        cast(UIContainer.instance.getChildAt(0), Menu).destroy();
        UIManager.chooseNShips();
    }
}

