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
	public var rightIsUp:Bool = false;
	public function new(x, y, level:Array<Array<Int>>) 
	{
		super();
		this.x = x;
		this.y = y;
		
		graphics.beginFill(0x000066);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
		blockWidth = Global.elementSize;
		blockHeight = Global.elementSize;
		
		if (Math.floor(y / 12) < level.length - 1) {
			trace(level[Math.floor(y / 12) - 1][Math.floor(x / 12) + 1] + " " + level[Math.floor(y / 12) + 1][Math.floor(x / 12) - 1]);
			if (level[Math.floor(y / 12) - 1][Math.floor(x / 12) + 1] == 6 || level[Math.floor(y / 12) + 1][Math.floor(x / 12) - 1] == 6) {
				rightIsUp = true;
			}
		} else {
			trace(level[Math.floor(y / 12) - 1][Math.floor(x / 12) + 1]);
			if (level[Math.floor(y / 12) - 1][Math.floor(x / 12) + 1] == 6) {
				
				rightIsUp = true;
			}
		}
	}
	
}