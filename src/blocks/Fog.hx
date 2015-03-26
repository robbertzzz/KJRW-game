package blocks ;

import haxe.Timer;
import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Fog extends Sprite
{
	private var instancePrev:Dynamic;
	
	public function new() 
	{
		super();
		
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
	public function remove(instancePrev:Dynamic) {
		this.instancePrev = instancePrev;
		
		Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize)] = null;
		
		if (Global.fogMap[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)] != null && Global.fogMap[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)] != instancePrev) {
			Global.fogMap[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)].remove(this);
		}
		if (Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] != null && Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] != instancePrev) {
			Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)].remove(this);
		}
		if (Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1] != null && Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] != instancePrev) {
			Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1].remove(this);
		}
		if (Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1] != null && Global.fogMap[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] != instancePrev) {
			Global.fogMap[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1].remove(this);
		}
		
		
		Global.level.removeChild(this);
	}
}