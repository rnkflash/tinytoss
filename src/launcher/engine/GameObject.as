package launcher.engine 
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author lolcho
	 */
	public class GameObject extends Sprite
	{
		public var dead:Boolean = false;
		public var active:Boolean = true;
		public var collidable:Boolean = true;
		public var hitbox:Rectangle;
		public var type:String = "default";
		public var engine:Engine;
		
		public function GameObject() 
		{
			
		}
		
		public function Init():void
		{
			
		}
		
		public function Die():void
		{
			
		}
		
		public function Kill():void
		{
			dead = true;
		}
		
		public function Update():void
		{
			
		}
		
		public function SetHitbox(r:Rectangle):void
		{
			hitbox = r.clone();
		}
		
		public function Collide(type:String, aliveOnly:Boolean = true):GameObject
		{
			var result:GameObject = null;
			if (hitbox)
			{
				var r1:Rectangle = hitbox.clone();
				r1.offset(x, y);
				for each (var item:GameObject in engine.gameObjects) 
				{
					if (item.collidable && item.active && (!aliveOnly || !item.dead) && item.type == type && item.hitbox)
					{
						var r2:Rectangle = item.hitbox.clone();
						r2.offset(item.x, item.y);
						if (r1.intersects(r2))
						{
							result = item;
							break;
						}
					}
				}
			}
			return result;
		}
		
	}

}