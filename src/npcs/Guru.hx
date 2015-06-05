package npcs;

import guruScreen.GuruScreen;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Guru extends Sprite
{
	private var frame:Int = 0;
	private var showingGuru:Bool = false;
	
	public function new() 
	{
		super();
		
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void {
		if (Math.abs((Global.level.player.returnXY()[0] + 0.5 * Global.level.player.width) - (x + 0.5 * width)) < 10 && Math.abs((Global.level.player.returnXY()[0] + 0.5 * Global.level.player.width) - (x + 0.5 * width)) < 30) {
			showGuruScreen();
		}
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		AssetStorage.guruGlow.drawTiles(this.graphics, [0, 0, frame % 40]);
		frame++;
	}
	
	private function showGuruScreen():Void {
		if(!showingGuru) {
			Global.guruScreen = new GuruScreen();
			Global.main.addChild(Global.guruScreen);
			showingGuru = true;
		}
	}
}