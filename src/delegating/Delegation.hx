package delegating;

import lime.project.Platform;
import openfl.display.Sprite;
import motion.Actuate;
import openfl.Lib;
import openfl.events.Event;
import platform.*;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Delegation extends Sprite
{
	public var currentCase:Case;
	public var categories:Array<Dynamic> = new Array<Dynamic>();
	public var delegated:Int = 0;

	public function new() 
	{
		super();
		
		
		
		categories[0] = new CaseTarget(105+26.5, 105+26.5, 0, 0);
		addChild(categories[0]);

		categories[1] = new CaseTarget(119+26.5, 45+26.5, 1, 0);
		addChild(categories[1]);
	
		categories[2] = new CaseTarget(190+26.5, 30+26.5, 2, 0);
		addChild(categories[2]);

		categories[3] = new CaseTarget(255+26.5, 45+26.5, 3, 0);
		addChild(categories[3]);

		categories[4] = new CaseTarget(270+26.5, 105+26.5, 4, 0);
		addChild(categories[4]);
		

		categories[5] = new ChooseCase(180+37.5, 90+37.5, 0, 1);
		addChild(categories[5]);
		

		
		addChild(new Case(Lib.current.stage.stageWidth - 50, 80, 0, 0));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 130, 1, 1));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 180, 2, 2));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 230, 3, 3));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 280, 4, 4));
		
		//addEventListener(Event.ENTER_FRAME, update);
		
		drawScreen();
	}
	
	public function update():Void 
	{
		Global.main.level = new Platform2();
		Global.main.addChild(Global.main.level);
		Global.level = Global.main.level;
		//removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	
	}
	
	private function drawScreen()
	{
		AssetStorage.startscreen.drawTiles(this.graphics, [0, 0, 0, ]);
		
	}
}