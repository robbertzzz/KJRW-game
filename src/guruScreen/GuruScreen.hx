package guruScreen;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class GuruScreen extends Sprite
{
	var guru:Guru;
	
	public function new() 
	{
		super();
		
		AssetStorage.guruBackground.drawTiles(this.graphics, [0, 0, 0]);
		guru = new Guru();
		addChild(guru);
	}
	
}