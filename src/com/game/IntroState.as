package com.game
{	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;

	public class IntroState extends FlxState
	{
		private var boy:Boy;
		private var girl:Girl;
		private var flower:Flower;
		
		
		public function IntroState()
		{
			super();
			bgColor = 0xffeeeeff;
			
			boy = new Boy(50,20);
			girl = new Girl(FlxG.width/2,FlxG.height/2);
			flower = new Flower(FlxU.random()*600 + 20,-20);
			
			var text:FlxText = new FlxText(FlxG.width/2 - 50, FlxG.height-20, 200, "Click... Move... Collect...");
			text.color = 0x888888;
			add(text);
			
			add(boy);
			add(girl);
			add(flower);
			
			FlxG.follow(boy,2.5);
			FlxG.followAdjust(0.5,0.0);
			FlxG.followBounds(0,0,640,480);
		}
		
		override public function update():void
		{
			super.update();
			
			boy.update();
			girl.update();
			flower.update();
			
			FlxU.overlap(boy, flower, boyAndFlower);
			//FlxU.overlap(boy, girl, boyAndGirl);
			FlxU.collide(boy, girl);
			
		}
		
		private function boyAndFlower(boy:Boy, flower:Flower):void{
			FlxG.score++;
			flower.reset(FlxU.random()*600 + 20, -20);
		}
		
		private function boyAndGirl(boy:Boy, girl:Girl):void{
			
		}
		
	}
}