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
			
			//load sounds here
			LoadSounds();
			
			//start game
			Reset();
		}  
		
		public function LoadSounds():void 
		{
			SoundAS.loadSound("../lib/references/Tiny_ability_toss_01.mp3", "toss1");
			SoundAS.loadSound("../lib/references/Tiny_ability_toss_02.mp3", "toss2");
			SoundAS.loadSound("../lib/references/Tiny_ability_toss_03.mp3", "toss3");
			SoundAS.loadSound("../lib/references/Tiny_ability_toss_04.mp3", "toss4");
			SoundAS.loadSound("../lib/references/Tiny_ability_toss_05.mp3", "toss5");
			
			SoundAS.loadSound("../lib/references/Tiny_spawn_01.mp3", "spawn1");
			SoundAS.loadSound("../lib/references/Tiny_spawn_02.mp3", "spawn2");
			SoundAS.loadSound("../lib/references/Tiny_spawn_03.mp3", "spawn3");
			SoundAS.loadSound("../lib/references/Tiny_spawn_06.mp3", "spawn4");
			
			SoundAS.loadSound("../lib/references/Toss_cast.mp3", "cast");
			SoundAS.loadSound("../lib/references/Toss_impact.mp3", "impact");
			SoundAS.loadSound("../lib/references/Toss_target.mp3", "target");
			
			SoundAS.loadSound("../lib/references/Bottle_Pour.mp3", "bottle");
			SoundAS.loadSound("../lib/references/coins.mp3", "coins");
			SoundAS.loadSound("../lib/references/coins_big.mp3", "coins_big");
			
			SoundAS.loadSound("../lib/references/Sun_Ray.mp3", "sun_ray");
			SoundAS.loadSound("../lib/references/Phoenix_bird_death_defeat.mp3", "phoenix_death");
			
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