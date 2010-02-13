package com.game
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	public class Flower extends FlxSprite
	{
		[Embed(source="data/flower.png")] private var flowerImg:Class;
		
		protected var type:int;
		
		public function Flower(X:int,Y:int)
		{
			super(X,Y,flowerImg);
			loadGraphic(flowerImg,true,true);
			width = 16;
			
			type = 0;
			
			addAnimation("0", [0]);
			addAnimation("1", [1]);
			addAnimation("2", [2]);	
		}

		override public function update():void{
			super.update();
			velocity.y = (FlxG.score*5) + 20;
			velocity.x = 0;
			
			play(String(type));
			
			if(y > 640){
				respawn();
			}
		}
		
		public function respawn():void{
			type = FlxU.random() * 3;
			reset(FlxU.random() * 600 + 20, -20);
		}
	}
}