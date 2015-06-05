package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("img/blocks/paperfloating.png", __ASSET__img_blocks_paperfloating_png);
		type.set ("img/blocks/paperfloating.png", AssetType.IMAGE);
		className.set ("img/blocks/stack1.png", __ASSET__img_blocks_stack1_png);
		type.set ("img/blocks/stack1.png", AssetType.IMAGE);
		className.set ("img/blocks/stack2.png", __ASSET__img_blocks_stack2_png);
		type.set ("img/blocks/stack2.png", AssetType.IMAGE);
		className.set ("img/blocks/stack3.png", __ASSET__img_blocks_stack3_png);
		type.set ("img/blocks/stack3.png", AssetType.IMAGE);
		className.set ("img/blocks.png", __ASSET__img_blocks_png);
		type.set ("img/blocks.png", AssetType.IMAGE);
		className.set ("img/delegation/caseTargets.png", __ASSET__img_delegation_casetargets_png);
		type.set ("img/delegation/caseTargets.png", AssetType.IMAGE);
		className.set ("img/delegation/incomingMessages.png", __ASSET__img_delegation_incomingmessages_png);
		type.set ("img/delegation/incomingMessages.png", AssetType.IMAGE);
		className.set ("img/delegation/newMessage.png", __ASSET__img_delegation_newmessage_png);
		type.set ("img/delegation/newMessage.png", AssetType.IMAGE);
		className.set ("img/delegation/startscreen.png", __ASSET__img_delegation_startscreen_png);
		type.set ("img/delegation/startscreen.png", AssetType.IMAGE);
		className.set ("img/ghost/ghostfloating.png", __ASSET__img_ghost_ghostfloating_png);
		type.set ("img/ghost/ghostfloating.png", AssetType.IMAGE);
		className.set ("img/ghost/ghostscratching.png", __ASSET__img_ghost_ghostscratching_png);
		type.set ("img/ghost/ghostscratching.png", AssetType.IMAGE);
		className.set ("img/ghost/ghostyawning.png", __ASSET__img_ghost_ghostyawning_png);
		type.set ("img/ghost/ghostyawning.png", AssetType.IMAGE);
		className.set ("img/ghost/poef.png", __ASSET__img_ghost_poef_png);
		type.set ("img/ghost/poef.png", AssetType.IMAGE);
		className.set ("img/guru/guruappearing.png", __ASSET__img_guru_guruappearing_png);
		type.set ("img/guru/guruappearing.png", AssetType.IMAGE);
		className.set ("img/guru/gurufloating.png", __ASSET__img_guru_gurufloating_png);
		type.set ("img/guru/gurufloating.png", AssetType.IMAGE);
		className.set ("img/guru/guruglow.png", __ASSET__img_guru_guruglow_png);
		type.set ("img/guru/guruglow.png", AssetType.IMAGE);
		className.set ("img/player/cord.png", __ASSET__img_player_cord_png);
		type.set ("img/player/cord.png", AssetType.IMAGE);
		className.set ("img/player/jump.png", __ASSET__img_player_jump_png);
		type.set ("img/player/jump.png", AssetType.IMAGE);
		className.set ("img/player/newphonethrow.png", __ASSET__img_player_newphonethrow_png);
		type.set ("img/player/newphonethrow.png", AssetType.IMAGE);
		className.set ("img/player/phonearmback.png", __ASSET__img_player_phonearmback_png);
		type.set ("img/player/phonearmback.png", AssetType.IMAGE);
		className.set ("img/player/phonehorn.png", __ASSET__img_player_phonehorn_png);
		type.set ("img/player/phonehorn.png", AssetType.IMAGE);
		className.set ("img/player/phonerotating.png", __ASSET__img_player_phonerotating_png);
		type.set ("img/player/phonerotating.png", AssetType.IMAGE);
		className.set ("img/player/phonethrow.png", __ASSET__img_player_phonethrow_png);
		type.set ("img/player/phonethrow.png", AssetType.IMAGE);
		className.set ("img/player/phonethrowold.png", __ASSET__img_player_phonethrowold_png);
		type.set ("img/player/phonethrowold.png", AssetType.IMAGE);
		className.set ("img/player/player.png", __ASSET__img_player_player_png);
		type.set ("img/player/player.png", AssetType.IMAGE);
		className.set ("img/player/retardoarm.png", __ASSET__img_player_retardoarm_png);
		type.set ("img/player/retardoarm.png", AssetType.IMAGE);
		className.set ("img/player/scrollhit.png", __ASSET__img_player_scrollhit_png);
		type.set ("img/player/scrollhit.png", AssetType.IMAGE);
		className.set ("img/player/walkright.png", __ASSET__img_player_walkright_png);
		type.set ("img/player/walkright.png", AssetType.IMAGE);
		className.set ("img/static/coffee.png", __ASSET__img_static_coffee_png);
		type.set ("img/static/coffee.png", AssetType.IMAGE);
		className.set ("img/static/lamp.png", __ASSET__img_static_lamp_png);
		type.set ("img/static/lamp.png", AssetType.IMAGE);
		className.set ("fonts/ARIAL.TTF", __ASSET__fonts_arial_ttf);
		type.set ("fonts/ARIAL.TTF", AssetType.FONT);
		className.set ("fonts/ARIALBD.TTF", __ASSET__fonts_arialbd_ttf);
		type.set ("fonts/ARIALBD.TTF", AssetType.FONT);
		className.set ("fonts/ARIALBI.TTF", __ASSET__fonts_arialbi_ttf);
		type.set ("fonts/ARIALBI.TTF", AssetType.FONT);
		className.set ("fonts/ARIALI.TTF", __ASSET__fonts_ariali_ttf);
		type.set ("fonts/ARIALI.TTF", AssetType.FONT);
		className.set ("fonts/ARIALN.TTF", __ASSET__fonts_arialn_ttf);
		type.set ("fonts/ARIALN.TTF", AssetType.FONT);
		className.set ("fonts/ARIALNB.TTF", __ASSET__fonts_arialnb_ttf);
		type.set ("fonts/ARIALNB.TTF", AssetType.FONT);
		className.set ("fonts/ARIALNBI.TTF", __ASSET__fonts_arialnbi_ttf);
		type.set ("fonts/ARIALNBI.TTF", AssetType.FONT);
		className.set ("fonts/ARIALNI.TTF", __ASSET__fonts_arialni_ttf);
		type.set ("fonts/ARIALNI.TTF", AssetType.FONT);
		className.set ("fonts/ARIBLK.TTF", __ASSET__fonts_ariblk_ttf);
		type.set ("fonts/ARIBLK.TTF", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "img/blocks/paperfloating.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/blocks/stack1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/blocks/stack2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/blocks/stack3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/blocks.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/delegation/caseTargets.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/delegation/incomingMessages.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/delegation/newMessage.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/delegation/startscreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ghost/ghostfloating.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ghost/ghostscratching.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ghost/ghostyawning.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ghost/poef.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/guru/guruappearing.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/guru/gurufloating.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/guru/guruglow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/cord.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/jump.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/newphonethrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/phonearmback.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/phonehorn.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/phonerotating.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/phonethrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/phonethrowold.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/retardoarm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/scrollhit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/player/walkright.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/static/coffee.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/static/lamp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "fonts/ARIAL.TTF";
		className.set (id, __ASSET__fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALBD.TTF";
		className.set (id, __ASSET__fonts_arialbd_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALBI.TTF";
		className.set (id, __ASSET__fonts_arialbi_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALI.TTF";
		className.set (id, __ASSET__fonts_ariali_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALN.TTF";
		className.set (id, __ASSET__fonts_arialn_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALNB.TTF";
		className.set (id, __ASSET__fonts_arialnb_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALNBI.TTF";
		className.set (id, __ASSET__fonts_arialnbi_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIALNI.TTF";
		className.set (id, __ASSET__fonts_arialni_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/ARIBLK.TTF";
		className.set (id, __ASSET__fonts_ariblk_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arial_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arialbd_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arialbi_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_ariali_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arialn_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arialnb_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arialnbi_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_arialni_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_ariblk_ttf);
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/blocks/paperfloating.png", __ASSET__img_blocks_paperfloating_png);
		type.set ("img/blocks/paperfloating.png", AssetType.IMAGE);
		
		className.set ("img/blocks/stack1.png", __ASSET__img_blocks_stack1_png);
		type.set ("img/blocks/stack1.png", AssetType.IMAGE);
		
		className.set ("img/blocks/stack2.png", __ASSET__img_blocks_stack2_png);
		type.set ("img/blocks/stack2.png", AssetType.IMAGE);
		
		className.set ("img/blocks/stack3.png", __ASSET__img_blocks_stack3_png);
		type.set ("img/blocks/stack3.png", AssetType.IMAGE);
		
		className.set ("img/blocks.png", __ASSET__img_blocks_png);
		type.set ("img/blocks.png", AssetType.IMAGE);
		
		className.set ("img/delegation/caseTargets.png", __ASSET__img_delegation_casetargets_png);
		type.set ("img/delegation/caseTargets.png", AssetType.IMAGE);
		
		className.set ("img/delegation/incomingMessages.png", __ASSET__img_delegation_incomingmessages_png);
		type.set ("img/delegation/incomingMessages.png", AssetType.IMAGE);
		
		className.set ("img/delegation/newMessage.png", __ASSET__img_delegation_newmessage_png);
		type.set ("img/delegation/newMessage.png", AssetType.IMAGE);
		
		className.set ("img/delegation/startscreen.png", __ASSET__img_delegation_startscreen_png);
		type.set ("img/delegation/startscreen.png", AssetType.IMAGE);
		
		className.set ("img/ghost/ghostfloating.png", __ASSET__img_ghost_ghostfloating_png);
		type.set ("img/ghost/ghostfloating.png", AssetType.IMAGE);
		
		className.set ("img/ghost/ghostscratching.png", __ASSET__img_ghost_ghostscratching_png);
		type.set ("img/ghost/ghostscratching.png", AssetType.IMAGE);
		
		className.set ("img/ghost/ghostyawning.png", __ASSET__img_ghost_ghostyawning_png);
		type.set ("img/ghost/ghostyawning.png", AssetType.IMAGE);
		
		className.set ("img/ghost/poef.png", __ASSET__img_ghost_poef_png);
		type.set ("img/ghost/poef.png", AssetType.IMAGE);
		
		className.set ("img/guru/guruappearing.png", __ASSET__img_guru_guruappearing_png);
		type.set ("img/guru/guruappearing.png", AssetType.IMAGE);
		
		className.set ("img/guru/gurufloating.png", __ASSET__img_guru_gurufloating_png);
		type.set ("img/guru/gurufloating.png", AssetType.IMAGE);
		
		className.set ("img/guru/guruglow.png", __ASSET__img_guru_guruglow_png);
		type.set ("img/guru/guruglow.png", AssetType.IMAGE);
		
		className.set ("img/player/cord.png", __ASSET__img_player_cord_png);
		type.set ("img/player/cord.png", AssetType.IMAGE);
		
		className.set ("img/player/jump.png", __ASSET__img_player_jump_png);
		type.set ("img/player/jump.png", AssetType.IMAGE);
		
		className.set ("img/player/newphonethrow.png", __ASSET__img_player_newphonethrow_png);
		type.set ("img/player/newphonethrow.png", AssetType.IMAGE);
		
		className.set ("img/player/phonearmback.png", __ASSET__img_player_phonearmback_png);
		type.set ("img/player/phonearmback.png", AssetType.IMAGE);
		
		className.set ("img/player/phonehorn.png", __ASSET__img_player_phonehorn_png);
		type.set ("img/player/phonehorn.png", AssetType.IMAGE);
		
		className.set ("img/player/phonerotating.png", __ASSET__img_player_phonerotating_png);
		type.set ("img/player/phonerotating.png", AssetType.IMAGE);
		
		className.set ("img/player/phonethrow.png", __ASSET__img_player_phonethrow_png);
		type.set ("img/player/phonethrow.png", AssetType.IMAGE);
		
		className.set ("img/player/phonethrowold.png", __ASSET__img_player_phonethrowold_png);
		type.set ("img/player/phonethrowold.png", AssetType.IMAGE);
		
		className.set ("img/player/player.png", __ASSET__img_player_player_png);
		type.set ("img/player/player.png", AssetType.IMAGE);
		
		className.set ("img/player/retardoarm.png", __ASSET__img_player_retardoarm_png);
		type.set ("img/player/retardoarm.png", AssetType.IMAGE);
		
		className.set ("img/player/scrollhit.png", __ASSET__img_player_scrollhit_png);
		type.set ("img/player/scrollhit.png", AssetType.IMAGE);
		
		className.set ("img/player/walkright.png", __ASSET__img_player_walkright_png);
		type.set ("img/player/walkright.png", AssetType.IMAGE);
		
		className.set ("img/static/coffee.png", __ASSET__img_static_coffee_png);
		type.set ("img/static/coffee.png", AssetType.IMAGE);
		
		className.set ("img/static/lamp.png", __ASSET__img_static_lamp_png);
		type.set ("img/static/lamp.png", AssetType.IMAGE);
		
		className.set ("fonts/ARIAL.TTF", __ASSET__fonts_arial_ttf);
		type.set ("fonts/ARIAL.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALBD.TTF", __ASSET__fonts_arialbd_ttf);
		type.set ("fonts/ARIALBD.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALBI.TTF", __ASSET__fonts_arialbi_ttf);
		type.set ("fonts/ARIALBI.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALI.TTF", __ASSET__fonts_ariali_ttf);
		type.set ("fonts/ARIALI.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALN.TTF", __ASSET__fonts_arialn_ttf);
		type.set ("fonts/ARIALN.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALNB.TTF", __ASSET__fonts_arialnb_ttf);
		type.set ("fonts/ARIALNB.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALNBI.TTF", __ASSET__fonts_arialnbi_ttf);
		type.set ("fonts/ARIALNBI.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIALNI.TTF", __ASSET__fonts_arialni_ttf);
		type.set ("fonts/ARIALNI.TTF", AssetType.FONT);
		
		className.set ("fonts/ARIBLK.TTF", __ASSET__fonts_ariblk_ttf);
		type.set ("fonts/ARIBLK.TTF", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_blocks_paperfloating_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_blocks_stack1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_blocks_stack2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_blocks_stack3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_blocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_delegation_casetargets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_delegation_incomingmessages_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_delegation_newmessage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_delegation_startscreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ghost_ghostfloating_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ghost_ghostscratching_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ghost_ghostyawning_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ghost_poef_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_guru_guruappearing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_guru_gurufloating_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_guru_guruglow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_cord_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_jump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_newphonethrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_phonearmback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_phonehorn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_phonerotating_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_phonethrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_phonethrowold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_retardoarm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_scrollhit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_player_walkright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_static_coffee_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_static_lamp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__fonts_arial_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_arialbd_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_arialbi_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_ariali_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_arialn_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_arialnb_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_arialnbi_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_arialni_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_ariblk_ttf extends flash.text.Font { }


#elseif html5































@:keep #if display private #end class __ASSET__fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 
@:keep #if display private #end class __ASSET__fonts_arialbd_ttf extends lime.text.Font { public function new () { super (); name = "Arial Bold"; } } 
@:keep #if display private #end class __ASSET__fonts_arialbi_ttf extends lime.text.Font { public function new () { super (); name = "Arial Bold Italic"; } } 
@:keep #if display private #end class __ASSET__fonts_ariali_ttf extends lime.text.Font { public function new () { super (); name = "Arial Italic"; } } 
@:keep #if display private #end class __ASSET__fonts_arialn_ttf extends lime.text.Font { public function new () { super (); name = "Arial Narrow"; } } 
@:keep #if display private #end class __ASSET__fonts_arialnb_ttf extends lime.text.Font { public function new () { super (); name = "Arial Narrow Bold"; } } 
@:keep #if display private #end class __ASSET__fonts_arialnbi_ttf extends lime.text.Font { public function new () { super (); name = "Arial Narrow Bold Italic"; } } 
@:keep #if display private #end class __ASSET__fonts_arialni_ttf extends lime.text.Font { public function new () { super (); name = "Arial Narrow Italic"; } } 
@:keep #if display private #end class __ASSET__fonts_ariblk_ttf extends lime.text.Font { public function new () { super (); name = "Arial Black"; } } 


#else



#if (windows || mac || linux)


@:image("assets/img/blocks/paperfloating.png") #if display private #end class __ASSET__img_blocks_paperfloating_png extends lime.graphics.Image {}
@:image("assets/img/blocks/stack1.png") #if display private #end class __ASSET__img_blocks_stack1_png extends lime.graphics.Image {}
@:image("assets/img/blocks/stack2.png") #if display private #end class __ASSET__img_blocks_stack2_png extends lime.graphics.Image {}
@:image("assets/img/blocks/stack3.png") #if display private #end class __ASSET__img_blocks_stack3_png extends lime.graphics.Image {}
@:image("assets/img/blocks.png") #if display private #end class __ASSET__img_blocks_png extends lime.graphics.Image {}
@:image("assets/img/delegation/caseTargets.png") #if display private #end class __ASSET__img_delegation_casetargets_png extends lime.graphics.Image {}
@:image("assets/img/delegation/incomingMessages.png") #if display private #end class __ASSET__img_delegation_incomingmessages_png extends lime.graphics.Image {}
@:image("assets/img/delegation/newMessage.png") #if display private #end class __ASSET__img_delegation_newmessage_png extends lime.graphics.Image {}
@:image("assets/img/delegation/startscreen.png") #if display private #end class __ASSET__img_delegation_startscreen_png extends lime.graphics.Image {}
@:image("assets/img/ghost/ghostfloating.png") #if display private #end class __ASSET__img_ghost_ghostfloating_png extends lime.graphics.Image {}
@:image("assets/img/ghost/ghostscratching.png") #if display private #end class __ASSET__img_ghost_ghostscratching_png extends lime.graphics.Image {}
@:image("assets/img/ghost/ghostyawning.png") #if display private #end class __ASSET__img_ghost_ghostyawning_png extends lime.graphics.Image {}
@:image("assets/img/ghost/poef.png") #if display private #end class __ASSET__img_ghost_poef_png extends lime.graphics.Image {}
@:image("assets/img/guru/guruappearing.png") #if display private #end class __ASSET__img_guru_guruappearing_png extends lime.graphics.Image {}
@:image("assets/img/guru/gurufloating.png") #if display private #end class __ASSET__img_guru_gurufloating_png extends lime.graphics.Image {}
@:image("assets/img/guru/guruglow.png") #if display private #end class __ASSET__img_guru_guruglow_png extends lime.graphics.Image {}
@:image("assets/img/player/cord.png") #if display private #end class __ASSET__img_player_cord_png extends lime.graphics.Image {}
@:image("assets/img/player/jump.png") #if display private #end class __ASSET__img_player_jump_png extends lime.graphics.Image {}
@:image("assets/img/player/newphonethrow.png") #if display private #end class __ASSET__img_player_newphonethrow_png extends lime.graphics.Image {}
@:image("assets/img/player/phonearmback.png") #if display private #end class __ASSET__img_player_phonearmback_png extends lime.graphics.Image {}
@:image("assets/img/player/phonehorn.png") #if display private #end class __ASSET__img_player_phonehorn_png extends lime.graphics.Image {}
@:image("assets/img/player/phonerotating.png") #if display private #end class __ASSET__img_player_phonerotating_png extends lime.graphics.Image {}
@:image("assets/img/player/phonethrow.png") #if display private #end class __ASSET__img_player_phonethrow_png extends lime.graphics.Image {}
@:image("assets/img/player/phonethrowold.png") #if display private #end class __ASSET__img_player_phonethrowold_png extends lime.graphics.Image {}
@:image("assets/img/player/player.png") #if display private #end class __ASSET__img_player_player_png extends lime.graphics.Image {}
@:image("assets/img/player/retardoarm.png") #if display private #end class __ASSET__img_player_retardoarm_png extends lime.graphics.Image {}
@:image("assets/img/player/scrollhit.png") #if display private #end class __ASSET__img_player_scrollhit_png extends lime.graphics.Image {}
@:image("assets/img/player/walkright.png") #if display private #end class __ASSET__img_player_walkright_png extends lime.graphics.Image {}
@:image("assets/img/static/coffee.png") #if display private #end class __ASSET__img_static_coffee_png extends lime.graphics.Image {}
@:image("assets/img/static/lamp.png") #if display private #end class __ASSET__img_static_lamp_png extends lime.graphics.Image {}
@:font("assets/fonts/ARIAL.TTF") #if display private #end class __ASSET__fonts_arial_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALBD.TTF") #if display private #end class __ASSET__fonts_arialbd_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALBI.TTF") #if display private #end class __ASSET__fonts_arialbi_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALI.TTF") #if display private #end class __ASSET__fonts_ariali_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALN.TTF") #if display private #end class __ASSET__fonts_arialn_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALNB.TTF") #if display private #end class __ASSET__fonts_arialnb_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALNBI.TTF") #if display private #end class __ASSET__fonts_arialnbi_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIALNI.TTF") #if display private #end class __ASSET__fonts_arialni_ttf extends lime.text.Font {}
@:font("assets/fonts/ARIBLK.TTF") #if display private #end class __ASSET__fonts_ariblk_ttf extends lime.text.Font {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__fonts_arial_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIAL.TTF"; name = "Arial"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_arialbd_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALBD.TTF"; name = "Arial Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_arialbi_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALBI.TTF"; name = "Arial Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_ariali_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALI.TTF"; name = "Arial Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_arialn_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALN.TTF"; name = "Arial Narrow"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_arialnb_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALNB.TTF"; name = "Arial Narrow Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_arialnbi_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALNBI.TTF"; name = "Arial Narrow Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_arialni_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIALNI.TTF"; name = "Arial Narrow Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_ariblk_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/ARIBLK.TTF"; name = "Arial Black"; super (); }}

#end

#end
#end

