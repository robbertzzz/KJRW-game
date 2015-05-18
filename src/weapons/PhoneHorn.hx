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
	
	public function new(x:Float, y:Float) 
	{
		super();
		
		hornWidth = Global.elementSize;
		hornHeight = Global.elementSize;
		
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, hornWidth, hornHeight);
		
		this.x = x - 0.5 * hornWidth;
		this.y = y - 0.5 * hornHeight;
		
		startMoving();
		
		cable = new PhoneCable();
		cable.x = 0.5 * hornWidth - 0.15 * Global.elementSize;
		cable.y = 0.5 * hornHeight - 0.15 * Global.elementSize;
		addChild(cable);
		
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
		collision = checkCollision(xSpeed, ySpeed);
		
		/*// perform a collision check, DIE
		if (collision > 0 && collision != 100 && collision != 2 && collision != 102 && collision != 4 && collision != 104) {
			if (collision == 3 || collision == 103) {
				Global.level.level[Math.floor(((y + ySpeed + 0.5 * hornHeight) / Global.elementSize))][Math.floor(((x + xSpeed + 0.5 * hornWidth) / Global.elementSize))] = 0;
				i = 0;
				while (Global.blocks[i].x != (Math.floor(((x + xSpeed + 0.5 * hornWidth) / Global.elementSize))) * Global.elementSize || Global.blocks[i].y != (Math.floor(((y + ySpeed + 0.5 * hornHeight) / Global.elementSize))) * Global.elementSize) {
					i++;
				}
				
				Global.blocks[i].remove();
			}
			
			this.removeEventListener(Event.ENTER_FRAME, update);
			
			if (Global.weaponIndex == 2 && Global.level.player.arms[1].weapon.phoneHorn==this) {
				Global.level.player.arms[1].weapon.youMayShoot = true;
				Global.level.player.arms[1].weapon.phoneHorn = null;
			}
			this.parent.removeChild(this);
			return;
		}*/
		
		//check the distance, if too far, DIE
		playerX = Global.level.player.returnXY[0];
		playerY = Global.level.player.returnXY[1];
		playerDistance = Math.sqrt((x - playerX) * (x - playerX) + (y - playerY) * (y - playerY));
		
		trace(playerDistance);
		
		if(playerDistance > Global.elementSize) {
			this.removeEventListener(Event.ENTER_FRAME, update);
			
			if (Global.weaponIndex == 2 && Global.level.player.arms[1].weapon.phoneHorn==this) {
				Global.level.player.arms[1].weapon.youMayShoot = true;
				Global.level.player.arms[1].weapon.phoneHorn = null;
			}
			this.parent.removeChild(this);
			return;
		}
		
		if (collision == 4 || collision == 104) {
			startHanging();
		}
		
		cable.update(x + 0.5 * hornWidth, y + 0.5 * hornHeight);
	}
	
	public function checkCollision(xSpeed:Float, ySpeed:Float):Int {
		return Global.level.level[Math.floor(((y + ySpeed + 0.5 * hornHeight) / Global.elementSize))][Math.floor(((x + xSpeed + 0.5 * hornWidth) / Global.elementSize))];
	}
	
	private function startHanging():Void {
		x = Math.floor(((x + xSpeed + 0.5 * hornHeight) / Global.elementSize)) * Global.elementSize;
		y = Math.floor(((y + ySpeed + 0.5 * hornHeight) / Global.elementSize)) * Global.elementSize;
		xSpeed = 0;
		ySpeed = 0;
	}
}