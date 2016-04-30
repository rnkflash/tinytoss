package launcher.engine 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author lolcho
	 */
	public class Engine extends Sprite
	{
		public var gameObjects:Array = [];
		public var layer:Sprite;
		
		public function Engine() 
		{
			
		}
		
		public function Init():void
		{
			//listeners
			addEventListener(Event.ENTER_FRAME, Update);
			
			//layers
			layer = new Sprite();
			addChild(layer);
			
			//start
			Start();
			
		}
		
		public function Die():void
		{
			//objects
			for (var i:int = gameObjects.length-1; i >=0 ; i--) 
			{
				gameObjects[i].Die();
				layer.removeChild(gameObjects[i]);
			}
			gameObjects = [];
			
			//listeners
			removeEventListener(Event.ENTER_FRAME, Update);
		}	
		
		public function Start():void
		{
			
		}
		
		public function AddObject(gameObject:GameObject):void
		{
			gameObject.engine = this;
			layer.addChild(gameObject);
			if (gameObjects.indexOf(gameObject)<0)
				gameObjects.push(gameObject);
			gameObject.Init();
		}
		
		public function RemoveObject(gameObject:GameObject):void
		{
			gameObject.dead = true;
		}
		
		public function Update(e:Event):void 
		{
			//game objects
			for each (var gameObject:GameObject in gameObjects) 
			{
				if (gameObject.active && !gameObject.dead)
					gameObject.Update();
			}
			
			//remove dead objects
			for (var i:int = gameObjects.length-1; i >=0 ; i--) 
			{
				if (gameObjects[i].dead)
				{
					gameObjects[i].Die();
					layer.removeChild(gameObjects[i]);
					gameObjects.splice(i, 1);
				}
			}
			
		}
		
		public function CountObjects(type:String):int
		{
			var result:int = 0;
			for each (var gameObject:GameObject in gameObjects) 
			{
				if (gameObject.type == type)
					result++;
			}
			return result;
		}
		
		public function GetObjectsByType(type:String):Array
		{
			var result:Array = [];
			for each (var gameObject:GameObject in gameObjects) 
			{
				if (gameObject.type == type)
					result.push(gameObject);
			}
			return result;
		}
		
		
	}

}