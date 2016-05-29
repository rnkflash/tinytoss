package 
{
	
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import launcher.LauncherWorld;
	import treefortress.sound.SoundAS;
	
	/**
	 * ...
	 * @author lolcho
	 */
	public class Main extends Sprite
	{
		private var game:LauncherWorld;
		public static var instance:Main;
		
		public function Main() 
		{
			instance = this;
			
			if (stage)
				Init();
			else
				addEventListener(Event.ADDED_TO_STAGE, Init);
			
		}
		
		public function Init(e:*=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			//some stage settings
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//load sounds
			Assets.LoadSounds();
			
			//start game
			Reset();
		}  
		
		public function Reset():void
		{
			//game
			if (game)
			{
				game.Die();
				removeChild(game);
			}
			game = new LauncherWorld();
			game.scrollRect = new  Rectangle(0, 0, 800, 600);
			addChild(game);
			game.Init()
			
		}
		
		
	}
	
}