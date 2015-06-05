package player;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class PhoneArmBack extends Sprite
{

	public function new() 
	{
		super();
		
		x += 25;
		y += 23;
		
		AssetStorage.phoneArmBack.drawTiles(this.graphics, [0, 0, 0]);
		addEventListener(Event.ENTER_FRAME, update);
		
		update(null);
		//frame --;
	}
	
	private var xFix:Float;
	private var yFix:Float;
	private function update(e:Event) {
		if (Global.pause) {
			return;
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
		x = 25 + xFix;
		y = 25 - yFix;
	}
	
	public function remove() {
		removeEventListener(Event.ENTER_FRAME, update);
		parent.removeChild(this);
	}
}