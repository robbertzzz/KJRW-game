package guruScreen;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Button extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0xFF0000);
		graphics.drawRect(0, 0, 20, 20);
		
		x = 475;
		y = 5;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event) {
		if (Global.mouseDown && Global.mouseX >= x && Global.mouseX <= x + width && Global.mouseY >= y && Global.mouseY <= y + height) {
			Global.guruScreen.remove();
		}
	}
	
	public function remove():Void {
		removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	}
}