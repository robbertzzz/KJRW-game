package blocks ;

import haxe.Timer;
import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Obstacle extends Sprite
{
	private var instancePrev:Dynamic;
	
	public function new() 
	{
		super();
		
		graphics.beginFill(0x0000FF);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
	private var instancePrevX:Int;
	private var instancePrevY:Int;
	public function remove(instancePrev:Dynamic = null):Void {
		
		//remove fog
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
		
		/*
		//remove other obstacles
		trace(Global.level.level[Math.floor(x / Global.elementSize)][Math.floor(y / Global.elementSize)]);
		Global.level.level[Math.floor(x / Global.elementSize)][Math.floor(y / Global.elementSize)] = 0;
		
		instancePrevX = Math.floor(instancePrev.x / Global.elementSize);
		instancePrevY = Math.floor(instancePrev.y / Global.elementSize);
		
		if (Global.level.level[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)] == 3 || Global.level.level[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)] == 103) {
			for (i in 0...Global.blocks.length) {
				if (Global.blocks[i].x == Math.floor(x / Global.elementSize) * Global.elementSize && Global.blocks[i].y == (Math.floor(y / Global.elementSize) + 1) * Global.elementSize && Global.blocks[i] != instancePrev) {
					Global.blocks[i].remove(this);
					break;
				}
			}
			//Global.level.level[Math.floor(y / Global.elementSize) + 1][Math.floor(x / Global.elementSize)].remove(this);
		}
		
		if (Global.level.level[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] == 3 || Global.level.level[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)] == 103) {
			for (i in 0...Global.blocks.length) {
				if (Global.blocks[i].x == Math.floor(x / Global.elementSize) * Global.elementSize && Global.blocks[i].y == (Math.floor(y / Global.elementSize) - 1) * Global.elementSize && Global.blocks[i] != instancePrev) {
					Global.blocks[i].remove(this);
					break;
				}
			}
			//Global.level.level[Math.floor(y / Global.elementSize) - 1][Math.floor(x / Global.elementSize)].remove(this);
		}
		
		if (Global.level.level[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1] == 3 || Global.level.level[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1] == 103) {
			for (i in 0...Global.blocks.length) {
				if (Global.blocks[i].x == (Math.floor(x / Global.elementSize) + 1) * Global.elementSize && Global.blocks[i].y == Math.floor(y / Global.elementSize) * Global.elementSize && Global.blocks[i] != instancePrev) {
					Global.blocks[i].remove(this);
					break;
				}
			}
			//Global.level.level[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) + 1].remove(this);
		}
		
		if (Global.level.level[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1] == 3 || Global.level.level[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1] == 103) {
			for (i in 0...Global.blocks.length) {
				if (Global.blocks[i].x == (Math.floor(x / Global.elementSize) - 1) * Global.elementSize && Global.blocks[i].y == (Math.floor(y / Global.elementSize) - 1) * Global.elementSize && Global.blocks[i] != instancePrev) {
					Global.blocks[i].remove(this);
					break;
				}
			}
			//Global.level.level[Math.floor(y / Global.elementSize)][Math.floor(x / Global.elementSize) - 1].remove(this);
		}
		*/
		Global.blocks.remove(this);
		Global.level.removeChild(this);
	}
}