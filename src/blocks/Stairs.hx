package blocks;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Stairs extends Sprite
{
	public var type:String = "Stairs";
	public var blockWidth:Float;
	public var blockHeight:Float;
	public function new() 
	{
		super();
		
		graphics.beginFill(0x000066);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
		blockWidth = Global.elementSize;
		blockHeight = Global.elementSize;
	}
	
}