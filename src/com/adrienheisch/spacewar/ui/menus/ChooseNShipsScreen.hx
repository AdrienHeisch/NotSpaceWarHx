package com.adrienheisch.spacewar.ui.menus;

import flash.errors.Error;
import com.adrienheisch.spacewar.game.GameManager;
import com.adrienheisch.spacewar.game.Ship;
import com.adrienheisch.spacewar.ui.UIManager;
import com.adrienheisch.spacewar.ui.buttons.NumberButton;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class ChooseNShipsScreen extends NumberChoiceMenu
{
    public static var instance(get, never) : ChooseNShipsScreen;

    
    /**
		 * instance unique de la classe ChooseNShipsScreen
		 */
    private static var _instance : ChooseNShipsScreen;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : ChooseNShipsScreen
    {
        if (_instance == null)
        {
            _instance = new ChooseNShipsScreen();
        }
        return _instance;
    }
    
    public var mcButton2 : NumberButton;
    public var mcButton3 : NumberButton;
    public var mcButton4 : NumberButton;
    
    public function new()
    {
        super();
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use ChooseNShipsScreen.instance");
        }
        else
        {
            _instance = this;
        }
    }
    
    override public function buttonClicked(pIndex : Int) : Void
    {
        destroy();
        GameManager.nShips = pIndex;
        
        Ship.infoList = [];
        for (i in 0...pIndex)
        {
            Ship.infoList.push([0, 0, 0]);
        }
        
        UIManager.chooseNPlayers();
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

