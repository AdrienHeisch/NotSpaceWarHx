package com.adrienheisch.spacewar.game;

import com.adrienheisch.spacewar.game.Explosion;
import openfl.Assets;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.geom.ColorTransform;
import openfl.geom.Point;

/**
	 * ...
	 * @author Adrien Heisch
	 */
class Ship extends Sprite
{
	public static var list : Array<Ship> = new Array<Ship>();
	public static var infoList : Array<Dynamic>;

	public static var moveBackAllowed : Bool = false;
	public static var autoSlow : Bool = true;

	public static var COLORS : Array<Int> = [0xFF0000, 0x0099FF, 0x00FF00, 0xFFFFFF];

	public static inline var MAX_HEALTH : Float = 5;
	private static inline var MAX_TURNING_SPEED : Float = 3;
	private static inline var TURNING_ACCELERATION_VALUE : Float = 0.25;
	private static inline var BASE_MAX_SPEED : Float = 5;
	private static inline var BASE_ACCELERATION : Float = 0.2;
	private static inline var BRAKE : Float = 0.1;
	private static inline var SELF_BRAKE : Float = 0.05;
	private static inline var BOOST_MULT : Float = 2;
	private static inline var SHOOT_COOLDOWN : Int = 20;

	public var velocity : Point = new Point(0, 0);
	private var maxSpeed : Int = 0;
	private var acceleration : Point = new Point(0, 0);
	private var accelerationValue : Float = 0;
	private var turningSpeed : Float = 0;
	private var turningAcceleration : Float = 0;
	private var shootTimer : Int = 0;
	private var color : Int = 0;

	//0:left, 1:right, 2:up, 3:down, 4:boost, 5:shoot
	public var input : Array<Bool> = new Array<Bool>();
	public var health : Float;
	public var id : Int;

	public var sprite:Sprite;
	public var mcColor : DisplayObject;
	public var mcShootPoint : DisplayObject;

	public function new()
	{
		super();

		list.push(this);

		addChild(sprite = Assets.getMovieClip("swf-lib:Ship"));
		mcColor = sprite.getChildByName("mcColor");
		mcShootPoint = sprite.getChildByName("mcShootPoint");

		//cacheAsBitmap = true;

		health = MAX_HEALTH;
		id = Lambda.indexOf(list, this);

		mcShootPoint.visible = false;

		color = COLORS[id];
		var lColorTransform : ColorTransform = new ColorTransform();
		lColorTransform.color = color;
		mcColor.transform.colorTransform = lColorTransform;
	}

	public function gameLoop() : Void
	{
		if (input[5] && shootTimer == 0)
		{
			shoot();
		}
		else if (shootTimer != 0)
		{
			shootTimer -= 1;
		}

		maxSpeed = BASE_MAX_SPEED * ((input[4]) ? BOOST_MULT : 1);
		accelerationValue = BASE_ACCELERATION * ((input[4]) ? BOOST_MULT : 1);

		if ((!input[0] && !input[1]) || (input[0] && input[1]))
		{
			turningAcceleration = 0;
			if (turningSpeed > 0)
			{
				turningSpeed -= TURNING_ACCELERATION_VALUE;
			}
			if (turningSpeed < 0)
			{
				turningSpeed += TURNING_ACCELERATION_VALUE;
			}
		}
		else if (input[0])
		{
			turningAcceleration = -TURNING_ACCELERATION_VALUE;
		}
		else if (input[1])
		{
			turningAcceleration = TURNING_ACCELERATION_VALUE;
		}

		if ((turningSpeed >= MAX_TURNING_SPEED && turningAcceleration > 0) || (turningSpeed <= -MAX_TURNING_SPEED && turningAcceleration < 0))
		{
			turningAcceleration = 0;
		}
		turningSpeed += turningAcceleration;
		rotation += turningSpeed;

		if (input[2])
		{
			acceleration.x = accelerationValue * Math.cos(rotation * Math.PI / 180);
			acceleration.y = accelerationValue * Math.sin(rotation * Math.PI / 180);
		}
		else
		{
			acceleration.setTo(0, 0);
			if (input[3] && moveBackAllowed)
			{
				acceleration.x = BRAKE * -Math.cos(rotation * Math.PI / 180);
				acceleration.y = BRAKE * -Math.sin(rotation * Math.PI / 180);
			}
			else if (Math.abs(velocity.length) > SELF_BRAKE && autoSlow)
			{
				acceleration.x = SELF_BRAKE * -Math.cos(Math.atan2(velocity.y, velocity.x));
				acceleration.y = SELF_BRAKE * -Math.sin(Math.atan2(velocity.y, velocity.x));
			}
		}

		velocity.x += acceleration.x;
		velocity.y += acceleration.y;

		if (velocity.length >= maxSpeed)
		{
			velocity.x += (SELF_BRAKE + accelerationValue) * -Math.cos(Math.atan2(velocity.y, velocity.x));
			velocity.y += (SELF_BRAKE + accelerationValue) * -Math.sin(Math.atan2(velocity.y, velocity.x));
		}

		if ((x <= width / 2 && velocity.x < 0) || (x >= stage.stageWidth - width / 2 && velocity.x > 0))
		{
			velocity.x *= -1;
		}
		if ((y <= height / 2 && velocity.y < 0) || (y >= stage.stageHeight - height / 2 && velocity.y > 0))
		{
			velocity.y *= -1;
		}

		x += velocity.x;
		y += velocity.y;
	}

	private function shoot() : Void
	{
		var lBullet : Bullet;
		shootTimer = SHOOT_COOLDOWN;
		parent.addChild(lBullet = new Bullet());
		var lBulletCoords : Point = localToGlobal(parent.globalToLocal(new Point(mcShootPoint.x, mcShootPoint.y)));
		lBullet.parentShip = this;
		lBullet.parentShipId = id;
		lBullet.x = lBulletCoords.x;
		lBullet.y = lBulletCoords.y;
		lBullet.rotation = rotation;
		lBullet.velocity = new Point(Bullet.SPEED * Math.cos(rotation * Math.PI / 180), Bullet.SPEED * Math.sin(rotation * Math.PI / 180));
		lBullet.color = color;
	}

	public function destroy() : Void
	{
		var lExplosion : Explosion;
		parent.addChild(lExplosion = new Explosion());
		lExplosion.x = x;
		lExplosion.y = y;

		list.splice(Lambda.indexOf(list, this), 1);
		if (parent != null)
		{
			parent.removeChild(this);
		}
	}
}

