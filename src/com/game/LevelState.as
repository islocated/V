package com.game
{	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;

	public class LevelState extends FlxState
	{
		private var boy:Boy;
		private var girl:Girl;
		private var flower:Flower;	
		private var text:FlxText;
		
		public function LevelState()
		{
			super();
			bgColor = 0xffeeeeff;
			trace("FlxG.level " + FlxG.level);
			
			boy = new Boy(0,FlxG.height/2);
			girl = new Girl(30,FlxG.height/2);
			flower = new Flower(FlxU.random()*600 + 20,-20);
			
			text = new FlxText(FlxG.width/2 - 50, FlxG.height-20, 200, "");
			text.color = 0x888888;
			add(text);
			
			if(FlxG.level == 1){
				text.text = "'Oooh, pretty flowers.'";
			}
			
			add(boy);
			add(girl);
			add(flower);
			
			if(FlxG.level == 2){
				text.text = "Marriage";
				girl.x = FlxG.width/2;
				boy.x = FlxG.width/2 - 20;
				flower.x = boy.x + 10;
			}
			
			FlxG.follow(boy,2.5);
			FlxG.followAdjust(0.5,0.0);
			FlxG.followBounds(0,0,640,480);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxU.overlap(boy, flower, boyAndFlower);
			//FlxU.overlap(boy, girl, boyAndGirl);
			FlxU.collide(boy, girl);
			
			if(FlxG.level == 1){
				if(FlxG.score == 1){
					text.text = "'I want a WHOLE dozen... :('";
				}
				else if(FlxG.score >= 12){
					text.text = "'Yay!!!'";
				}
			}
		}
		
		private function boyAndFlower(boy:Boy, flower:Flower):void{
			if(FlxG.level == 2){
				FlxG.level++;
				text.text = girl.happy ? "I do :)" : "Failed marriage";
				flower.kill();
				return;
			}
			
			FlxG.score++;
			flower.respawn();
		}
		
		private function boyAndGirl(boy:Boy, girl:Girl):void{
			
		}
		
	}
}

