package com.adrienheisch.utils;

import com.adrienheisch.spacewar.Main;
import openfl.display.Stage;
import openfl.events.KeyboardEvent;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class KeyboardManager
{
    
    private static var stage : Stage;
    
    public static var keys : Array<Int> = new Array<Int>();
    
    public static function init() : Void
    {
        stage = Main.instance.stage;
        
        stage.addEventListener(KeyboardEvent.KEY_DOWN, registerKey);
        stage.addEventListener(KeyboardEvent.KEY_UP, unregisterKey);
    }
    
    private static function registerKey(pEvent : KeyboardEvent) : Void
    {
        if (Lambda.indexOf(keys, pEvent.keyCode) < 0)
        {
            keys.push(pEvent.keyCode);
        }
    }
    
    private static function unregisterKey(pEvent : KeyboardEvent) : Void
    {
        keys.splice(Lambda.indexOf(keys, pEvent.keyCode), 1);
    }
    
    public static function stop() : Void
    {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, registerKey);
        stage.removeEventListener(KeyboardEvent.KEY_UP, unregisterKey);
        
        stage = null;
    }

    public function new()
    {
    }
}

