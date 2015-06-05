package delegating;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class CaseTarget extends Sprite
{
	private var zoom:Float = 1;
	private var size:Float = 1;
	public var taken:Bool = false;

	private var type1:Int;
	private var type2:Int;
	private var highlight:Bool = false;
	public var done:Bool = false;
	
	public function new(x, y, type1, type2) 
	{
		super();
		
		this.x = x;
		this.y = y;
		this.type1 = type1;
		this.type2 = type2;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private var distance:Float;
	
	private function update(e:Event):Void {
		if(Global.level.currentCase != null && !taken) {
			distance = Math.sqrt((Global.level.currentCase.x - x) * (Global.level.currentCase.x - x) + (Global.level.currentCase.y - y) * (Global.level.currentCase.y - y)) - Global.elementSize;
			if (distance <= size * Global.elementSize) {
				highlight = true;
			} else {
				highlight = false;
			}
		}
		
		draw();
	}
	
	private function draw() {
		graphics.clear();

		if (highlight==true || done==true)
		{
			if (done) {
				AssetStorage.caseTargets.drawTiles(this.graphics, [ -26.5, -26.5, type1 * 2 + 1]);
			} else {
				AssetStorage.caseTargets.drawTiles(this.graphics, [ -26.5, -26.5, type1 * 2]);
			}
		
		}
		else
		{
		AssetStorage.basicCaseTargets.drawTiles(this.graphics, [ -26.5, -26.5, type1]);
		}
	}
}