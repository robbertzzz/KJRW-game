package stats;
import openfl.display.Sprite;
import openfl.events.*;
import openfl.Lib;
import HttpConnecter;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class TraceControls extends Sprite
{
	var controls:Array<Array<Dynamic>> = new Array();
	
	public function new() 
	{
		super();
		addEventListener(Event.ENTER_FRAME, update);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, endGame);
	}
	
	private function update(e:Event) {
		controls.push([Global.left, Global.right, Global.up, Global.down, Global.jump, Global.mouseDown, Global.mouseX, Global.mouseY]);
	}
	
	private function endGame(e:KeyboardEvent) {
		if (e.keyCode == 27) {
			HttpConnector.sendData(controls);
			trace("data saved");
		}
	}
}