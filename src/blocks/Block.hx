package blocks ;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Block extends Sprite
{
	public var blockWidth:Float;
	public var blockHeight:Float;
	public function new() 
	{
		super();
		
		graphics.beginFill(0xFF0000);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
		/*blockWidth = width;
		blockHeight = height;
		//back
		//addChild(new SideWall(0, 0, 0xFF0000));
		//left side
		addChild(new SideWall(0, 90, 0x000000));
		//right side
		addChild(new SideWall(0, 90, 0x000000, Global.elementSize));
		//top
		addChild(new SideWall(90, 0, 0x000000, 0, 0, Global.elementSize));
		//bottom
		addChild(new SideWall(90, 0, 0x000000, 0, Global.elementSize, Global.elementSize));
		//front
		addChild(new SideWall(0, 0, 0xFF0000, 0, 0, Global.elementSize));*/
	}
}