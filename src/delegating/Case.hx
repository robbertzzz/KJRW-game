package delegating;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import motion.Actuate;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Case extends Sprite
{
	private var zoom:Float = 1;
	private var opacity:Float = 1;
	private var startX:Float;
	private var startY:Float;
	private var type:Int;
	
	public function new(x, y, type) 
	{
		super();
		this.type = type;
		this.x = startX = x;
		this.y = startY = y;
		
		addEventListener(MouseEvent.MOUSE_DOWN, startMove);
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function startMove(e:MouseEvent):Void {
		addEventListener(MouseEvent.MOUSE_UP, stopMove);
		removeEventListener(MouseEvent.MOUSE_DOWN, startMove);
		Global.level.currentCase = this;
		//zoom = 1.5;
		opacity = 0.5;
		startDrag();
	}
	
	private var distance:Float;
	private var onItem:Bool;
	private var item:Int;
	
	private function stopMove(e:MouseEvent):Void {
		stopDrag();
		//zoom = 1;
		Global.level.currentCase = null;
		opacity = 1;
		removeEventListener(MouseEvent.MOUSE_UP, stopMove);
		
		onItem = false;
		for(i in 0...Global.level.categories.length) {
			distance = Math.sqrt((Global.level.categories[i].x - x) * (Global.level.categories[i].x - x) + (Global.level.categories[i].y - y) * (Global.level.categories[i].y - y)) - Global.elementSize;
			if (distance <= Global.level.categories[i].size * Global.elementSize && !Global.level.categories[i].taken) {
				onItem = true;
				item = i;
				Global.level.categories[i].taken = true;
				Global.level.delegated++;
				break;
			}
		}
		
		if (!onItem) {
			Actuate.tween(this, 0.5, {x: startX, y:startY } ).onComplete(newDrag);
		} else {
			Global.level.categories[item].zoom = 1;
			opacity = 1;
			draw();
			removeEventListener(Event.ENTER_FRAME, update);
			Actuate.tween(this, 0.5, { x: Global.level.categories[item].x, y:Global.level.categories[item].y } );

		}
	}
	
	private function newDrag():Void {
		addEventListener(MouseEvent.MOUSE_DOWN, startMove);
	}
	
	private function update(e:Event):Void {

		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		AssetStorage.incomingMessages.drawTiles(this.graphics, [-21, -21, type, ]);
	}
}