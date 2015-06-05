package player;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import weapons.Bullet;
import weapons.ProjectileWeapon;
import weapons.Phone;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Arm extends Sprite
{
	public var startX:Float;
	public var startY:Float;
	private var leftRight:Bool;
	private var currentWeaponIndex:Int = 1;
	public var weapon:Dynamic;
	private var xFix:Float = 3.5;
	private var yFix:Float = 0;
	
	public function new(leftRight:Bool) 
	{
		super();
		
		this.leftRight = leftRight;
		
		x = 17;
		y = 26;
		startX = x;
		startY = y;
		
		AssetStorage.playerArm.drawTiles (this.graphics, [0, -2, 0]);
		
		/*if (leftRight) {
			weapon = new ProjectileWeapon();
			addChild(weapon);
		}*/
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event) {
		if (Global.pause) {
			return;
		}
		followMouse();
		/*if (leftRight) {
			controlWeapons();
		}*/
		
		
	}
	
	/*private function controlWeapons():Void {
		if (Global.weaponIndex != currentWeaponIndex) {
			weapon.remove();
			switch(Global.weaponIndex) {
				case 1:
					weapon = new ProjectileWeapon();
					addChild(weapon);
					trace("ProjectileWeapon");
				case 2:
					weapon = new Phone();
					addChild(weapon);
					trace("Phone");
			}
			currentWeaponIndex = Global.weaponIndex;
		}
	}*/
	
	private var rotationRad:Float;
	private var mouseDistance:Float;
	private var absX:Float;
	private var absY:Float;
	
	private function followMouse():Void {
		if (leftRight) {
			try {
				absX = Global.level.returnXY()[0] + Global.level.player.returnXY()[0] + x;
				absY = Global.level.returnXY()[1] + Global.level.player.returnXY()[1] + y;
				mouseDistance = Math.sqrt((Global.mouseX - absX) * (Global.mouseX - absX) + (Global.mouseY - absY) * (Global.mouseY - absY));
				rotationRad = -Math.acos((Global.mouseX - absX) / mouseDistance) - 0.5 * Math.PI;
				
				if (Global.mouseY > absY) {
					rotationRad = Math.PI - rotationRad;
				}
				
				rotation = (rotationRad / Math.PI) * 180;
			} catch (e:Dynamic) {
				trace(e);
			}
		} else {
			//rotation --;
			rotationRad = (rotation / 360) * 2 * Math.PI;
		}
		
		switch(Math.floor(Global.level.player.frame % 8)) {
			case 0:
				yFix = 0;
				xFix = 0;
			case 1:
				yFix = -1;
				xFix = 1;
			case 2:
				yFix = 4;
				xFix = 1;
			case 3:
				yFix = 6;
				xFix = 1;
			case 4:
				yFix = 1;
				xFix = 1;
			case 5:
				yFix = 0;
				xFix = 1;
			case 6:
				yFix = 2;
				xFix = 1;
			case 7:
				yFix = 4;
				xFix = 2;
			default:
				yFix = 0;
				xFix = 0;
		}
		
		x = startX + xFix - 3 * Math.cos(rotationRad);
		y = startY - yFix - 3 * Math.sin(rotationRad);
		
	}
}