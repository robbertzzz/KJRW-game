package blocks ;

import haxe.Timer;
import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Obstacle extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0x0000FF);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
	public function remove():Void {
		
		if (Global.fogMap[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)] != null) {
			Global.fogMap[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)].remove(this);
		}
		if (Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] != null) {
			Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)].remove(this);
		}
		if (Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1] != null) {
			Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1].remove(this);
		}
		if (Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1] != null) {
			Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1].remove(this);
		}
		
		Global.blocks.remove(this);
		Global.level.removeChild(this);
	}
}