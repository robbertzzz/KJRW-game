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
	private var startX:Float;
	private var startY:Float;
	private var leftRight:Bool;
	private var currentWeaponIndex:Int = 1;
	public var weapon:Dynamic;
	
	public function new(leftRight:Bool) 
	{
		super();
		
		this.leftRight = leftRight;
		
		x = 0.6 * Global.elementSize;
		y = 1.5 * Global.elementSize;
		startX = x;
		startY = y;
		graphics.beginFill(0xFF0000);
        graphics.drawRect(0, 0, 0.8 * Global.elementSize, 2 * Global.elementSize);
		
		
		if (leftRight) {
			weapon = new ProjectileWeapon();
			addChild(weapon);
		}
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event) {
		followMouse();
		if (leftRight) {
			controlWeapons();
		}
		
		
	}
	
	private function controlWeapons():Void {
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
	}
	
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
		x = startX + 0.4 * Global.elementSize - 0.4 * Global.elementSize * Math.cos(rotationRad);
		y = startY - 0.4 * Global.elementSize * Math.sin(rotationRad);
	}
}