package ;

import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.system.System;

import platform.*;
import delegating.Delegation;

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
		//Global.level = new Delegation();
		//Global.level = new Tutorial();
		//Global.level = new Platform1();
		Global.level = new Platform2();
		Global.main.addChild(Global.level);
		Global.main.addChild(new hud.HUD());
		Global.main.removeChild(Global.main.menu);
		
	}
	
	public function closeGame(e:MouseEvent):Void {
		System.exit(0);
	}
	
}