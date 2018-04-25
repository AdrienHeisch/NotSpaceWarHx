package com.adrienheisch.spacewar;

import com.adrienheisch.spacewar.background.BackgroundManager;
import com.adrienheisch.spacewar.game.GameManager;
import com.adrienheisch.spacewar.game.Ship;
import com.adrienheisch.spacewar.ui.UIManager;
import com.adrienheisch.utils.KeyboardManager;
import openfl.Assets;
import openfl.display.MovieClip;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Main extends MovieClip
{
    public static var instance(get, never) : Main;

    private static var MANAGERS : Array<Dynamic> = [KeyboardManager, BackgroundManager, GameManager, UIManager];  //the order matters !  
    
    private static var _instance : Main;
    
    private static function get_instance() : Main
    {
        return _instance;
    }
    
    public function new()
    {
        super();
        
        _instance = this;
        
        //initApp();
		Ship.infoList = [];
        for (i in 0...2)
        {
            Ship.infoList.push([0, 0, 0]);
        }
		KeyboardManager.init();
		BackgroundManager.init();
		GameManager.init();
		GameManager.startGame();
    }
    
    public function initApp() : Void
    {
        var i = 0;
        while (i < MANAGERS.length)
        {
            MANAGERS[i].init();
            i++;
        }
    }
    
    public function restartApp() : Void
    {
        var i = 0;
        while (i < MANAGERS.length)
        {
            MANAGERS[i].stop();
            i++;
        }
        
        initApp();
    }
}

