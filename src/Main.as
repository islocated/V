package {
	
	import com.game.IntroState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width="640", height="480", backgroundColor="#ffffff")]
	[Frame(factoryClass="Preloader")]

	public class Main extends FlxGame
	{
		public function Main():void
		{
			super(640, 480, IntroState, 1);
			super.showLogo = false;
			
			//useDefaultHotKeys = false;
			FlxG.levels = [];
		}
	}
}

