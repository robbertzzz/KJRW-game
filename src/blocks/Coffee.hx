package blocks;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Coffee extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0xFFDD22);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
}