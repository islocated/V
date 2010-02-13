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
		private var text:FlxText;
		
		public function IntroState()
		{
			super();
			bgColor = 0xffeeeeff;
			
			FlxG.level = 0;
			
			boy = new Boy(50,FlxG.height/2);
			girl = new Girl(80,FlxG.height/2);
			flower = new Flower(FlxU.random()*600 + 20,-20);
			
			text = new FlxText(FlxG.width/2 - 50, FlxG.height-20, 200, "Click to Play");
			text.color = 0x888888;
			add(text);
			
			add(boy);
			add(girl);
		}
		
		override public function update():void
		{
			super.update();
			
			boy.update();
			girl.update();
			flower.update();
			
			if(FlxG.mouse.pressed()){
				text.text = "Dating.  Taking her for a walk.";
			}
			
			FlxU.collide(boy, girl);
		}
	}
}