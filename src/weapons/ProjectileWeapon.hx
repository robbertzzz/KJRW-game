package weapons;

import openfl.display.Sprite;
import openfl.events.Event;
import haxe.Timer;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class ProjectileWeapon extends Sprite
{
	private var youMayShoot:Bool = true;
	
	public function new() 
	{
		super();
		
		y = 20;
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, 0.8 * Global.elementSize, 0.8 * Global.elementSize);
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function update(e:Event):Void {
		shoot();
	}
	
	private var bullet:Bullet;
	private var xySpeed:Array<Float> = new Array();
	private var collision:Int;
	private function shoot():Void {
		if (Global.mouseDown) {
			if (!youMayShoot) { return; }
			
			bullet = new Bullet(Global.level.player.returnXY()[0] + Global.elementSize * 0.5, Global.level.player.returnXY()[1] + 1.5 * Global.elementSize);
			Global.level.addChild(bullet);
			Global.bullets.push(bullet);
			
			//check whether the bullet didn't fly through a wall
			xySpeed[0] = Global.elementSize * bullet.xSpeed / bullet.speed;
			xySpeed[1] = Global.elementSize * bullet.ySpeed / bullet.speed;
			for (i in 0...25) {
				collision = bullet.checkCollision( -0.1 * i * xySpeed[0], -0.1 * i * xySpeed[1]);
				if (collision > 0 && collision < 100 && collision != 2 && collision != 102 && collision != 7 && collision != 107) {
					bullet.removeEventListener(Event.ENTER_FRAME, bullet.update);
					bullet.parent.removeChild(bullet);
					Global.bullets[Global.bullets.indexOf(bullet)] = null;
					break;
				}
			}
			
			youMayShoot = false;
			Timer.delay(shootAgain, 300);
		}
	}
	
	private function shootAgain():Void {
		youMayShoot = true;
	}
	
	public function remove():Void {
		removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	}
}