package launcher 
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import launcher.engine.GameObject;
	/**
	 * ...
	 * @author lolcho
	 */
	public class Fruit extends GameObject
	{
		
		public function Fruit() 
		{
			//graphics
			var mc:MovieClip = new bottle_mc();
			addChild(mc);
			
			//hitbox
			type = "fruit";
			SetHitbox(mc.getRect(mc));
			
		}
		
		public function Eat():void
		{
			Kill();
		}
		
	}

}