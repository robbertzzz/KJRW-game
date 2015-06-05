package guruScreen;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Guru extends Sprite
{
	private var frame:Int = 0;
	private var appearing:Bool = true;
	
	public function new() 
	{
		super();
		x = 0;
		y = 0;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void {
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		if(appearing) {
			AssetStorage.guruAppearing.drawTiles(this.graphics, [0, 0, frame]);
			frame++;
			if (frame == 65) {
				appearing = false;
				frame = 0;
			}
		} else {
			AssetStorage.guruFloating.drawTiles(this.graphics, [0, 0, frame % 105]);
			frame++;
		}
	}
}