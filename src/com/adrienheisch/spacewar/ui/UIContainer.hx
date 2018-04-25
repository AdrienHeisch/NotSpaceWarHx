package com.adrienheisch.spacewar.ui;

import flash.errors.Error;
import flash.display.MovieClip;
import flash.events.Event;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class UIContainer extends MovieClip
{
    public static var instance(get, never) : UIContainer;

    
    /**
		 * instance unique de la classe UIContainer
		 */
    private static var _instance : UIContainer;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : UIContainer
    {
        if (_instance == null)
        {
            _instance = new UIContainer();
        }
        return _instance;
    }
    
    public function new()
    {
        super();
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use UIContainer.instance");
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

