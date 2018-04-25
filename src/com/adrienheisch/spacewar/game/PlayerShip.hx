package com.adrienheisch.spacewar.game;

import com.adrienheisch.utils.KeyboardManager;
import openfl.ui.Keyboard;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class PlayerShip extends Ship
{
    private static var CONTROLS : Array<Array<Int>> = [
                [Keyboard.Q, Keyboard.D, Keyboard.Z, Keyboard.S, Keyboard.T, Keyboard.Y], 
                [Keyboard.LEFT, Keyboard.RIGHT, Keyboard.UP, Keyboard.DOWN, Keyboard.NUMPAD_2, Keyboard.NUMPAD_3]
        ];
    
    private var controls : Array<Int> = new Array<Int>();
    
    public function new()
    {
        super();
        
        controls = CONTROLS[Lambda.indexOf(Ship.list, this)];
    }
    
    override public function gameLoop() : Void
    {
        var i : Int = controls.length - 1;
        while (i >= 0)
        {
            input[i] = (KeyboardManager.keys.indexOf(controls[i]) >= 0) ? true : false;
            i--;
        }
        
        super.gameLoop();
    }
}

