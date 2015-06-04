package blocks ;

import openfl.display.*;
import Math;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Block extends Sprite
{
	public var blockWidth:Float;
	public var blockHeight:Float;
	public var type:String = "Block";
	private var spriteIndex:Int = 6;
	public function new(x, y, level:Array<Array<Int>>) 
	{
		super();
		this.x = x;
		this.y = y;
		
		var xminus:Bool = false;
		var xplus:Bool = false;
		var yminus:Bool = false;
		var yplus:Bool = false;
		
		//trace(Global.levelWidth / 12 + " " + x / 12 + " " + Global.levelHeight / 12 + " " + y / 12);
		
		if (Math.floor(y / 12) > 0) {
			if (level[Math.floor(y / 12) - 1][Math.floor(x / 12)] == 1) {
				yminus = true;
			}
		}
		
		if (Math.floor(y / 12) < Math.floor(Global.levelHeight / 12) - 1) {
			if (level[Math.floor(y / 12) + 1][Math.floor(x / 12)] == 1) {
				yplus = true;
			}
		}
		
		if (Math.floor(x / 12) > 0) {
			if (level[Math.floor(y / 12)][Math.floor(x / 12) - 1] == 1) {
				xminus = true;
			}
		}
		
		if (Math.floor(x / 12) < Math.floor(Global.levelWidth / 12) - 1) {
			if (level[Math.floor(y / 12)][Math.floor(x / 12) + 1] == 1) {
				xplus = true;
			}
		}
		
		if (!xminus && !yminus && xplus && yplus) {
			spriteIndex = 0;
		}
		if (xminus && !yminus && xplus && yplus) {
			spriteIndex = 1;
		}
		if (xminus && !yminus && !xplus && yplus) {
			spriteIndex = 2;
		}
		if (!xminus && yminus && xplus && yplus) {
			spriteIndex = 3;
		}
		if (xminus && yminus && xplus && yplus) {
			spriteIndex = 4;
		}
		if (xminus && yminus && !xplus && yplus) {
			spriteIndex = 5;
		}
		if (!xminus && yminus && xplus && !yplus) {
			spriteIndex = 6;
		}
		if (xminus && yminus && xplus && !yplus) {
			spriteIndex = 7;
		}
		if (xminus && yminus && !xplus && !yplus) {
			spriteIndex = 8;
		}
		if (!xminus && yminus && !xplus && yplus) {
			spriteIndex = 9;
		}
		if (xminus && !yminus && xplus && !yplus) {
			spriteIndex = 10;
		}
		if (!xminus && !yminus && xplus && !yplus) {
			spriteIndex = 11;
		}
		if (xminus && !yminus && !xplus && !yplus) {
			spriteIndex = 12;
		}
		if (!xminus && !yminus && !xplus && yplus) {
			spriteIndex = 13;
		}
		if (!xminus && yminus && !xplus && !yplus) {
			spriteIndex = 14;
		}
		
		AssetStorage.blocks.drawTiles (this.graphics, [0, 0, spriteIndex]);
		
		blockWidth = Global.elementSize;
		blockHeight = Global.elementSize;
	}
	
	public function remove() {
		trace("wrong block!");
	}
}