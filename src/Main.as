package {
	
	import org.flixel.FlxGame;
	import com.game.IntroState;
	
	[SWF(width="640", height="480", backgroundColor="#ffffff")]
	[Frame(factoryClass="Preloader")]

	public class Main extends FlxGame
	{
		public function Main():void
		{
			super(640, 480, IntroState, 1);
			super.showLogo = false;
			
			//super.
			//useDefaultHotKeys = false;
		}
	}
}

