package weapons;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class PhoneCable extends Sprite
{
	private var partSize:Float;
	
	public function new() 
	{
		super();
		
		partSize = 4;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function update(e:Event) {
		if (Global.pause) {
			return;
		}
		if (Global.level.player.arms[0] == null) {
			remove();
			return;
		}
		if(Global.level.player.arms[1].phoneHorn == null) {
			x = Global.level.player.returnXY()[0] + Global.level.player.arms[1].x + Math.cos(Math.PI * ((Global.level.player.arms[1].rotation) / 180)) * 25;
			y = Global.level.player.returnXY()[1] + Global.level.player.arms[1].y + Math.sin(Math.PI * ((Global.level.player.arms[1].rotation) / 180)) * 25;
		} else {
			x = Global.level.player.arms[1].phoneHorn.x;
			y = Global.level.player.arms[1].phoneHorn.y;
		}
		
		var armX:Float = Global.level.player.returnXY()[0] + Global.level.player.arms[0].x + 26;
		var armY:Float = Global.level.player.returnXY()[1] + Global.level.player.arms[0].y + 8;
		
		var distance:Float = Math.sqrt((x - armX) * (x - armX) + (y - armY) * (y - armY));
		var distanceX:Float = Math.abs(x - armX);
		var distanceY:Float = Math.abs(y - armY);
		
		if (x > armX && y > armY) {
			rotation = 180 - Math.asin(distanceX / distance) * 180 / Math.PI;
		}
		if (x > armX && y < armY) {
			rotation = Math.asin(distanceX / distance) * 180 / Math.PI;
		}
		if (x < armX && y < armY) {
			rotation = 360 - Math.asin(distanceX / distance) * 180 / Math.PI;
		}
		if (x < armX && y > armY) {
			rotation = Math.asin(distanceX / distance) * 180 / Math.PI + 180;
		}
		
		graphics.clear();
		var forLoopMax:Int = Math.floor(distance / partSize);
		for (i in 0...forLoopMax) {
			AssetStorage.phoneCable.drawTiles(this.graphics, [0, i * 4, 0]);
		}
	}
	
	public function remove():Void {
		removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	}
}