package npcs;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Guru extends Sprite
{
	private var frame:Int = 0;
	
	public function new() 
	{
		super();
		
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void {
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		AssetStorage.guruGlow.drawTiles(this.graphics, [0, 0, frame % 40]);
		frame++;
	}
}