package com.game
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Girl extends FlxSprite
	{
		[Embed(source="data/girl.png")] private var girlImg:Class;
		
		protected var _happy:Boolean;
		protected var _runSpeed:Number;
		
		public function Girl(X:int,Y:int)
		{
			super(X,Y,girlImg);
			loadGraphic(girlImg,true,true);
			width = 16;
			height = 28;
			
			_happy = false;
			
			addAnimation("idle", [0, 1], 5);
			addAnimation("happy", [0, 2] ,5);
		}
		
		override public function update():void{
			trace("girl: "+ x + "," + y);
			super.update();
			
			if(FlxG.level < 4){
				velocity.x = 0;
				velocity.y = 0;
			}
			
			_happy = FlxG.score >= 12;
			
			play(_happy ? "happy" : "idle");
				
			if(x < 0 || y < 0 || x > FlxG.width || y > FlxG.height){
				x = 0;
				y = 0;
				//Just move on, we can go to next level by marrying an unhappy girl
				FlxG.level++;
				FlxG.state = new LevelState();
			}
		}
		
		public function get happy():Boolean{
			return _happy;
		}
	}
}