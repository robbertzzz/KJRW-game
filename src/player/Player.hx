package player ;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

import player.Arm;
import player.Body;
import player.Head;
import player.Leg;

import blocks.Block;
import blocks.Coin;
import blocks.Fog;
import blocks.HangBlock;
import blocks.Obstacle;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Player extends Sprite
{
	private var xSpeed:Float = 0;
	private var ySpeed:Float = 0;
	private var maxXSpeed:Float = (5/16) * Global.elementSize;
	private var maxYSpeed:Float = (11 / 16) * Global.elementSize;
	private var maxFallSpeed:Float = (20 / 16) * Global.elementSize;
	private var i:Int;
	private var gravity:Float = 0.75 * (1/16) * Global.elementSize;
	private var isStanding:Bool = false;
	
	public var playerWidth:Float = 2 * Global.elementSize;
	public var playerHeight:Float = 5 * Global.elementSize;
	
	private var legs:Array<Leg> = new Array();
	public var arms:Array<Arm> = new Array();
	private var body:Body;
	private var head:Head;
	

	public function new() 
	{
		super();
		
		frankenstein();
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function returnXY():Array<Float> {
		return [x, y];
	}
	
	private function frankenstein():Void {
		arms[0] = new Arm(false);
		addChild(arms[0]);
		
		legs[0] = new Leg(false);
		addChild(legs[0]);
		
		body = new Body();
		addChild(body);
		
		head = new Head();
		addChild(head);
		
		legs[1] = new Leg(true);
		addChild(legs[1]);
		
		arms[1] = new Arm(true);
		addChild(arms[1]);
	}
	
	private function update(e:Event):Void {
		move();
		moveView();
	}
	
	
	
	private var moveViewX:Float = 0;
	private var moveViewY:Float = 0;
	
	private function moveView():Void {
		if (Lib.current.stage.stageWidth < Global.levelWidth) {
			if (x + playerWidth * 0.5 > Lib.current.stage.stageWidth * 0.5 && x + playerWidth * 0.5 < Global.levelWidth - Lib.current.stage.stageWidth * 0.5) {
				moveViewX = Lib.current.stage.stageWidth * 0.5 - x - playerWidth * 0.5;
			} else if (x - playerWidth * 0.5 > Lib.current.stage.stageWidth * 0.5) {
				moveViewX = Lib.current.stage.stageWidth - Global.levelWidth;
			} else if (x - playerWidth * 0.5 < Global.levelWidth - Lib.current.stage.stageWidth * 0.5) {
				moveViewX = 0;
			}
		}
		
		if (Lib.current.stage.stageHeight < Global.levelHeight) {
			if (y + playerHeight * 0.5 > Lib.current.stage.stageHeight * 0.5 && y + playerHeight * 0.5 < Global.levelHeight - Lib.current.stage.stageHeight * 0.5) {
				moveViewY = Lib.current.stage.stageHeight * 0.5 - y - playerHeight * 0.5;
			} else if (y - playerHeight * 0.5 > Lib.current.stage.stageHeight * 0.5) {
				moveViewY = Lib.current.stage.stageHeight - Global.levelHeight;
			} else if (y - playerHeight * 0.5 < Global.levelHeight - Lib.current.stage.stageHeight * 0.5) {
				moveViewY = 0;
			}
		}
		
		Global.level.move(moveViewX, moveViewY);
	}
	
	
	
	
	/////////////////////////////////////
	//            Movement             //
	/////////////////////////////////////
	
	private var againstWallLeft:Bool;	//for collision checking
	private var againstWallRight:Bool;	//Idem
	private var onTheGround:Bool;		//Idem
	private var againstTheCeiling:Bool;	//Idem
	
	private var wallBlockLeft:Int;		//the index of the colliding wall block on the left in the Global.block array
	private var wallBlockRight:Int;		//the index of the colliding wall block on the right in the Global.block array
	private var groundBlock:Int;		//the index of the colliding ground block
	private var ceilingBlock:Int;		//the index of the colliding ceiling block
	
	private function move():Void {
		xSpeed = 0;
		
		//needs to be in front of the collision checking, because alse the collision checking will be a frame behind and cause bugs
		if (Global.up) {
			if (isStanding) {
				startJumping();
			}
		}
		
		checkCollision();
		
		if (Global.left) {
			//if the player is against a wall on the left side, stop against it, else, move
			if (againstWallLeft) {
				xSpeed = 0;
				x = Global.blocks[wallBlockLeft].x + Global.blocks[wallBlockLeft].width;
			} else { 
				xSpeed -= maxXSpeed;
			}
		}
		
		if (Global.right) {
			//if the player is against a wall on the right side, stop against it, else, move
			if (againstWallRight) {
				xSpeed = 0;
				x = Global.blocks[wallBlockRight].x - playerWidth;
			} else { 
				xSpeed += maxXSpeed;
			}
		}
		
		
		//fix for bug when standing against the wall
		if (Global.left && Global.right) {
			xSpeed = 0;
		}
		
		jumpController();
		if (Global.shift) {
			xSpeed *= 0.4;
		}
		x += xSpeed;
		y += ySpeed;
		
		checkCoin();
	}
	
	
	//variables: againstWallLeft, againstWallRight, againstTheCeiling, onTheGround: Bool
	//variables: wallBlockLeft, wallBlockRight, ceilingBlock, groundBlock: Int (index in Global.blocks array)
	//Collision checking, changes the values of corresponding variables instead of returning them (8 variables is a lot)
	private function checkCollision():Void {
		againstWallLeft = againstWallRight = againstTheCeiling = onTheGround = false;
		
		for (i in 0...Global.blocks.length) {
			//trace("width: " + Global.blocks[i].blockWidth + ", height: " + Global.blocks[i].blockHeight);
			//collision on the left side
			if (	   Global.blocks[i].y < y + playerHeight
					&& Global.blocks[i].y > y - 16 //Global.blocks[i].height
					&& (Global.blocks[i].x + 16 /*Global.blocks[i].width*/) >= x - maxXSpeed
					&& Global.blocks[i].x < x - maxXSpeed) {
				againstWallLeft = true;
				wallBlockLeft = i;
			}
			
			//collision on the right side
			if (	   Global.blocks[i].y < y + playerHeight
					&& Global.blocks[i].y > y - 16 //Global.blocks[i].height
					&& (Global.blocks[i].x + 16 /*Global.blocks[i].width*/) > x + maxXSpeed
					&& Global.blocks[i].x <= x + playerWidth + maxXSpeed) {
				againstWallRight = true;
				wallBlockRight = i;
			}
			
			//collision on the top side
			if (	   Global.blocks[i].y + 16 /*Global.blocks[i].height*/ >= y + ySpeed + gravity
					&& Global.blocks[i].y < y
					&& Global.blocks[i].x + 16 /*Global.blocks[i].width*/ > x
					&& Global.blocks[i].x < x + playerWidth) {
				againstTheCeiling = true;
				ceilingBlock = i;
			}
			
			//collision on the bottom side
			if (	   Global.blocks[i].y <= y + ySpeed + gravity + playerHeight
					&& Global.blocks[i].y > y
					&& Global.blocks[i].x > x - 16 //Global.blocks[i].width
					&& Global.blocks[i].x < x + playerWidth) {
				onTheGround = true;
				groundBlock = i;
			}
		}
	}
	
	//start a jump
	private function startJumping():Void {
		ySpeed = -maxYSpeed;
		isStanding = false;
	}
	
	private function jumpController():Void {
		if (!onTheGround) {
			isStanding = false;
		}
		
		//if it's on the ground, land, else, fall faster.
		//if it's against the ceiling, stop moving up. Trace ouch.
		if (onTheGround || againstTheCeiling) {
			if(onTheGround) {
				//LAND
				ySpeed = 0;
				y = Global.blocks[groundBlock].y - playerHeight;
				isStanding = true;
			}
			if(againstTheCeiling) {
				ySpeed = 0;
				y = Global.blocks[ceilingBlock].y + 16 /*Global.blocks[ceilingBlock].height;*/;
			}
		} else { 
			ySpeed += gravity;
			if (ySpeed > maxFallSpeed) {
				ySpeed = maxFallSpeed;
			}
		}
	}
	
	private var tempCoin:Coin;
	private function checkCoin():Void {
		i = 0;
		while (i < Global.coins.length) {
			tempCoin = Global.coins[i];
			if (	   x < tempCoin.x + tempCoin.width
					&& x > tempCoin.x - playerWidth
					&& y < tempCoin.y + tempCoin.height
					&& y > tempCoin.y - playerHeight) {
				trace("You ate a coin!!");
				Global.level.level[Math.floor(tempCoin.y / Global.elementSize)][Math.floor(tempCoin.x / Global.elementSize)] -= 2;
				Global.coins.remove(tempCoin);
				tempCoin.parent.removeChild(tempCoin);
				i--;
			}
			i++;
		}
	}
}