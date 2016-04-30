package launcher 
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import launcher.engine.GameObject;
	/**
	 * ...
	 * @author lolcho
	 */
	public class Catapult extends GameObject
	{
		private var mc:Sprite;
		private var anglespeed:Number;
		private var powerspeed:Number;
		private var state:String = "idle";
		private var arrow:MovieClip;
		private var tiny:MovieClip;
		
		//output
		public var angle:Number = 0;
		public var power:Number = 0;
		
		
		public function Catapult() 
		{
			//graphics
			mc = new Sprite();
			addChild(mc);
			
			tiny = new tiny_mc();
			mc.addChild(tiny);
			tiny.gotoAndStop(1);
			
			arrow = new arrow_mc();
			mc.addChild(arrow);
			arrow.visible = false;
			arrow.x = 73;
			arrow.y = -144;
		}
		
		public function ChooseAngle():void 
		{
			state = "power";
		}
		
		public function ChoosePower():void 
		{
			state = "idle";
			arrow.visible = false;
			tiny.gotoAndStop(2);
		}
		
		public function StartChoosing():void 
		{
			//start animation
			arrow.visible = true;
			arrow.gotoAndStop(arrow.totalFrames);
			state = "angle";
			anglespeed = -0.04;
			angle = 0.0;
			power = 1.0;
			powerspeed = -0.05;
		}
		
		override public function Update():void 
		{
			
			if (state == "angle")
			{
				angle += anglespeed;
				if (angle > 1.0)
				{
					angle= 1.0;
					anglespeed = -anglespeed;
				} else
				if (angle < 0.0)
				{
					angle = 0.0;
					anglespeed = -anglespeed;
				}
				
				arrow.rotation = int(-90 * angle);
			}
			if (state == "power")
			{
				
				power += powerspeed;
				if (power > 1.0)
				{
					power = 1.0;
					powerspeed = -powerspeed;
				} else
				if (power < 0.0)
				{
					power = 0.0;
					powerspeed = -powerspeed;
				}
				
				arrow.gotoAndStop(int(power * arrow.totalFrames));
				
			}
			
		}
		
		
	}

}