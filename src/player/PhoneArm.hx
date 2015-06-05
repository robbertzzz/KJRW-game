package player;
import openfl.events.Event;
import weapons.PhoneCable;
import weapons.PhoneHorn;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class PhoneArm extends Arm
{
	private var throwing:Bool = false;
	public var frame:Float = 0;
	private var init:Bool = false;
	private var phoneCable:PhoneCable;
	public var phoneHorn:PhoneHorn;
	public var firstThrow:Bool = false;
	
	public function new(leftRight:Bool) 
	{
		super(leftRight);
		
		startX += 12;
		startY += 2;
		
		graphics.clear();
		//update(null);
	}
	
	private function startThrowing():Void {
		if (!throwing) {
			throwing = true;
		}
	}
	
	
	override private function update(e:Event) {
		if (!init) {
			phoneCable = new PhoneCable();
			Global.level.addChild(phoneCable);
			trace(phoneCable);
			init = true;
		}
		
		followMouse();
		
		if (Global.mouseDown && !firstThrow) {
			startThrowing();
			firstThrow = true;
		}
		
		/*if (!Global.mouseDown && throwing == false) {
			firstThrow = false;
		}*/
		
		if (frame == 8) {
			phoneHorn = new PhoneHorn(Global.level.player.returnXY()[0] + 20, Global.level.player.returnXY()[1] + 20);
			Global.level.addChild(phoneHorn);
		}
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		
		if (throwing) {
			frame+= 1;
		}
		
		rotation += 90;
		
		x += 0;
		y += 0;
		
		var yFrameCorrect = 0;
		if (frame > 1 && frame < 9) {
			yFrameCorrect = 5;
		}
		if (frame == 11) {
			yFrameCorrect = -2;
		}
		AssetStorage.phoneArm.drawTiles(this.graphics, [-15, -30 - yFrameCorrect, Math.floor(frame)]);
		
		if (frame >= 11) {
			//frame = 0;
			throwing = false;
		}
	}
	
	public function remove():Void {
		phoneCable.remove();
		if (phoneHorn != null) {
			phoneHorn.remove();
		}
		removeEventListener(Event.ENTER_FRAME, update);
		this.parent.removeChild(this);
	}
}