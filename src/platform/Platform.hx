package platform ;

import npcs.Darkling;
import openfl.display.Sprite;
import openfl.Lib;

import weapons.Bullet;
import weapons.PhoneHorn;

import player.Player;
import player.Arm;
import player.Body;
import player.Head;
import player.Leg;

import blocks.*;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Platform extends Sprite
{
	public var player:Player;
	public var level:Array<Array<Int>> = new Array();
	public var blocks:Array<Dynamic> = new Array();
	public var coins:Array<Coffee> = new Array();
	public var obstacles:Array<Obstacle> = new Array();
	public var fogMap:Array<Array<Fog>> = new Array();
	private var i:Int;
	private var ii:Int;
	public var messages:Array<Dynamic> = new Array();
	public var messageContents:Array<String> = new Array();
	
	public var hud:hud.HUD;
	private var playerX:Float;
	private var playerY:Float;
	
	public function new() 
	{
		super();
		
	}
	
	public function move(x, y):Void {
		this.x = x;
		this.y = y;
	}
	
	public function returnXY():Array<Float> {
		return [x, y];
	}
	
	var index:Int;
	var temp:Dynamic;
	
	private function init():Void {
		Global.levelWidth = level[0].length * Global.elementSize;
		Global.levelHeight = level.length * Global.elementSize;
		
		playerX = Global.elementSize + 30;
		playerY = Global.levelHeight - Global.elementSize - 60 - 30;
		
		for (i in 0...level.length) {
			for (ii in 0...level[i].length) {
				switch(level[i][ii]) {
					case 1, 101:
						temp = new Block(ii * Global.elementSize, i * Global.elementSize, level);
						/*temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;*/
						blocks.push(temp);
						addChild(temp);
					
					case 2, 102:
						temp = new Coffee();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						coins.push(temp);
						addChild(temp);
						
					case 3, 103:
						temp = new Obstacle();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						//temp.z = 0/*Global.elementSize*/;
						blocks.push(temp);
						addChild(temp);
					case 4, 104:
						temp = new Lamp();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						//blocks.push(temp);
						addChild(temp); 
					case 5, 105:
						temp = new Darkling();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						addChild(temp);
						level[i][ii] -= 5;
					case 6, 106:
						temp = new Stairs(ii * Global.elementSize, i * Global.elementSize, level);
						/*temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;*/
						blocks.push(temp);
						addChild(temp);
					case 7, 107:
						temp = new OpenCeiling();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						blocks.push(temp);
						addChild(temp);
					
					case 8, 108:
						temp = new Door();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						blocks.push(temp);
						addChild(temp);
					
					case 9, 109:
						playerX = ii * Global.elementSize;
						playerY = i * Global.elementSize;
					
					default:
						if (level[i][ii] >= 200 && level[i][ii] < 300) {
							temp = new Message(level[i][ii] - 200);
							temp.x = ii * Global.elementSize;
							temp.y = i * Global.elementSize;
							messages.push(temp);
							addChild(temp);
						}
				}
			}
		}
		
		for (i in 0...level.length) {
			fogMap[i] = new Array();
			for (ii in 0...level[i].length) {
				
				fogMap[i][ii] = null;
				if (level[i][ii] >= 100 && level[i][ii] < 200) {
					temp = new Fog();
					temp.x = ii * Global.elementSize;
					temp.y = i * Global.elementSize;
					temp.z = 0/*Global.elementSize*/;
					addChild(temp);
					fogMap[i][ii] = temp;
					
				}
				
			}
			
		}
		
		Global.blocks = blocks;
		Global.coins = coins;
		Global.fogMap = fogMap;
		Global.messages = messages;
		Global.messageContents = messageContents;

		trace(messageContents[1]);
		
		player = new Player();
		player.x = playerX;
		player.y = playerY;
		//player.z = -0.5 * Global.elementSize;
		addChild(player);
		Global.health = 100;
		
		hud = new hud.HUD();
		Global.main.addChild(hud);
	}
}