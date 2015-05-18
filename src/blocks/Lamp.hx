package blocks ;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Lamp extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0xFF00FF);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
	}
	
}