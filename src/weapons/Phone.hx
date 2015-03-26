package weapons;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import haxe.Timer;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Phone extends Sprite
{
	public var youMayShoot:Bool = true;
	private var takeBreak:Bool = false;
	
	public function new() 
	{
		super();
		
		y = Global.elementSize * 2;
		
		graphics.beginFill(0x00FF00);
        graphics.drawRect(0, 0, 0.8 * Global.elementSize, 0.8 * Global.elementSize);
		
		addEventListener(Event.ENTER_FRAME, update);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, shootAgain);
	}
	
	public function update(e:Event):Void {
		shoot();
	}
	
	public var phoneHorn:PhoneHorn;
	private var xySpeed:Array<Float> = new Array();
	private var collision:Int;
	private function shoot():Void {
		if (Global.mouseDown) {
			//make sure this is the start of a click, else, return
			if (takeBreak) {
				return;
			}
			//is there still a phone horn flying around? If so, get rid of it and return (player needs to click again for a new one)
			if (!youMayShoot) { 
				phoneHorn.parent.removeChild(phoneHorn);
				phoneHorn = null;
				youMayShoot = true;
				takeBreak = true;
				return;
			}
			
			//create a new phone horn
			phoneHorn = new PhoneHorn(Global.level.player.returnXY()[0] + Global.elementSize * 0.5, Global.level.player.returnXY()[1] + 1.5 * Global.elementSize);
			Global.level.addChild(phoneHorn);
			
			//check whether the horn didn't fly through a wall
			xySpeed[0] = Global.elementSize * phoneHorn.xSpeed / phoneHorn.speed;
			xySpeed[1] = Global.elementSize * phoneHorn.ySpeed / phoneHorn.speed;
			for (i in 0...25) {
				collision = phoneHorn.checkCollision( -0.1 * i * xySpeed[0], -0.1 * i * xySpeed[1]);
				if (collision > 0 && collision < 100 && collision != 2 && collision != 102 && collision != 4 && collision != 104) {
					phoneHorn.parent.removeChild(phoneHorn);
					phoneHorn = null;
					youMayShoot = true;
					break;
				}
			}
			
			youMayShoot = false;
			takeBreak = true;
		}
	}
	
	private function shootAgain(e:MouseEvent):Void {
		takeBreak = false;
	}
	
	public function remove():Void {
		if (phoneHorn != null) {
			phoneHorn.parent.removeChild(phoneHorn);
			phoneHorn = null;
		}
		
		removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	}
}