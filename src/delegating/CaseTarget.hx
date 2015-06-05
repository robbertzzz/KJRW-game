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
<<<<<<< HEAD
	private var type1:Int;
	private var type2:Int;
	private var highlight:Bool = false;
	public var done:Bool = false;
	public function new(x, y, type1, type2) 
=======
	
	public function new(x, y) 
>>>>>>> origin/master
	{
		super();
		
		this.x = x;
		this.y = y;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private var distance:Float;
	
	private function update(e:Event):Void {
		if(Global.level.currentCase != null && !taken) {
			distance = Math.sqrt((Global.level.currentCase.x - x) * (Global.level.currentCase.x - x) + (Global.level.currentCase.y - y) * (Global.level.currentCase.y - y)) - Global.elementSize;
			if (distance <= size * Global.elementSize) {
				zoom = 1.5;
			} else {
				zoom = 1;
			}
		}
		
		draw();
	}
	
	private function draw() {
		graphics.clear();
<<<<<<< HEAD
		if (highlight==true || done==true)
		{
		AssetStorage.caseTargets.drawTiles(this.graphics, [ -26.5, -26.5, type2, ]);
		}
=======
>>>>>>> origin/master
		
		graphics.beginFill(0xFF0000);
        //graphics.drawCircle(0, 0, size * zoom * Global.elementSize);
	}
}