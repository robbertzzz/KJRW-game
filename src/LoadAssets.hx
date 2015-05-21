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
		AssetStorage.playerWalk = createFrames("img/player/player.png", 42, 61, 4, 8);
		AssetStorage.playerArm = createFrames("img/player/retardoarm.png", 7, 25, 1, 1);
		
		AssetStorage.ghostFloating = createFrames("img/ghost/ghostfloating.png", 66, 78, 14, 122);
		AssetStorage.ghostYawning = createFrames("img/ghost/ghostyawning.png", 72, 78, 14, 130);
		AssetStorage.ghostScratching = createFrames("img/ghost/ghostscratching.png", 66, 78, 15, 130);
		
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