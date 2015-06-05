#if !macro


@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl.display.Stage (app.window.width, app.window.height, config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new NMEPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("img/blocks/paperfloating.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/blocks/stack1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/blocks/stack2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/blocks/stack3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/blocks.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/basicblah.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/caseTargets.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/houden2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/houdenBase.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/incomingMessages.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/newMessage.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/delegation/startscreen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/ghost/ghostfloating.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/ghost/ghostscratching.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/ghost/ghostyawning.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/ghost/poef.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/guru/dialoguebubble.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/guru/guruappearing.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/guru/gurubackground.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/guru/gurufloating.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/guru/guruglow.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/guru/hintbubble.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/cord.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/jump.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/newphonethrow.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/phonearmback.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/phonehorn.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/phonerotating.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/phonethrow.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/phonethrowold.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/player.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/retardoarm.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/scrollhit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/player/walkright.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/static/coffee.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("img/static/lamp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Bold");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Bold Italic");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Italic");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Narrow");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Narrow Bold");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Narrow Bold Italic");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Narrow Italic");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial Black");
		types.push (lime.Assets.AssetType.FONT);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (1),
			background: Std.int (16777215),
			borderless: true,
			company: "Robert-Jan Zandvoort",
			depthBuffer: false,
			file: "PlatformEngine",
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (300),
			orientation: "landscape",
			packageName: "PlatformEngine",
			resizable: true,
			stencilBuffer: true,
			title: "Platform Engine",
			version: "1.0.0",
			vsync: true,
			width: Std.int (500),
			
		}
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 500, 300, "FFFFFF");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
