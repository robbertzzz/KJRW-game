package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.Lib;
import flash.system.System;
import openfl.display.FPS;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */

class Main extends Sprite 
{
	private var inited:Bool;
	public var level:Dynamic;
	public var menu:Menu;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		trace("HI!");

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		
		/*level = new Level1();
		addChild(level);*/
		
		addChild(new LoadAssets());
		
		addChild(new FPS(stage.stageWidth - 100, 10, 0x000000));
		
		menu = new Menu();
		addChild(menu);
		
		Global.main = this;
		Global.elementSize = 12;
		
		HttpConnector.sendData("test");
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mousePressed);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);
	}
	
	private function mouseMove(e:MouseEvent) {
		Global.mouseX = stage.mouseX;
		Global.mouseY = stage.mouseY;
	}
	
	private function mousePressed(e:MouseEvent) {
		Global.mouseDown = true;
	}
	
	private function mouseReleased(e:MouseEvent) {
		Global.mouseDown = false;
	}
	
	private function keyPressed(e:KeyboardEvent) {
		switch(e.keyCode) {
			case 39, 68:
				Global.right = true;
			case 37, 65:
				Global.left = true;
			case 38, 87:
				Global.up = true;
			case 40, 83:
				Global.down = true;
			case 32:
				Global.jump = true;
			case 16:
				Global.shift = true;
			case 27:
				System.exit(0);
			case 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59:
				Global.weaponIndex = e.keyCode - 48;
		}
		//trace(e.keyCode);
	}
	
	private function keyReleased(e:KeyboardEvent) {
		switch(e.keyCode) {
			case 39, 68:
				Global.right = false;
			case 37, 65:
				Global.left = false;
			case 38, 87:
				Global.up = false;
			case 40, 83:
				Global.down = false;
			case 32:
				Global.jump = false;
			case 16:
				Global.shift = false;
		}
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
