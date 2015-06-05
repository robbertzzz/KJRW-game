package guruScreen;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class GuruScreen extends Sprite
{
	var guru:Guru;
	var button:Button;
	
	public function new() 
	{
		super();
		
		AssetStorage.guruBackground.drawTiles(this.graphics, [0, 0, 0]);
		guru = new Guru();
		addChild(guru);
		button = new Button();
		addChild(button);
	}
	
	public function remove():Void {
		button.remove();
		button = null;
		guru.remove();
		guru = null;
		Global.guruScreen = null;
		Global.pause = false;
		this.parent.removeChild(this);
	}
}