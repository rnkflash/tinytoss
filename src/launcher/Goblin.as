package launcher 
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import launcher.engine.GameObject;
	import treefortress.sound.SoundAS;
	/**
	 * ...
	 * @author lolcho
	 */
	public class Goblin extends GameObject
	{
		private var mc:MovieClip;
		
		public var dy:Number = 0;
		public var dx:Number = 0;
		public var dangle:Number = 0;
		
		public var launch_distance:Number = 0;
		public var launch_height:Number = 0;
		
		public static const GROUND_LEVEL_Y:Number = 506;
		
		public function Goblin() 
		{
			//graphics
			mc = new wisp_mc();
			addChild(mc);
			if (mc.anim)
				mc.anim.gotoAndPlay(Math.floor(1+mc.anim.totalFrames * Math.random()));
			
			//hitbox
			SetHitbox(mc.getRect(mc));
			
		}
		
		override public function Update():void 
		{
			//gravity
			dy += 0.5;
			
			//air resistance
			dangle -= 0.1;
			if (dangle < 0)
				dangle = 0;
			
			//movement
			x += dx; 
			y += dy;
			mc.rotation += dangle;
			
			//collisions
			var fruit:Fruit = Collide("fruit") as Fruit;
			var creep:Creep = Collide("creep") as Creep;
			var phoenix:Phoenix = Collide("phoenix") as Phoenix;
			if (fruit)
			{
				fruit.Eat();
				dy = Math.min(0, dy);
				dy -= 15;
				dx += 5;
				dangle += 5;
				
				//sound
				SoundAS.playFx("bottle");
				
			} else
			if (creep)
			{
				
				creep.Eat();
				dy = Math.min(0, dy);
				dy -= 10;
				dx += 1;
				dangle += 5;
				
				//sound
				SoundAS.playFx("coins");
				
			} else
			if (phoenix)
			{
				
				phoenix.Eat();
				dy = Math.min(0, dy);
				dy -= 5;
				dx += 20;
				dangle += 15;
				
				//sound
				SoundAS.playFx("sun_ray");
				SoundAS.playFx("phoenix_death");
				
			} else
			//ground
			if (y > GROUND_LEVEL_Y) 
			{
				dy = -0.5 * Math.abs(dy);
				y = GROUND_LEVEL_Y;
				dx *= 0.7;
				dangle = Math.abs(dy);
				if (dx < 1.0)
				{
					dx = 0;
					dangle = 0;
				}
					
				if (Math.abs(dy) < 1.0)
				{
					dy = 0;
					dangle = 0;
				} else
				{
					//sound
					SoundAS.playFx("impact");
				}
				
			}
			
			//update distance
			launch_distance = x - 51;
			launch_height = -y + GROUND_LEVEL_Y;
		}
		
	}

}