package com.adrienheisch.spacewar.ui.buttons;

import openfl.display.MovieClip;
import openfl.display.SimpleButton;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;

/**
 * ...
 * @author Adrien Heisch
 */
class CustomButton extends Sprite
{
    public static var list : Array<CustomButton> = new Array<CustomButton>();
    
	public var clip:MovieClip;
    public var txtDisplay : TextField;
    public var btnMenu : SimpleButton;
    
    public function new()
    {
        super();
        
        list.push(this);
	}
	
	public function init(): Void
	{
		txtDisplay = cast(clip.getChildByName("txtDisplay"), TextField);
		btnMenu = cast(clip.getChildByName("btnMenu"), SimpleButton);
		
        clip.stop();
        txtDisplay.mouseEnabled = false;
        btnMenu.addEventListener(MouseEvent.CLICK, onClick);
	}
    
    private function onClick(pEvent : Event) : Void
    {
        btnMenu.removeEventListener(MouseEvent.CLICK, onClick);
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

