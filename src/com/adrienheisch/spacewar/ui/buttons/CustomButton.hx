package com.adrienheisch.spacewar.ui.buttons;

import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class CustomButton extends MovieClip
{
    public static var list : Array<CustomButton> = new Array<CustomButton>();
    
    public var txtDisplay : TextField;
    public var btnMenu : SimpleButton;
    
    public function new()
    {
        super();
        
        list.push(this);
        
        stop();
        
        txtDisplay.mouseEnabled = false;
        
        btnMenu.addEventListener(MouseEvent.CLICK, onClick);
    }
    
    private function onClick(pEvent : Event) : Void
    {
        btnMenu.removeEventListener(MouseEvent.CLICK, onClick);
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

