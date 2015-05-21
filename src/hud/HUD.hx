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
	var menu:Menu = new Menu();
	public function new() 
	{
		super();
		drawHealth();
		drawMenu();
		
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
        graphics.drawRect(Lib.current.stage.stageWidth-70, 0, 50, 20);
		
		graphics.beginFill(0xFFDD22);
		graphics.drawRect(Lib.current.stage.stageWidth-70, 0, Global.health/2, 20);
	}
	
	
	function drawMenu()
	{
		
		Global.main.addChild(menu);
	}
	

	
}