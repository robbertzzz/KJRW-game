package ;
import weapons.Bullet;
import weapons.PhoneHorn;

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
	public static var weaponIndex:Int = 1;
	
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
}