package blocks;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Door extends Sprite
{
	public var type:String = "Door";
	public function new() 
	{
		super();
		
		graphics.beginFill(0xFF2222);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
}