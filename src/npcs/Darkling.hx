package npcs;

import openfl.display.Sprite;
import openfl.events.*;
import openfl.Lib;


/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Darkling extends Sprite
{
	private var health:Int = 100;
	private var frame:Int = 0;
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function hit() {
		health -= 20;
		if (health <= 0) {
			die();
		}
	}
	
	private function update(e:Event):Void {
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		AssetStorage.ghostYawning.drawTiles(this.graphics, [0, 0, frame % 130]);
		frame++;
	}
	
	private function die() {
		removeEventListener(Event.ENTER_FRAME, update);
		addEventListener(Event.ENTER_FRAME, updatePoef);
	}
	
	private function death() {
		removeEventListener(Event.ENTER_FRAME, updatePoef);
		Global.level.removeChild(this);
	}
	
	private function updatePoef(e:Event) {
		trace("Poef");
		death();
	}
}