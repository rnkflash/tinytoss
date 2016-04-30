package launcher 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author lolcho
	 */
	public class ParallaxBackground extends Sprite
	{
		public var layers:Array = [];
		
		public function ParallaxBackground()
		{
			AddLayer(sky_mc, 0, 0);
			//AddLayer(bg1_mc, 0.5, 0.5);
			//AddLayer(bg2_mc, 0.9, 0.9);
			AddLayer(ground_mc, 1.0, 1.0);
		}
		
		public function Update(camerax:Number, cameray:Number):void
		{
			for each (var item:Object in layers) 
			{
				item.layer.x = item.parallax_hor * camerax % 800;
				item.layer.y = item.parallax_ver * cameray;
			}
			
		}
		
		private function AddLayer(mc_class:Class, parallax_hor:Number = 1.0, parallax_ver:Number = 0.0):void 
		{
			var layer:Sprite = new Sprite();
			var mc:MovieClip = new mc_class();
			layer.addChild(mc);
			mc = new mc_class();
			mc.x = 800;
			layer.addChild(mc);
			addChild(layer);
			layers.push( { layer:layer, parallax_hor:parallax_hor, parallax_ver:parallax_ver } );
		}
		
	}

}