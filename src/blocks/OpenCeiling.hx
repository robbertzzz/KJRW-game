package blocks;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class OpenCeiling extends Sprite
{
	public var type:String = "OpenCeiling";
	
	public function new() 
	{
		super();
		
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
}