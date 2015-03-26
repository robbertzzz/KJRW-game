package player;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Head extends Sprite
{

	public function new() 
	{
		super();
		
		x = 0.5 * Global.elementSize;
		y = 0;
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
}