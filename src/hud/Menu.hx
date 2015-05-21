package hud;
import openfl.display.Sprite;
import openfl.events.*;
import openfl.Lib;
/**
 * ...
 * @author Jesse
 */
class Menu extends Sprite
{

	public function new() 
	{
		super();
		graphics.beginFill(0x000000);
        graphics.drawRect(50, 50, 20, 20);
		addEventListener(MouseEvent.CLICK, openMenu);
	}
	
	function openMenu(e:MouseEvent)
	{
		trace("Hai");
	}
}