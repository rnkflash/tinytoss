package launcher 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import launcher.engine.Engine;
	import launcher.engine.GameObject;
	import treefortress.sound.SoundAS;
	/**
	 * ...
	 * @author lolcho
	 */
	public class LauncherWorld extends Engine
	{
		private var goblin:Goblin;
		private var gui:gui_mc;
		private var bg:ParallaxBackground;
		private var catapult:Catapult;
		
		
		public var state:String = "angle";
		
		public function LauncherWorld()
		{
			
		}
		
		override public function Start():void 
		{
			//mouse
			stage.addEventListener(MouseEvent.CLICK, OnMouseClick);
			
			//gui
			gui = new gui_mc();
			addChild(gui);
			
			//bg
			bg = new ParallaxBackground();
			addChildAt(bg, 0);
			
			//catapult
			catapult = new Catapult();
			AddObject(catapult);
			catapult.x = 100;
			catapult.y = 540;
			catapult.StartChoosing();
			
			//sound
			SoundAS.playFx("spawn" + int(1 + Math.random() * 4));
			
			//goblin
			goblin = new Goblin();
			AddObject(goblin);
			goblin.x = 156;
			goblin.y = Goblin.GROUND_LEVEL_Y;
			goblin.active = false;
			
			
			//post stuff
			UpdateGui();
		}
		
		private function OnMouseClick(e:MouseEvent):void 
		{
			//choose angle
			if (state == "angle")
			{
				catapult.ChooseAngle()
				state = "power";
			} else
			if (state == "power")
			{
				catapult.ChoosePower()
				
				//launch goblin
				goblin.dy = -1 * (50 * catapult.power) * Math.sin(catapult.angle * Math.PI/2);
				goblin.dx = (50 * catapult.power) * Math.cos(catapult.angle * Math.PI / 2);
				goblin.dangle = 20 * catapult.power;
				goblin.active = true;
				
				state = "launched";
				
				//sound
				SoundAS.playFx("toss" + int(1 + Math.random() * 5));
				SoundAS.playFx("cast");
				SoundAS.playFx("target");
				
			} else
			if (state == "launched")
			{
				Main.instance.Reset();
			}
		}
		
		private function UpdateGui():void 
		{
			gui.distance_text.text = String(int(goblin.launch_distance));
			gui.height_text.text = String(int(goblin.launch_height));
			gui.state_text.text = state;
			gui.power_text.text = Number(catapult.power).toFixed(2);
			gui.angle_text.text = Number(catapult.angle).toFixed(2);
			gui.dx_text.text = Number(goblin.dx).toFixed(2);
			gui.dy_text.text = Number(goblin.dy).toFixed(2);
			gui.dangle_text.text = Number(goblin.dangle).toFixed(2);
		}
		
		override public function Die():void 
		{
			//engine
			super.Die();
			
			//mouse
			stage.removeEventListener(MouseEvent.CLICK, OnMouseClick);
		}
		
		override public function Update(e:Event):void 
		{
			super.Update(e);
			
			//gui
			UpdateGui();
			
			//camera
			if (goblin.active )
			{
				if (goblin.launch_distance > 400)
					layer.x = -goblin.launch_distance + 400;
				if (goblin.launch_height > 300)
					layer.y = goblin.launch_height - 300;
				else
					layer.y = 0;
			}
			
			//parallax bg
			bg.Update(layer.x, layer.y);
			
			//remove obstacles and bonuses
			var fruits:Array = GetObjectsByType("fruit");
			fruits = fruits.concat(GetObjectsByType("phoenix"));
			fruits = fruits.concat(GetObjectsByType("creep"));
			if (fruits.length)
			{
				for each (var item:GameObject in fruits) 
				{
					if (item.x < -layer.x-800 || item.x > -layer.x + 2000)
					{
						item.dead = true;
					}
				}
			}
			
			//generate obstacles and bonuses
			if (Math.random() > 0.01)
			{
				//fruits
				if (CountObjects("fruit") < 1)
				{
					var fruit:Fruit = new Fruit();
					AddObject(fruit);
					fruit.x = -layer.x + 800 + 800 * Math.random();
					fruit.y = 500 * Math.random();
				}
				
				//phoenix
				if (CountObjects("phoenix") < 1)
				{
					var phoenix:Phoenix = new Phoenix();
					AddObject(phoenix);
					phoenix.x = -layer.x + 900 + 800 * Math.random();
					phoenix.y = -800 * Math.random();
				}
				
				//creep
				if (CountObjects("creep") < 3)
				{
					var creep:Creep = new Creep();
					AddObject(creep);
					creep.x = -layer.x + 900 + 800 * Math.random();
					creep.y = Goblin.GROUND_LEVEL_Y+30;
				}
				
			}
			
			
		}
		
		
		
		
		
		
	}

}