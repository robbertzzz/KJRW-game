package;

import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class LoadAssets extends Sprite
{
	public function new() 
	{
		super();
		AssetStorage.blocks = createFrames("img/blocks.png", 12, 12, 3, 15);
		AssetStorage.playerWalk = createFrames("img/player/walkright.png", 58, 84, 4, 8);
		AssetStorage.scrollArm = createFrames("img/player/scrollhit.png", 127, 84, 4, 34);
		AssetStorage.phoneArm = createFrames("img/player/newphonethrow.png", 48, 40, 9, 12);
		AssetStorage.phoneArmBack = createFrames("img/player/phonearmback.png", 33, 19, 1, 1);
		AssetStorage.playerArm = createFrames("img/player/retardoarm.png", 7, 25, 1, 1);
		AssetStorage.playerJump = createFrames("img/player/jump.png", 35, 90, 7, 16);
		
		AssetStorage.phoneCable = createFrames("img/player/cord.png", 6, 5, 6, 1);
		AssetStorage.phoneHorn = createFrames("img/player/phonehorn.png", 9, 22, 1, 1);
		
		AssetStorage.ghostFloating = createFrames("img/ghost/ghostfloating.png", 66, 78, 14, 122);
		AssetStorage.ghostYawning = createFrames("img/ghost/ghostyawning.png", 72, 78, 14, 130);
		AssetStorage.ghostScratching = createFrames("img/ghost/ghostscratching.png", 66, 78, 15, 130);
		
		AssetStorage.guruGlow = createFrames("img/guru/guruglow.png", 112, 112, 9, 40);
		AssetStorage.guruBackground = createFrames("img/guru/gurubackground.png", 500, 300, 1, 1);
		AssetStorage.guruAppearing = createFrames("img/guru/guruappearing.png", 286, 294, 28, 65);
		AssetStorage.guruFloating = createFrames("img/guru/gurufloating.png", 285, 294, 13, 105);
		AssetStorage.dialogueBubble = createFrames("img/guru/dialoguebubble.png", 260, 100, 1, 1);
		AssetStorage.hintBubble = createFrames("img/guru/hintbubble.png", 190, 200, 1, 1);
		
		AssetStorage.guruFloating = createFrames("img/guru/gurufloating.png", 296, 307, 13, 105);
		
		AssetStorage.coffee = createFrames("img/static/coffee.png", 46, 31, 1, 1);
		
		AssetStorage.caseTargets = createFrames("img/delegation/caseTargets.png", 57, 57, 2, 10);
		AssetStorage.startscreen = createFrames ("img/delegation/startscreen.png", 500, 300, 1, 1);
		AssetStorage.incomingMessages = createFrames("img/delegation/incomingMessages.png", 42, 42, 1, 5);
		AssetStorage.newMessage = createFrames("img/delegation/newMessage.png", 18, 24, 6, 6);
		AssetStorage.basicCaseTargets = createFrames("img/delegation/basicblah.png", 55, 55, 1, 5);
		AssetStorage.houden1 = createFrames("img/delegation/houdenBase.png", 75, 75, 1, 1);
		AssetStorage.houden2 = createFrames("img/delegation/houden2.png", 77, 77, 2, 2);
		
	}
	
	private function createFrames(asset:String, imgWidth:Int, imgHeight:Int, xNum:Int, imgNum:Int, spacing:Int = 0):Tilesheet {
		var bmpData:BitmapData = Assets.getBitmapData(asset);
		var tilesheet:Tilesheet = new Tilesheet(bmpData);
		for (i in 0...imgNum) {
			tilesheet.addTileRect(new Rectangle( (i % xNum) * (imgWidth + spacing), Math.floor(i / xNum) * (imgHeight + spacing), imgWidth, imgHeight));
		}
		return tilesheet;
	}
}