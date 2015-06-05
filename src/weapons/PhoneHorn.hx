package weapons;

import openfl.display.Sprite;
import openfl.events.Event;

import blocks.*;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class PhoneHorn extends Sprite
{
	public var speed:Float;
	public var xSpeed:Float;
	public var ySpeed:Float;
	
	private var direction:Float;
	private var absX:Float;
	private var absY:Float;
	private var mouseDistance:Float;
	private var mouseDistanceX:Float;
	private var mouseDistanceY:Float;
	
	private var hornWidth:Float;
	private var hornHeight:Float;
	
	private var cable:PhoneCable;
	
	private var isHanging:Bool = false;
	
	public function new(x:Float, y:Float) 
	{
		super();
		
		hornWidth = Global.elementSize;
		hornHeight = Global.elementSize;
		
		AssetStorage.phoneHorn.drawTiles(this.graphics, [-5, -18, 0]);
		
		this.x = x - 0.5 * hornWidth;
		this.y = y - 0.5 * hornHeight;
		
		startMoving();
		
		addEventListener(Event.ENTER_FRAME, update);
	}

	private function startMoving():Void {
		speed = 0.5 * Global.elementSize;
		absX = Global.level.returnXY()[0] + x;
		absY = Global.level.returnXY()[1] + y;
		mouseDistance = Math.sqrt((Global.mouseX - 0.5 * hornWidth - absX) * (Global.mouseX - 0.5 * hornWidth - absX) + (Global.mouseY - 0.5 * hornHeight - absY) * (Global.mouseY - 0.5 * hornHeight - absY));
		mouseDistanceX = Global.mouseX - 0.5 * hornWidth - absX;
		mouseDistanceY = Global.mouseY - 0.5 * hornHeight - absY;
		xSpeed = (mouseDistanceX / mouseDistance) * speed;
		ySpeed = (mouseDistanceY / mouseDistance) * speed;
		
		var rotationRad:Float;
		if(mouseDistanceY >= 0) {
			rotationRad = Math.acos(mouseDistanceX / mouseDistance);
		} else {
			rotationRad = Math.PI - Math.acos(mouseDistanceX / mouseDistance);
		}
		rotation = 180 * (rotationRad / Math.PI);
		
		if (mouseDistanceY > 0) {
			rotation += 90;
		} else {
			rotation -= 90;
		}
		
		x += 2.5 * Global.elementSize * xSpeed / speed;
		y += 2.5 * Global.elementSize * ySpeed / speed;
	}
	
	private var i:Int;
	private var obstacle:Obstacle;
	private var collision:Int;
	private var playerX:Float;
	private var playerY:Float;
	private var playerDistance:Float;
	private function update(e:Event):Void {
		x += xSpeed;
		y += ySpeed;
		
		if (checkCollision(xSpeed, ySpeed) == 4 || checkCollision(xSpeed, ySpeed) == 104) {
			startHanging();
		}
		
		//check the distance, if too far, or phone is outside the level, DIE
		playerX = Global.level.player.returnXY()[0];
		playerY = Global.level.player.returnXY()[1];
		playerDistance = Math.sqrt((x - playerX) * (x - playerX) + (y - playerY) * (y - playerY));
		
		if(!isHanging && (playerDistance > Global.elementSize * 20 || y > Global.levelHeight - 20)) {
			
			if (Global.weaponIndex == 2 && Global.level.player.arms[1].weapon.phoneHorn == this) {
				Global.level.player.arms[1].weapon.youMayShoot = true;
				Global.level.player.arms[1].weapon.phoneHorn = null;
			}
			trace("hi");
			remove();
			
			return;
		}
		
		/*if (collision == 4 || collision == 104) {
			startHanging();
		}*/
		
		//cable.update(x + 0.5 * hornWidth, y + 0.5 * hornHeight);
	}
	
	public function checkCollision(xSpeed:Float, ySpeed:Float):Int {
		return Global.level.level[Math.floor(((y + ySpeed + 0.5 * hornHeight) / Global.elementSize))][Math.floor(((x + xSpeed + 0.5 * hornWidth) / Global.elementSize))];
	}
	
	private function startHanging():Void {
		x = Math.floor(((x + xSpeed + 0.5 * hornHeight) / Global.elementSize)) * Global.elementSize;
		y = Math.floor(((y + ySpeed + 0.5 * hornHeight) / Global.elementSize)) * Global.elementSize;
		xSpeed = 0;
		ySpeed = 0;
		
		isHanging = true;
		Global.level.player.isHanging = true;
	}
	
	public function remove() {
		removeEventListener(Event.ENTER_FRAME, update);
		Global.level.player.arms[1].phoneHorn = null;
		Global.level.player.arms[1].frame = 0;
		Global.level.player.arms[1].firstThrow = false;
		this.parent.removeChild(this);
	}
}