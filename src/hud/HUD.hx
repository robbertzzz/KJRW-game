package hud;
import openfl.display.Sprite;
import openfl.events.*;
import openfl.Lib;
/**
 * ...
 * @author Jesse
 */
class HUD extends Sprite
{
	var menuButton:MenuButton = new MenuButton();
	public function new() 
	{
		super();
		drawHealth();
		drawMenuButton();
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event) 
	{
		graphics.clear;
		drawHealth();
		
	}
	
	function drawHealth()
	{
		graphics.beginFill(0x000000);
        graphics.drawRect(Lib.current.stage.stageWidth-11, 0, 10, 5);
		
		graphics.beginFill(0xFFDD22);
		graphics.drawRect(Lib.current.stage.stageWidth-11, 0, Global.health/10, 5);
	}
	
	
	function drawMenuButton()
	{
		
		Global.main.addChild(menuButton);
	}
	

	
}