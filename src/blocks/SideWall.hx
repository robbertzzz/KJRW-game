package blocks;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Matrix3D;
import openfl.geom.Transform;
import openfl.geom.Vector3D;

/**
 * ...
 * @author Robert-Jan Zandvoort
 */
class SideWall extends Sprite
{

	public function new(rotX:Float, rotY:Float, col:Int, plusX:Float = 0, plusY:Float = 0, minusZ:Float = 0) 
	{
		super();
		
		graphics.beginFill(col);
        graphics.drawRect(0, 0, Global.elementSize, Global.elementSize);
		
		this.transform = new Transform(this);
		this.transform.matrix3D = new Matrix3D();
		this.transform.matrix3D.prependRotation(rotX, Vector3D.X_AXIS);
		this.transform.matrix3D.prependRotation(rotY, Vector3D.Y_AXIS);
		
		x = 0 + plusX;
		y = 0 + plusY;
		z = 0 - minusZ;
	}
	
}