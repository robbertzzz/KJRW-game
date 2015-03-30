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

import blocks.Block;
import blocks.Coin;
import blocks.Fog;
import blocks.HangBlock;
import blocks.Obstacle;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Platform extends Sprite
{
	public var player:Player;
	public var level:Array<Array<Int>> = new Array();
	public var blocks:Array<Dynamic> = new Array();
	public var coins:Array<Coin> = new Array();
	public var obstacles:Array<Obstacle> = new Array();
	public var fogMap:Array<Array<Fog>> = new Array();
	private var i:Int;
	private var ii:Int;
	
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
		
		for (i in 0...level.length) {
			for (ii in 0...level[i].length) {
				switch(level[i][ii]) {
					case 1, 101:
						temp = new Block();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						blocks.push(temp);
						addChild(temp);
					
					case 2, 102:
						temp = new Coin();
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
						temp = new HangBlock();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						//blocks.push(temp);
						addChild(temp); 
					/*case 5, 105:
						temp = new Darkling();
						temp.x = ii * Global.elementSize;
						temp.y = i * Global.elementSize;
						addChild(temp);
						level[i][ii] -= 5;*/
				}
				
			}
		}
		
		for (i in 0...level.length) {
			fogMap[i] = new Array();
			for (ii in 0...level[i].length) {
				
				fogMap[i][ii] = null;
				if (level[i][ii] >= 100) {
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
		
		player = new Player();
		player.x = Global.elementSize + 30;
		player.y = Global.levelHeight - Global.elementSize - player.height - 30;
		//player.z = -0.5 * Global.elementSize;
		addChild(player);
	}
}