package com.adrienheisch.spacewar.game;

import com.adrienheisch.utils.MoreMaths;
import openfl.geom.Point;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class AIShip extends Ship
{
    public static var movePrediction : Bool = true;
    public static var shootPrediction : Bool = true;
    
    private static inline var DISTANCE_BEFORE_ACCELERATION : Float = 300;
    
    private var target : Ship;
    
    public function new()
    {
        super();
    }
    
    override public function gameLoop() : Void
    {
        var lLength = Ship.list.length;
        if (lLength > 1)
        {
            var lShip : Ship;
            var lDistances : Array<Float> = new Array<Float>();
            var lSortedDistances : Array<Dynamic> = [];
            
            var i = lLength - 1;
            while (i >= 0)
            {
                lShip = Ship.list[i];
                if (movePrediction)
                {
                    lDistances[i] = MoreMaths.distanceBetweenPoints(x, y, lShip.x + (lShip.velocity.x * MoreMaths.distanceBetweenPoints(x, y, lShip.x, lShip.y) / Bullet.SPEED), lShip.y + (lShip.velocity.y * MoreMaths.distanceBetweenPoints(x, y, lShip.x, lShip.y) / Bullet.SPEED));
                }
                else
                {
                    lDistances[i] = MoreMaths.distanceBetweenPoints(x, y, lShip.x, lShip.y);
                }
                lSortedDistances[i] = lDistances[i];
                i--;
            }
            
            lSortedDistances.sort(function(pA:Float, pB:Float) {
				return pA < pB ? -1 : 1;
			});
            
            target = Ship.list[lDistances.indexOf(lSortedDistances[1])];
            var lDistanceToTarget : Float = lSortedDistances[1];
            
            var lAngle : Float;
            if (shootPrediction)
            {
                var lFutureTargetPosition : Point = new Point(target.x + (target.velocity.x * lDistanceToTarget / Bullet.SPEED), target.y + (target.velocity.y * lDistanceToTarget / Bullet.SPEED));
                lAngle = Math.atan2(lFutureTargetPosition.y - y, lFutureTargetPosition.x - x) * MoreMaths.RAD2DEG;
            }
            else
            {
                lAngle = Math.atan2(target.y - y, target.x - x) * MoreMaths.RAD2DEG;
            }
            
            var lAngleDelta = MoreMaths.angleDifference(lAngle, rotation);
            
            input[2] = true;
            
            if (lAngleDelta < 0)
            {
                input[1] = false;
                input[0] = true;
            }
            if (lAngleDelta > 0)
            {
                input[0] = false;
                input[1] = true;
            }
            
            if (lAngleDelta > -45 && lAngleDelta < 15)
            {
                if (lDistanceToTarget > DISTANCE_BEFORE_ACCELERATION)
                {
                    input[4] = true;
                }
                else
                {
                    input[4] = false;
                }
                input[5] = true;
            }
            else
            {
                input[5] = false;
            }
        }
        else
        {
            var j = input.length - 1;
            while (j >= 0)
            {
                input[j] = false;
                j--;
            }
        }
        
        super.gameLoop();
    }
    
    override public function destroy() : Void
    {
        super.destroy();
    }
}

