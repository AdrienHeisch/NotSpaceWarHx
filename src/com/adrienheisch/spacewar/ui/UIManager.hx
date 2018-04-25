package com.adrienheisch.spacewar.ui;

import com.adrienheisch.spacewar.Main;
import com.adrienheisch.spacewar.ui.menus.ChooseNPlayersScreen;
import com.adrienheisch.spacewar.ui.menus.ChooseNShipsScreen;
import com.adrienheisch.spacewar.ui.menus.MainMenu;
import openfl.display.Stage;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class UIManager
{
    private static var stage : Stage;
    
    public static function init() : Void
    {
        stage = Main.instance.stage;
        
        stage.addChild(UIContainer.instance);
        
        mainMenu();
    }
    
    public static function mainMenu() : Void
    {
        UIContainer.instance.addChild(MainMenu.instance);
    }
    
    public static function chooseNShips() : Void
    {
        UIContainer.instance.addChild(ChooseNShipsScreen.instance);
    }
    
    public static function chooseNPlayers() : Void
    {
        UIContainer.instance.addChild(ChooseNPlayersScreen.instance);
    }
    
    public static function startGame() : Void
    {
        if (Hud.instance != null)
        {
            Hud.instance.destroy();
        }
        UIContainer.instance.addChild(Hud.instance);
    }
    
    public static function gameOver() : Void
    {
        UIContainer.instance.addChild(GameOverScreen.instance);
    }
    
    public static function stop() : Void
    {
        UIContainer.instance.destroy();
        stage = null;
    }

    public function new()
    {
    }
}

