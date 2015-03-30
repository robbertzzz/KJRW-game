package npcs;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;


/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Darkling extends Sprite
{
	private var xSpeed:Float = 0;
	private var ySpeed:Float = 0;
	private var maxSpeed:Float = 5;
	private var i:Int;
	
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event):Void {
		chase();
		move();
		draw();
	}
	
	private var playerDistance:Float;
	private var playerDistanceX:Float;
	private var playerDistanceY:Float;
	private var playerDistanceXabs:Float;
	private var playerDistanceYabs:Float;
	private var levelY:Int;
	private var levelX:Int;
	
	private var ii:Float;
	
	private var forMax:Int;
	private var canSeePlayer:Bool;
	private var gridType:Int;
	//Check if the darkling can see the player. If so, start chasing him.
	private function chase():Void {
		// Make an imaginary line, check for every Global.elementSize pixels if there is a block in the way. If not, make a move towards player.
		
		// Check the distance
		playerDistanceX = /*Global.level.player.x*/ Lib.current.stage.mouseX + Math.abs(Global.level.x) - (x + 0.5 * width);
		playerDistanceXabs = Math.abs(playerDistanceX);
		playerDistanceY = /*Global.level.player.y*/ Lib.current.stage.mouseY + Math.abs(Global.level.y) - (y + 0.5 * height);
		playerDistanceYabs = Math.abs(playerDistanceY);
		//for the entire distance, check if there are any blocks in the way
		playerDistance = Math.sqrt(playerDistanceX * playerDistanceX - playerDistanceY * playerDistanceY);
		
		//trace(playerDistanceY);
		
		canSeePlayer = true;
		
		if (playerDistanceXabs > playerDistanceYabs) {
			for (i in 0...(Math.floor(playerDistanceXabs / 16) * 16)) { //Math.abs(x) = i
				ii = (playerDistanceY / playerDistanceX) * i; //y = ii
				if (playerDistanceX < 0) {
					ii *= -1;
				}
				levelY = Math.floor(ii / 16) + Math.floor(y / 16);
				levelX = Math.floor(i / 16) + Math.floor(x / 16);
				if (playerDistanceX < 0) {
					levelX = -Math.floor(i / 16) + Math.floor(x / 16);
				}
				if (Global.level.level[levelY][levelX] > 0 && Global.level.level[levelY][levelX] != 100) {
					canSeePlayer = false;
					break;
				}
			}
		} else {
			for (i in 0...(Math.floor(playerDistanceYabs / 16) * 16)) { //Math.abs(y) = i
				ii = (playerDistanceX / playerDistanceY) * i; //x = ii
				if (playerDistanceY < 0) {
					ii *= -1;
				}
				levelX = Math.floor(ii / 16) + Math.floor(x / 16);
				levelY = Math.floor(i / 16) + Math.floor(y / 16);
				if (playerDistanceY < 0) {
					levelY = -Math.floor(i / 16) + Math.floor(y / 16);
				}
				if (Global.level.level[levelY][levelX] > 0 && Global.level.level[levelY][levelX] != 100) {
					canSeePlayer = false;
					break;
				}
			}
		}
		
		trace("Global.level.level[" + levelY + "][" + levelX + "] = " + Global.level.level[levelY][levelX] + " so canSeePlayer = " + canSeePlayer);
		
		if (canSeePlayer) {
			//xSpeed = maxSpeed * playerDistanceX / playerDistance;
			//ySpeed = maxSpeed * playerDistanceY / playerDistance;
		} else {
			//xSpeed = 0;
			//ySpeed = 0;
		}
	}
	
	private function move():Void {
		x += xSpeed;
		y += ySpeed;
	}
	
	private function draw():Void {
		graphics.clear();
		graphics.beginFill(0x000000);
        graphics.drawRect(0, 0, 3 * Global.elementSize, 5 * Global.elementSize);
	}
}