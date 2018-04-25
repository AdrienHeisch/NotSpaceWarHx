package com.adrienheisch.utils;

import flash.geom.Point;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class MoreMaths
{
    public static var RAD2DEG : Float = 180 / Math.PI;
    public static var DEG2RAD : Float = Math.PI / 180;
    
    public static function distanceBetweenPoints(pX1 : Float, pY1 : Float, pX2 : Float, pY2 : Float) : Float
    {
        return Math.sqrt(Math.pow(pX1 - pX2, 2) + Math.pow(pY1 - pY2, 2));
    }
    
    public static function angleDifference(pAngleA : Float, pAngleB : Float) : Float
    {
        pAngleA *= DEG2RAD;
        pAngleB *= DEG2RAD;
        var lDifference : Float = Math.atan2(Math.sin(pAngleA - pAngleB), Math.cos(pAngleA - pAngleB)) * RAD2DEG;
        return lDifference;
    }

    public function new()
    {
    }
}

