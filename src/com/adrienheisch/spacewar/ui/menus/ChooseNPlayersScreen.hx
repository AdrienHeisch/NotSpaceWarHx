package com.adrienheisch.spacewar.ui.menus;

import openfl.Assets;
import openfl.errors.Error;
import com.adrienheisch.spacewar.game.GameManager;
import com.adrienheisch.spacewar.ui.buttons.NumberButton;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class ChooseNPlayersScreen extends NumberChoiceMenu
{
    public static var instance(get, never) : ChooseNPlayersScreen;

    
    /**
		 * instance unique de la classe ChooseNPlayersScreen
		 */
    private static var _instance : ChooseNPlayersScreen;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : ChooseNPlayersScreen
    {
        if (_instance == null)
        {
            _instance = new ChooseNPlayersScreen();
        }
        return _instance;
    }
    
    public var mcButton1 : NumberButton;
    public var mcButton2 : NumberButton;
    
    public function new()
    {
        super();
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use ChooseNPlayersScreen.instance");
        }
        else
        {
            _instance = this;
        }
		
		addChild(sprite = Assets.getMovieClip("swf-lib:ChooseNPlayersScreen"));
		
		mcButton1 = cast(sprite.getChildByName("mcButton1"), NumberButton);
		mcButton2 = cast(sprite.getChildByName("mcButton2"), NumberButton);
    }
    
    override public function buttonClicked(pIndex : Int) : Void
    {
        destroy();
        GameManager.nPlayers = pIndex;
        GameManager.startGame();
    }
    
    /**
		 * détruit l'instance unique et met sa référence interne à null
		 */
    override public function destroy() : Void
    {
        _instance = null;
        super.destroy();
    }
}

