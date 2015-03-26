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
		
		partSize = 0.3 * Global.elementSize;
	}
	
	private var distance:Float;
	private var distanceX:Float;
	private var distanceY:Float;
	
	private var armX:Float;
	private var armY:Float;
	
	private var forLoopMax:Int;
	private var ii:Int = 0;
	
	public function update(phoneHornX:Float, phoneHornY:Float) {
		armX = Global.level.player.returnXY()[0] + Global.elementSize;
		armY = Global.level.player.returnXY()[1] + 2 * Global.elementSize;
		
		distance = Math.sqrt((phoneHornX - armX) * (phoneHornX - armX) + (phoneHornY - armY) * (phoneHornY - armY));
		distanceX = Math.abs(phoneHornX - armX);
		distanceY = Math.abs(phoneHornY - armY);
		if (phoneHornX > armX && phoneHornY > armY) {
			rotation = 180 - Math.asin(distanceX / distance) * 180 / Math.PI;
		}
		if (phoneHornX > armX && phoneHornY < armY) {
			rotation = Math.asin(distanceX / distance) * 180 / Math.PI;
		}
		if (phoneHornX < armX && phoneHornY < armY) {
			rotation = 360 - Math.asin(distanceX / distance) * 180 / Math.PI;
		}
		if (phoneHornX < armX && phoneHornY > armY) {
			rotation = Math.asin(distanceX / distance) * 180 / Math.PI + 180;
		}
		
		
		//trace(Math.floor(distance / partSize));
		graphics.clear();
		forLoopMax = Math.floor(distance / partSize);
		for (i in 0...forLoopMax) {
			graphics.beginFill(0x000000);
			graphics.drawRect(0, i * partSize, partSize, partSize);
		}
	}
}