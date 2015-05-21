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
		
		y = 20;
		
		graphics.beginFill(0x00FF00);
        graphics.drawRect(0, 0, 9, 9);
		
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
			if (!youMayShoot && !Global.level.player.isHanging) {
				phoneHorn.remove();
				phoneHorn = null;
				youMayShoot = true;
				takeBreak = true;
				return;
			}
			if (Global.level.player.isHanging) {
				return;
			}
			
			//create a new phone horn
			phoneHorn = new PhoneHorn(Global.level.player.returnXY()[0] + Global.elementSize * 0.5, Global.level.player.returnXY()[1] + 1.5 * Global.elementSize);
			Global.level.addChild(phoneHorn);
			
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