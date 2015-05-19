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
	
	public function new() 
	{
		super();
		
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, 50, 50);
		
		addEventListener(MouseEvent.CLICK, hit);
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function hit(e:MouseEvent) {
		health -= 20;
		if (health <= 0) {
			death();
		}
	}
	
	private function death() {
		this.removeEventListener(MouseEvent.CLICK, hit);
		this.removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	}
	
	private function update(e:Event):Void {
		
	}
}