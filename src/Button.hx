package ;

import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.system.System;

import levels.Level1;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Button extends Sprite
{

	public function new(color:Dynamic) 
	{
		super();
		
		graphics.beginFill(color);
        graphics.drawRect(0, 0, 100, 16);
	}
	
	public function newGame(e:MouseEvent):Void {
		Global.main.level = new Level1();
		Global.main.addChild(Global.main.level);
		Global.level = Global.main.level;
		Global.main.removeChild(Global.main.menu);
	}
	
	public function closeGame(e:MouseEvent):Void {
		System.exit(0);
	}
	
}