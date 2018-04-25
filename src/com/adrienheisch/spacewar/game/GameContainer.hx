package com.adrienheisch.spacewar.game;

import openfl.errors.Error;
import openfl.display.MovieClip;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class GameContainer extends MovieClip
{
    public static var instance(get, never) : GameContainer;

    
    /**
		 * instance unique de la classe GameContainer
		 */
    private static var _instance : GameContainer;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : GameContainer
    {
        if (_instance == null)
        {
            _instance = new GameContainer();
        }
        return _instance;
    }
    
    public function new()
    {
        super();
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use GameContainer.instance");
        }
        else
        {
            _instance = this;
        }
    }
    
    /**
		 * détruit l'instance unique et met sa référence interne à null
		 */
    public function destroy() : Void
    {
        _instance = null;
        if (parent != null)
        {
            parent.removeChild(this);
        }
    }
}

