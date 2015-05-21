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
		createButton();
	}
	
	function createButton()
	{
		graphics.beginFill(0x000000);
        graphics.drawRect(50, 50, 20, 20);
		addEventListener(MouseEvent.CLICK, openMenu);
	}
	
	function openMenu(e:MouseEvent)
	{
		graphics.beginFill(0x000000);
        graphics.drawRect(50, 200, 200, 50);
		removeEventListener(MouseEvent.CLICK, openMenu);
		addEventListener(MouseEvent.CLICK, closeMenu);
	}
	
	function closeMenu(e:MouseEvent)
	{
		graphics.clear();
		createButton();
		removeEventListener(MouseEvent.CLICK, closeMenu);
	}
}