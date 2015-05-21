package player ;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Matrix;
import openfl.Lib;

import player.Arm;
import player.Body;
import player.Head;
import player.Leg;

import blocks.*;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Player extends Sprite
{
	private var xSpeed:Float = 0;
	private var ySpeed:Float = 0;
	private var maxXSpeed:Float = 4;
	private var maxYSpeed:Float = 8;
	private var maxFallSpeed:Float = 15;
	private var climbSpeed:Float = 4;
	private var i:Int;
	private var gravity:Float = 0.75 * (1/16) * Global.elementSize;
	private var isStanding:Bool = false;
	
	public var playerWidth:Float = 2 * Global.elementSize;
	public var playerHeight:Float = 5 * Global.elementSize;
	
	private var legs:Array<Leg> = new Array();
	public var arms:Array<Arm> = new Array();
	private var body:Body;
	private var head:Head;
	
	public var hanging:Bool = false;
	
	public var frame:Float = 0;
	

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
		/*arms[0] = new Arm(false);
		addChild(arms[0]);
		
		/*legs[0] = new Leg(false);
		addChild(legs[0]);
		
		body = new Body();
		addChild(body);
		
		head = new Head();
		addChild(head);
		
		legs[1] = new Leg(true);
		addChild(legs[1]);*/
		
		arms[1] = new Arm(true);
		addChild(arms[1]);
	}
	
	private function update(e:Event):Void {
		move();
		moveView();
		draw();
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
	
	private var onTheStairs:Bool = false;       //Whether or not the player should walk up and down the stairs or not
	
	private var wallBlockLeft:Int;		//the index of the colliding wall block on the left in the Global.block array
	private var wallBlockRight:Int;		//the index of the colliding wall block on the right in the Global.block array
	private var groundBlock:Int;		//the index of the colliding ground block
	private var ceilingBlock:Int;		//the index of the colliding ceiling block
	
	private var landOnStairs:Bool = false;  //after a jump or falling from the higher floor, land on the stairs instead of on the ground
	private var rightIsUp:Bool = false;     //are the stairs angled to the right or to the left?
	
	private function move():Void {
		xSpeed = 0;
		
		//needs to be before of the collision checking, because else the collision checking will be a frame behind and cause bugs
		if (Global.jump) {
			if ( (isStanding || onTheStairs) && !hanging) {
				startJumping();
				if (onTheStairs) {
					landOnStairs = true;
				}
				onTheStairs = false;
			}
		}
		
		checkCollision();
		
		// Check the controls, move accordingly
		if (Global.left) {
			//if the player is against a wall on the left side, stop against it, else, move
			if (againstWallLeft && !onTheStairs) {
				xSpeed = 0;
				x = Global.blocks[wallBlockLeft].x + Global.blocks[wallBlockLeft].width;
			} else { 
				xSpeed -= maxXSpeed;
			}
		}
		
		if (Global.right) {
			//if the player is against a wall on the right side, stop against it, else, move
			if (againstWallRight && !onTheStairs) {
				xSpeed = 0;
				x = Global.blocks[wallBlockRight].x - playerWidth;
			} else {
				xSpeed += maxXSpeed;
			}
		}
		
		
		//fix for bug when standing against the wall, stand still when both left and right are pressed.
		if (Global.left && Global.right) {
			xSpeed = 0;
		}
		
		if (hanging) {
			hangController();
		} else {
			jumpController();
		}
		
		//y += ySpeed;
		
		//walk up or down the stairs
		if (rightIsUp && (onTheStairs && (Global.left && (Global.level.level[Math.floor(Global.blocks[groundBlock].y / 12)][Math.floor(Global.blocks[groundBlock].x / 12) - 1] == 0 || Global.level.level[Math.floor(Global.blocks[groundBlock].y / 12)][Math.floor(Global.blocks[groundBlock].x / 12) - 1] == 6 || Global.level.level[Math.floor(Global.blocks[groundBlock].y / 12)][Math.floor(Global.blocks[groundBlock].x / 12) - 1] == 106)) || onTheStairs && Global.right || onTheStairs && !Global.left && ! Global.right) ||
		   !rightIsUp && (onTheStairs && (Global.right && (Global.level.level[Math.floor(Global.blocks[groundBlock].y / 12)][Math.floor(Global.blocks[groundBlock].x / 12) - 1] == 0 || Global.level.level[Math.floor(Global.blocks[groundBlock].y / 12)][Math.floor(Global.blocks[groundBlock].x / 12) - 1] == 6 || Global.level.level[Math.floor(Global.blocks[groundBlock].y / 12)][Math.floor(Global.blocks[groundBlock].x / 12) - 1] == 106)) || onTheStairs && Global.left || onTheStairs && !Global.left && ! Global.right)
		   ) {
			landOnStairs = false;
			xSpeed *= 0.5;
			if(rightIsUp) {
				y -= xSpeed;
			} else {
				y += xSpeed;
			}
		} else {
			y += ySpeed;
		}
		x += xSpeed;
		
		//check if the player ate a coin
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
					&& Global.blocks[i].y > y - Global.elementSize
					&& (Global.blocks[i].x + Global.elementSize) >= x - maxXSpeed
					&& Global.blocks[i].x < x - maxXSpeed) {
				if(Global.blocks[i].type != "OpenCeiling" && (Global.blocks[i].type != "Stairs" || onTheStairs) ) {
					againstWallLeft = true;
					wallBlockLeft = i;
				}
			}
			
			//collision on the right side
			if (	   Global.blocks[i].y < y + playerHeight
					&& Global.blocks[i].y > y - Global.elementSize
					&& (Global.blocks[i].x + Global.elementSize) > x + maxXSpeed
					&& Global.blocks[i].x <= x + playerWidth + maxXSpeed) {
				if(Global.blocks[i].type != "OpenCeiling" && (Global.blocks[i].type != "Stairs" || onTheStairs) ) {
					againstWallRight = true;
					wallBlockRight = i;
				}
			}
			
			//collision on the top side
			if (	   Global.blocks[i].y + Global.elementSize >= y + ySpeed + gravity
					&& Global.blocks[i].y < y
					&& Global.blocks[i].x + Global.elementSize > x
					&& Global.blocks[i].x < x + playerWidth) {
				if(Global.blocks[i].type != "OpenCeiling" && Global.blocks[i].type != "Stairs") {
					againstTheCeiling = true;
					onTheStairs = false;
					ceilingBlock = i;
				}
			}
			
			//collision on the bottom side
			if (	   Global.blocks[i].y <= y + ySpeed + gravity + playerHeight
					&& Global.blocks[i].y > y
					&& Global.blocks[i].x > x - Global.elementSize
					&& Global.blocks[i].x < x + playerWidth) {
				if (Global.blocks[i].type == "Block") {
					onTheGround = true;
					onTheStairs = false;
					groundBlock = i;
				} else if(Global.blocks[i].type == "OpenCeiling" && Global.blocks[i].y >= y + playerHeight && !Global.down) {
					onTheGround = true;
					onTheStairs = false;
					landOnStairs = true;
					groundBlock = i;
				} else if (Global.blocks[i].type == "Stairs" && /*Global.blocks[i].y >= y + playerHeight &&*/ (Global.up || landOnStairs)) {
					if(Global.blocks[i].y >= y + playerHeight - 10) {
						onTheGround = false;
						onTheStairs = true;
						rightIsUp = Global.blocks[i].rightIsUp;
					} else {
						onTheGround = true;
						onTheStairs = false;
					}
					groundBlock = i;
				}
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
		//if it's against the ceiling, stop moving up.
		if (onTheGround || againstTheCeiling || onTheStairs) {
			if(onTheGround || onTheStairs && landOnStairs) {
				//LAND
				ySpeed = 0;
				y = Global.blocks[groundBlock].y - playerHeight;
				isStanding = true;
			}
			if(againstTheCeiling) {
				ySpeed = 0;
				y = Global.blocks[ceilingBlock].y + Global.elementSize;
			}
		} else { 
			ySpeed += gravity;
			if (ySpeed > maxFallSpeed) {
				ySpeed = maxFallSpeed;
			}
		}
	}
	
	private var pX:Float;
	private var pY:Float;
	private var pDistance:Float;
	//Hang from the phone, change controls
	private function hangController():Void {
		//phoneHorn position
		pX = arms[1].weapon.phoneHorn.x;
		pY = arms[1].weapon.phoneHorn.y;
		pDistance = Math.sqrt((pX - x) * (pX - x) + (pY - y) * (pY - y));
		
		//Move up/towards the phoneHorn
		if (Global.up) {
			
		}
		
		//Move down/away from the phoneHorn
		if (Global.down) {
			
		}
	}
	
	//eat coins
	private var tempCoin:Coffee;
	private function checkCoin():Void {
		i = 0;
		while (i < Global.coins.length) {
			tempCoin = Global.coins[i];
			if (	   x < tempCoin.x + tempCoin.width
					&& x > tempCoin.x - playerWidth
					&& y < tempCoin.y + tempCoin.height
					&& y > tempCoin.y - playerHeight) {
				trace("You ate a coin!!");
				Global.health = 100;
				Global.level.level[Math.floor(tempCoin.y / Global.elementSize)][Math.floor(tempCoin.x / Global.elementSize)] -= 2;
				Global.coins.remove(tempCoin);
				tempCoin.parent.removeChild(tempCoin);
				i--;
			}
			i++;
		}
	}
	
	private function draw() {
		this.graphics.clear();
		AssetStorage.playerWalk.drawTiles(this.graphics, [ -10, 0, Math.floor(frame) % 8]);
		if(Global.right && !Global.left) {
			frame += 0.25;
			if (frame >= 8) {
				frame -= 8;
			}
		}
		if (Global.left && !Global.right) {
			frame -= 0.25;
			if (frame <= 0) {
				frame += 8;
			}
		}
	}
}