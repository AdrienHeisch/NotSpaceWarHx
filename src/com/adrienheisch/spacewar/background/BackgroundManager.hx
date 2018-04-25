package com.adrienheisch.spacewar.background;

import com.adrienheisch.spacewar.Main;
import openfl.display.Stage;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class BackgroundManager
{
    
    private static var stage : Stage;
    
    public static function init() : Void
    {
        stage = Main.instance.stage;
        
        stage.addChild(BackgroundContainer.instance);
        
        drawBackground();
    }
    
    private static function drawBackground() : Void
    {
        var lStar : Star;
        var i = 99;
        while (i >= 0)
        {
            BackgroundContainer.instance.addChild(lStar = new Star());
            lStar.x = stage.stageWidth * Math.random();
            lStar.y = stage.stageHeight * Math.random();
            i--;
        }
    }
    
    public static function stop() : Void
    {
        BackgroundContainer.instance.destroy();
        stage = null;
    }

    public function new()
    {
    }
}

