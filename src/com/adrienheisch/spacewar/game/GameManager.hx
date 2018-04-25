package com.adrienheisch.spacewar.game;

import com.adrienheisch.spacewar.Main;
import com.adrienheisch.spacewar.ui.UIManager;
import openfl.display.Stage;
import openfl.events.Event;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class GameManager
{
    public static var nShips : Int = 2;  // 2 - 4 ships  
    public static var nPlayers : Int = 1;  // 1 - 2 players 
    
    public static var aiMovePrediction : Bool = true;
    public static var aiShootPrediction : Bool = true;
    
    public static var shipMoveBackAllowed : Bool = false;
    public static var shipAutoSlow : Bool = true;
    
    private static var GAMELOOP_CLASSES : Array<Class<Dynamic>> = [Ship, Bullet, Explosion];
    
    private static inline var SHIPS_PER_LINE : Int = 2;
    
    private static var stage : Stage;
    
    public static function init() : Void
    {
        stage = Main.instance.stage;
        
        stage.addChild(GameContainer.instance);
    }
    
    public static function startGame() : Void
    {
        stage.focus = stage;
        
        var lShip : Ship;
        var i = 0;
        while (i < nShips - nShips % SHIPS_PER_LINE)
        {
            GameContainer.instance.addChild(lShip = ((nPlayers > i)) ? new PlayerShip() : new AIShip());
            lShip.x = (SHIPS_PER_LINE * (i % SHIPS_PER_LINE) + 1) * stage.stageWidth / (2 + SHIPS_PER_LINE);
            lShip.y = (i - (i % SHIPS_PER_LINE) + 1) * stage.stageHeight / (nShips);
            lShip.rotation = ((i % 2 == 0)) ? 0 : 180;
            ++i;
        }
        if (nShips % 2 != 0)
        {
            GameContainer.instance.addChild(lShip = ((nPlayers == nShips)) ? new PlayerShip() : new AIShip());
            lShip.x = 1 * stage.stageWidth / 2;
            lShip.y = (nShips - 1) / SHIPS_PER_LINE * stage.stageHeight / (nShips / SHIPS_PER_LINE);
            lShip.rotation = -90;
        }
        
        UIManager.startGame();
        
        stage.addEventListener(Event.ENTER_FRAME, gameLoop);
    }
    
    private static function gameLoop(pEvent : Event) : Void
    {
        var lClass : Dynamic;
        var i:Int = GAMELOOP_CLASSES.length - 1;
        while (i >= 0)
        {
            lClass = GAMELOOP_CLASSES[i];
            var j:Int = cast(lClass.list.length - 1, Int);
            while (j >= 0)
            {
                lClass.list[j].gameLoop();
                j--;
            }
            i--;
        }
        
        if (Ship.list.length <= 1)
        {
            gameOver();
        }
        
        i = GameContainer.instance.numChildren - 1;
        while (i >= 0)
        {
            GameContainer.instance.getChildAt(i).scaleX = 0.5;
            GameContainer.instance.getChildAt(i).scaleY = 0.5;
            i--;
        }
    }
    
    private static function gameOver()
    {
        UIManager.gameOver();
    }
    
    public static function destroyAllInstances() : Void
    {
        var lClass : Dynamic;
        var i:Int = GAMELOOP_CLASSES.length - 1;
        while (i >= 0)
        {
            lClass = GAMELOOP_CLASSES[i];
            var j:Int = cast(lClass.list.length - 1, Int);
            while (j >= 0)
            {
                lClass.list[j].destroy();
                j--;
            }
            i--;
        }
    }
    
    
    public static function stop() : Void
    {
        stage.removeEventListener(Event.ENTER_FRAME, gameLoop);
        destroyAllInstances();
        GameContainer.instance.destroy();
        stage = null;
    }

    public function new()
    {
    }
}

