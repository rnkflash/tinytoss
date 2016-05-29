package  
{
	import treefortress.sound.SoundAS;
	/**
	 * ...
	 * @author rnk
	 */
	public class Assets 
	{
		
		//sounds
		[Embed(source = "../lib/references/Tiny_ability_toss_01.mp3")] private static var snd_toss1:Class;
		[Embed(source = "../lib/references/Tiny_ability_toss_02.mp3")] private static var snd_toss2:Class;
		[Embed(source = "../lib/references/Tiny_ability_toss_03.mp3")] private static var snd_toss3:Class;
		[Embed(source = "../lib/references/Tiny_ability_toss_04.mp3")] private static var snd_toss4:Class;
		[Embed(source = "../lib/references/Tiny_ability_toss_05.mp3")] private static var snd_toss5:Class;
		[Embed(source = "../lib/references/Tiny_spawn_01.mp3")] private static var snd_spawn1:Class;
		[Embed(source = "../lib/references/Tiny_spawn_02.mp3")] private static var snd_spawn2:Class;
		[Embed(source = "../lib/references/Tiny_spawn_03.mp3")] private static var snd_spawn3:Class;
		[Embed(source = "../lib/references/Tiny_spawn_06.mp3")] private static var snd_spawn6:Class;
		[Embed(source = "../lib/references/Toss_cast.mp3")] private static var snd_cast:Class;
		[Embed(source = "../lib/references/Toss_impact.mp3")] private static var snd_impact:Class;
		[Embed(source = "../lib/references/Toss_target.mp3")] private static var snd_target:Class;
		[Embed(source = "../lib/references/Bottle_Pour.mp3")] private static var snd_bottle:Class;
		[Embed(source = "../lib/references/coins.mp3")] private static var snd_coins:Class;
		[Embed(source = "../lib/references/coins_big.mp3")] private static var snd_coins_big:Class;
		[Embed(source = "../lib/references/Sun_Ray.mp3")] private static var snd_sunray:Class;
		[Embed(source = "../lib/references/Phoenix_bird_death_defeat.mp3")] private static var snd_phoenix_death:Class;
		
		
		
		
		public function Assets() 
		{
			
		}
		
		public static function LoadSounds():void
		{
			SoundAS.addSound(	"toss1"			, new snd_toss1() 			);
			SoundAS.addSound(	"toss2"			, new snd_toss2() 			);
			SoundAS.addSound(	"toss3"			, new snd_toss3() 			);
			SoundAS.addSound(	"toss4"			, new snd_toss4() 			);
			SoundAS.addSound(	"toss5"			, new snd_toss5() 			);
			SoundAS.addSound(	"spawn1"		, new snd_spawn1() 			);
			SoundAS.addSound(	"spawn2"		, new snd_spawn2() 			);
			SoundAS.addSound(	"spawn3"		, new snd_spawn3() 			);
			SoundAS.addSound(	"spawn4"		, new snd_spawn6() 			);
			SoundAS.addSound(	"cast"			, new snd_cast() 			);
			SoundAS.addSound(	"impact"		, new snd_impact() 			);
			SoundAS.addSound(	"target"		, new snd_target() 			);
			SoundAS.addSound(	"bottle"		, new snd_bottle() 			);
			SoundAS.addSound(	"coins"			, new snd_coins() 			);
			SoundAS.addSound(	"coins_big"		, new snd_coins_big() 		);
			SoundAS.addSound(	"sun_ray"		, new snd_sunray() 			);
			SoundAS.addSound(	"phoenix_death"	, new snd_phoenix_death()	);
			
		}
		
	}

}