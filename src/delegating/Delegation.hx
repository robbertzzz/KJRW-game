package delegating;

import lime.project.Platform;
import openfl.display.Sprite;
import motion.Actuate;
import openfl.Lib;
import openfl.events.Event;
import platform.Platform1;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Delegation extends Sprite
{
	public var currentCase:Case;
	public var categories:Array<Dynamic> = new Array();
	public var delegated:Int = 0;
	
	public function new() 
	{
		super();
		
		categories[0] = new CaseTarget(Lib.current.stage.stageWidth * 0.5 - 80, 170);
		addChild(categories[0]);
		categories[1] = new CaseTarget(Lib.current.stage.stageWidth * 0.5, 140);
		addChild(categories[1]);
		categories[2] = new CaseTarget(Lib.current.stage.stageWidth * 0.5 + 80, 170);
		addChild(categories[2]);
		categories[3] = new CaseTarget(Lib.current.stage.stageWidth * 0.5 - 100, Lib.current.stage.stageHeight - 120);
		addChild(categories[3]);
		categories[4] = new CaseTarget(Lib.current.stage.stageWidth * 0.5 + 100, Lib.current.stage.stageHeight - 120);
		addChild(categories[4]);
		
		categories[5] = new ChooseCase(Lib.current.stage.stageWidth * 0.5, Lib.current.stage.stageHeight - 120 - Global.elementSize);
		addChild(categories[5]);
		
		addChild(new Case(Lib.current.stage.stageWidth - 50, 80));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 130));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 180));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 230));
		addChild(new Case(Lib.current.stage.stageWidth - 50, 280));
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void {
		if (delegated == 5) {
			Global.main.level = new Platform1();
			Global.main.addChild(Global.main.level);
			Global.level = Global.main.level;
			removeEventListener(Event.ENTER_FRAME, update);
			this.parent.removeChild(this);
		}
	}
}