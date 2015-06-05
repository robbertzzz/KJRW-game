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
	private var type:Int;
	private var highlight:Int = 0;
	
	public function new(x, y, type) 
	{
		super();
		this.type = type;
		this.x = x;
		this.y = y;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private var distance:Float;
	
	private function update(e:Event):Void {
		if(Global.level.currentCase != null && !taken) {
			distance = Math.sqrt((Global.level.currentCase.x - x) * (Global.level.currentCase.x - x) + (Global.level.currentCase.y - y) * (Global.level.currentCase.y - y)) - Global.elementSize;
			if (distance <= size * Global.elementSize) {
				highlight = 1;
			} else {
				highlight =0;
			}
		}
		
		draw();
	}
	
	private function draw() {
		graphics.clear();
		
		AssetStorage.caseTargets.drawTiles(this.graphics, [-26.5, -26.5, type+highlight, ]);
	}
}