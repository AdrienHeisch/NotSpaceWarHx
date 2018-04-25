package com.adrienheisch.spacewar.background;

import flash.errors.Error;
import flash.display.MovieClip;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class BackgroundContainer extends MovieClip
{
    public static var instance(get, never) : BackgroundContainer;

    
    /**
		 * instance unique de la classe BackgroundContainer
		 */
    private static var _instance : BackgroundContainer;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : BackgroundContainer
    {
        if (_instance == null)
        {
            _instance = new BackgroundContainer();
        }
        return _instance;
    }
    
    public function new()
    {
        super();
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use BackgroundContainer.instance");
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

