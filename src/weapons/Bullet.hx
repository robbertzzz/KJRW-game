package weapons;

import openfl.display.Sprite;
import openfl.events.Event;

import blocks.Block;
import blocks.Coin;
import blocks.Fog;
import blocks.HangBlock;
import blocks.Obstacle;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Bullet extends Sprite
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
	
	
	public function new(x:Float, y:Float ) 
	{
		super();
		
		this.x = x;
		this.y = y;
		//this.direction = direction;
		
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, 4 * Global.elementSize / 16, 4 * Global.elementSize / 16);
		
		startMoving();
		
		addEventListener(Event.ENTER_FRAME, update);
	}

	private function startMoving():Void {
		speed = 0.5 * Global.elementSize;
		absX = Global.level.returnXY()[0] + x;
		absY = Global.level.returnXY()[1] + y;
		mouseDistance = Math.sqrt((Global.mouseX - absX) * (Global.mouseX - absX) + (Global.mouseY - absY) * (Global.mouseY - absY));
		mouseDistanceX = Global.mouseX - absX;
		mouseDistanceY = Global.mouseY - absY;
		xSpeed = (mouseDistanceX / mouseDistance) * speed;
		ySpeed = (mouseDistanceY / mouseDistance) * speed;
		
		x += 2.5 * Global.elementSize * xSpeed / speed;
		y += 2.5 * Global.elementSize * ySpeed / speed;
	}
	
	private var i:Int;
	private var obstacle:Obstacle;
	private var collision:Int;
	private function update(e:Event):Void {
		x += xSpeed;
		y += ySpeed;
		collision = checkCollision(xSpeed, ySpeed);
		
		// perform a collision check, DIE
		if (collision > 0 && collision != 100 && collision != 2 && collision != 102 && collision != 4 && collision != 104) {
			if (collision == 3 || collision == 103) {
				Global.level.level[Math.floor(((y + ySpeed) / Global.elementSize))][Math.floor(((x + xSpeed) / Global.elementSize))] = 0;
				i = 0;
				while (Global.blocks[i].x != (Math.floor(((x + xSpeed) / Global.elementSize))) * Global.elementSize || Global.blocks[i].y != (Math.floor(((y + ySpeed) / Global.elementSize))) * Global.elementSize) {
					i++;
				}
				
				Global.blocks[i].remove();
			}
			this.removeEventListener(Event.ENTER_FRAME, update);
			Global.bullets.remove(this);
			this.parent.removeChild(this);
		}
	}
	
	public function checkCollision(xSpeed:Float, ySpeed:Float):Int {
		return Global.level.level[Math.floor(((y + ySpeed) / Global.elementSize))][Math.floor(((x + xSpeed) / Global.elementSize))];
	}
}