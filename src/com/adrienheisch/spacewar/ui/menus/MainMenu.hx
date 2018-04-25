package com.adrienheisch.spacewar.ui.menus;

import flash.display.Sprite;
import openfl.Assets;
import openfl.errors.Error;
import com.adrienheisch.spacewar.ui.buttons.PlayButton;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class MainMenu extends Menu
{
    public static var instance(get, never) : MainMenu;

    
    /**
		 * instance unique de la classe MainMenu
		 */
    private static var _instance : MainMenu;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : MainMenu
    {
        if (_instance == null)
        {
            _instance = new MainMenu();
        }
        return _instance;
    }
    
    public var mcPlay : PlayButton;
    
    public function new()
    {
        super();
		
		trace('YEAH');
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use MainMenu.instance");
        }
        else
        {
            _instance = this;
        }
		
		addChild(sprite = Assets.getMovieClip("swf-lib:com.adrienheisch.spacewar.ui.menus.MainMenu"));
		
		mcPlay = cast(sprite.getChildByName("mcPlay"), PlayButton);
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

