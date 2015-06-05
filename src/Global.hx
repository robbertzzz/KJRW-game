package ;
import openfl.display.Sprite;
import weapons.Bullet;
import weapons.PhoneHorn;
import guruScreen.*;

import blocks.*;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Global
{
	public static var main:Main;
	
	public static var left:Bool;
	public static var right:Bool;
	public static var up:Bool;
	public static var down:Bool;
	public static var jump:Bool;
	public static var shift:Bool;
	public static var weaponIndex:Int = 0;
	public static var canChangeWeapon:Bool = true;
	public static var health:Int;
	
	public static var mouseDown:Bool;
	
	public static var mouseX:Float;
	public static var mouseY:Float;
	
	public static var levelWidth:Float;
	public static var levelHeight:Float;
	public static var level:Dynamic;
	public static var elementSize:Float;
	
	public static var blocks:Array<Dynamic> = new Array();
	public static var coins:Array<Coffee> = new Array();
	public static var bullets:Array<Bullet> = new Array();
	public static var fogMap:Array<Array<Fog>> = new Array();
	public static var npcs:Array<Dynamic> = new Array();
	
	public static var messages:Array<Dynamic> = new Array();
	public static var messageContents:Array<String> = new Array();
	
	public static var guruScreen:GuruScreen;
}