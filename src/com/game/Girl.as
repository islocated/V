package com.game
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Girl extends FlxSprite
	{
		[Embed(source="data/girl.png")] private var girlImg:Class;
		
		protected var _runSpeed:Number;
		
		public function Girl(X:int,Y:int)
		{
			super(X,Y,girlImg);
			loadGraphic(girlImg,true,true);
			width = 16;
			
			addAnimation("idle", [0, 1], 5);
			addAnimation("happy", [0, 2] ,5);
		}
		
		override public function update():void{
			super.update();
			
			if(FlxG.score > 12){
				play("happy");
			}
			else
				play("idle");
				
			if(x < 0 || y < 0 || x > FlxG.width || y > FlxG.height){
				FlxG.state = new IntroState();
			}
		}
	}
}