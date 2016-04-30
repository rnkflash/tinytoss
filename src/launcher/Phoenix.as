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
	public class Phoenix extends GameObject
	{
		
		public function Phoenix() 
		{
			//graphics
			var mc:MovieClip = new phoenix_mc();
			addChild(mc);
			
			//hitbox
			type = "phoenix";
			SetHitbox(mc.getRect(mc));
			
		}
		
		public function Eat():void
		{
			Kill();
		}
		
		override public function Update():void 
		{
			x += 50;
		}
		
	}

}