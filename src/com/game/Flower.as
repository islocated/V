package com.game
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	public class Flower extends FlxSprite
	{
		[Embed(source="data/flower.png")] private var flowerImg:Class;
		
		protected var _runSpeed:Number;
		
		public function Flower(X:int,Y:int)
		{
			super(X,Y,flowerImg);
			loadGraphic(flowerImg,true,true);
			width = 16;
			
			addAnimation("idle", [0]);
		}

		override public function update():void{
			super.update();
			velocity.y = (FlxG.score*4) + 10;
			velocity.x = 0;
			
			play("idle");
			
			if(y > 640){
				reset(FlxU.random() * 600 + 20, -20);
			}
		}
	}
}