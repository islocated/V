package com.game
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Boy extends FlxSprite
	{
		[Embed(source="data/boy.png")] private var boyImg:Class;
		
		protected var _runSpeed:Number;
		
		public function Boy(X:int,Y:int)
		{
			super(X,Y,boyImg);
			loadGraphic(boyImg,true,true);
			width = 16;
			height = 28;
			
			_runSpeed = 100;
			
			addAnimation("idle", [0]);
			addAnimation("run", [0, 1, 2], 12);
		}
		
		private function handleMovement():void{
			velocity.x = 0;
			velocity.y = 0;
			
			//Accept no input on level 2
			if(FlxG.level == 2)
				return;
				
			if(FlxG.keys.pressed("LEFT"))
			{
				facing = LEFT;
				velocity.x = -_runSpeed;
			}
			else if(FlxG.keys.pressed("RIGHT"))
			{
				facing = RIGHT;
				velocity.x = _runSpeed;
			}
			
			if(FlxG.level != 0 && FlxG.level != 3){
				if(FlxG.keys.pressed("UP")){
					velocity.y = -_runSpeed;
				}
				else if(FlxG.keys.pressed("DOWN")){
					velocity.y = _runSpeed;
				}
			}
		}
		
		override public function update():void{
			super.update();
			
			handleMovement();
			
			if(FlxG.keys.pressed("LEFT") || FlxG.keys.pressed("RIGHT"))
				play("run");
			else
				play("idle");
		}
		
		override public function kill():void{
			super.kill();
		}

	}
}