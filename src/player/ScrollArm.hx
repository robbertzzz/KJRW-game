package player;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class ScrollArm extends Arm
{
	private var frame:Int = 0;
	private var hitting:Bool = false;
	
	public function new(leftRight:Bool)
	{
		super(leftRight);
		
		startX += 12;
		
		graphics.clear();
		
		//update(null);
	}
	
	private function startHitting():Void {
		if (!hitting) {
			hitting = true;
		}
	}
	
	private function hit():Void {
		// x+64, y+6
		var mouseDistanceX = Global.mouseX - (Global.level.returnXY()[0] + Global.level.player.x + x);
		var mouseDistanceY = Global.mouseY - (Global.level.returnXY()[1] + Global.level.player.y + y);
		var mouseDistance = Math.sqrt(mouseDistanceX * mouseDistanceX + mouseDistanceY * mouseDistanceY);
		var hitX = 64 * (mouseDistanceX / mouseDistance);
		var hitY = 64 * (mouseDistanceY / mouseDistance);
		var hitXabs = Global.level.player.x + x + hitX;
		var hitYabs = Global.level.player.y + y + hitY;
		
		try(removeBlock(0, 0, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(12, 0, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(-12, 0, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(0, 12, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(0, -12, hitXabs, hitYabs)) catch (e:Dynamic) { };
		try(removeBlock(12, 12, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(-12, 12, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(-12, -12, hitXabs, hitYabs)) catch(e:Dynamic) {};
		try(removeBlock(12, -12, hitXabs, hitYabs)) catch (e:Dynamic) { };
		
		for (i in 0...Global.npcs.length) {
			if (Global.npcs[i].x <= hitXabs && Global.npcs[i].x + Global.npcs[i].width >= hitXabs && Global.npcs[i].y <= hitYabs && Global.npcs[i].y + Global.npcs[i].y >= hitYabs) {
				Global.npcs[i].hit();
			}
		}
	}
	
	private function removeBlock(plusX, plusY, hitXabs, hitYabs):Void {
		if (Global.level.level[Math.floor((hitYabs + plusY) / 12)][Math.floor((hitXabs + plusX) / 12)] == 3 || Global.level.level[Math.floor((hitYabs + plusY) / 12)][Math.floor(hitXabs / 12)] == 103) {
			var index = 0;
			while (Math.floor(Global.blocks[index].x / 12) != Math.floor((hitXabs + plusX) / 12) || Math.floor(Global.blocks[index].y / 12) != Math.floor((hitYabs + plusY) / 12)) {
				index++;
			}
			
			Global.level.level[Math.floor(Global.blocks[index].y / 12)][Math.floor(Global.blocks[index].x / 12)] -= 3;
			Global.blocks[index].remove();
		}
	}
	
	override private function update(e:Event):Void {
		followMouse();
		
		if (Global.mouseDown) {
			startHitting();
		}
		
		if (frame == 20) {
			hit();
		}
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		
		if (hitting) {
			frame++;
		}
		
		rotation += 90;
		x -= 0.5;
		y += 2;
		AssetStorage.scrollArm.drawTiles(this.graphics, [-33.5, -54, frame]);
		
		if (frame == 33) {
			frame = 0;
			hitting = false;
		}
	}
	
	public function remove():Void {
		try {
			removeEventListener(Event.ENTER_FRAME, update);
			this.parent.removeChild(this);
		} catch (e:Dynamic) {
			trace(e);
		}
	}
}