package blocks;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.*;
import openfl.Assets;
import openfl.Lib;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class Message extends Sprite
{
	private var index:Int;
	private var showingMessage:Bool = false;
	private var textMessage:TextField;
	private var textMessageFormat:TextFormat;
	
	public function new(index:Int) 
	{
		super();
		
		graphics.beginFill(0x22ff22);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
		
		textMessageFormat = new TextFormat(Assets.getFont("fonts/ARIAL.TTF").fontName, 28, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER);
		
		this.index = index;
		
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	private function update(e:Event) {
		var distanceX:Float = Math.abs(x - Global.level.player.x);
		var distanceY:Float = Math.abs(y - Global.level.player.y);
		
		if (distanceY < 60 && distanceX < 40) {
			if (!showingMessage) {
				
				textMessage = new TextField();
				textMessage.defaultTextFormat = textMessageFormat;
				textMessage.x = 0;
				textMessage.y = 100;
				textMessage.width = Lib.current.stage.stageWidth;
				textMessage.text = Global.messageContents[index];
				Global.main.addChild(textMessage);
				
				showingMessage = true;
			}
		} else {
			if(showingMessage) {
				Global.main.removeChild(textMessage);
				
				showingMessage = false;
			}
		}
	}
}