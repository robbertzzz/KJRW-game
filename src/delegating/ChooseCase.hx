package delegating;

import openfl.display.Sprite;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class ChooseCase extends CaseTarget
{
	public function new(x, y) 
	{
		super(x, y);
		
		this.x = x;
		this.y = y;
		
		size = 3;
	}
	
}