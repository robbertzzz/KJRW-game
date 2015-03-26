package player;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Leg extends Sprite
{
	private var leftRight:Bool;
	public function new(leftRight:Bool) 
	{
		super();
		
		this.leftRight = leftRight;
		
		x = 0.5 * Global.elementSize;
		y = 3 * Global.elementSize;
		
		graphics.beginFill(0x0000FF);
        graphics.drawRect(0, 0, Global.elementSize, 2 * Global.elementSize);
	}
}