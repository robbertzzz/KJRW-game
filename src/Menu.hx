package ;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Menu extends Sprite
{
	private var buttons:Array<Button> = new Array();
	public function new() 
	{
		super();
		
		buttons[0] = new Button(0x0000FF);
		buttons[0].x = Lib.current.stage.stageWidth * 0.5 - buttons[0].width * 0.5;
		buttons[0].y = 100;
		buttons[0].addEventListener(MouseEvent.CLICK, buttons[0].newGame);
		addChild(buttons[0]);
		
		buttons[1] = new Button(0x00FF00);
		buttons[1].x = Lib.current.stage.stageWidth * 0.5 - buttons[1].width * 0.5;
		buttons[1].y = 150;
		//buttons[1].addEventListener(MouseEvent.CLICK, buttons[1].newGame);
		addChild(buttons[1]);
		
		buttons[2] = new Button(0x00FF00);
		buttons[2].x = Lib.current.stage.stageWidth * 0.5 - buttons[2].width * 0.5;
		buttons[2].y = 200;
		//buttons[2].addEventListener(MouseEvent.CLICK, buttons[2].newGame);
		addChild(buttons[2]);
		
		buttons[3] = new Button(0xFF0000);
		buttons[3].x = Lib.current.stage.stageWidth * 0.5 - buttons[3].width * 0.5;
		buttons[3].y = 364;
		buttons[3].addEventListener(MouseEvent.CLICK, buttons[3].closeGame);
		addChild(buttons[3]);
	}
	
}