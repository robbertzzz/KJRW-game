package delegating;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class ChooseCase extends CaseTarget
{
	public function new(x, y, type1, type2) 
	{
		super(x, y, type1, type2);
		
		/*this.x = x;
		this.y = y;*/
		
		size = 3;
	}
	
	private override function draw()
	{
		graphics.clear();
		if (highlight == true)
		{
			AssetStorage.houden2.drawTiles(this.graphics, [-37.5, -37.5, type1, ]);
		}
		else{
			AssetStorage.houden1.drawTiles(this.graphics, [-37.5, -37.5, type1, ]);
		}
	}
}