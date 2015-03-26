package blocks ;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Coin extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0xFFDD22);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
		
		
	}
	
}