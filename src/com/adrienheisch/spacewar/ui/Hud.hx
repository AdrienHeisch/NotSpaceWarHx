package com.adrienheisch.spacewar.ui;

import flash.errors.Error;
import com.adrienheisch.spacewar.Main;
import com.adrienheisch.spacewar.game.Ship;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Hud extends MovieClip
{
    public static var instance(get, never) : Hud;

    
    /**
		 * instance unique de la classe Hud
		 */
    private static var _instance : Hud;
    
    /**
		 * Retourne l'instance unique de la classe, et la crée si elle n'existait pas au préalable
		 * @return instance unique
		 */
    private static function get_instance() : Hud
    {
        if (_instance == null)
        {
            _instance = new Hud();
        }
        return _instance;
    }
    
    public function new()
    {
        super();
        
        if (_instance != null)
        {
            throw new Error(this + "is a Singleton, please use Hud.instance");
        }
        else
        {
            _instance = this;
            
            var i = Ship.list.length - 1;
            while (i >= 0)
            {
                var lBar : HealthBar;
                addChild(lBar = new HealthBar());
                lBar.x = ((i % 2 == 0)) ? 10 : Main.instance.stage.stageWidth - lBar.width - 10;
                lBar.y = ((Math.floor(i / 2) % 2 == 0)) ? 10 : Main.instance.stage.stageHeight - lBar.height - 10;
                lBar.index = i;
                i--;
            }
            
            addEventListener(Event.ENTER_FRAME, refreshAlpha);
        }
    }
    
    private function refreshAlpha(pEvent : Event) : Void
    {
        var lChild : DisplayObject;
        var i = numChildren - 1;
        while (i >= 0)
        {
            lChild = getChildAt(i);
            var j = Ship.list.length - 1;
            while (j >= 0)
            {
                if (lChild.hitTestObject(Ship.list[j]))
                {
                    lChild.alpha = 0.5;
                    break;
                }
                else
                {
                    lChild.alpha = 1;
                }
                j--;
            }
            i--;
        }
    }
    
    public function refreshInfo() : Void
    {
        var i = HealthBar.list.length - 1;
        while (i >= 0)
        {
            HealthBar.list[i].refresh();
            i--;
        }
    }
    
    /**
		 * détruit l'instance unique et met sa référence interne à null
		 */
    public function destroy() : Void
    {
        _instance = null;
        var i = HealthBar.list.length - 1;
        while (i >= 0)
        {
            HealthBar.list[i].destroy();
            i--;
        }
        if (parent != null)
        {
            parent.removeChild(this);
        }
    }
}

