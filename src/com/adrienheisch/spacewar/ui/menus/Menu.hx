package com.adrienheisch.spacewar.ui.menus;

import com.adrienheisch.spacewar.ui.buttons.CustomButton;
import flash.display.MovieClip;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Menu extends MovieClip
{
    
    public function new()
    {
        super();
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

