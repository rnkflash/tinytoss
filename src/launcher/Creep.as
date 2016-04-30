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
	public class Creep extends GameObject
	{
		private var coins:MovieClip;
		private var mc:MovieClip;
		private var death_timer:int = -1;
		
		public function Creep() 
		{
			//graphics
			coins = new moneymoney_mc();
			coins.stop();
			
			mc = new creep_mc();
			addChild(mc);
			
			//hitbox
			type = "creep";
			SetHitbox(mc.getRect(mc));
			
		}
		
		public function Eat():void
		{
			//Kill();
			collidable = false;
			mc.visible = false;
			addChild(coins);
			coins.gotoAndPlay(1);
			coins.y = -55;
			death_timer = coins.totalFrames;
		}
		
		override public function Update():void 
		{
			if (death_timer > 0)
			{
				death_timer--;
				if (death_timer <= 0)
				{
					Kill();
				}
			} else
				x += 5;
		}
		
	}

}