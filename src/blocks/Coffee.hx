package blocks;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Coffee extends Sprite
{

	public function new() 
	{
		super();
		
		AssetStorage.coffee.drawTiles(this.graphics, [-17, -10, 0]);
		
		/*graphics.beginFill(0xFFDD22);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);*/
	}
	
}