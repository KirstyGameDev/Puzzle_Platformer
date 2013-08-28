package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Kirsty Fraser
	 */
	public class Main extends MovieClip 
	{
		//Initialise Everything // 
		
		//Level 
		private var level:Level = new Level();
		private var startScreen:Scrn_Start = new Scrn_Start();
		private var highScoreScreen:Scrn_Highscore = new Scrn_Highscore();
		private var creditScreen:Scrn_Credits = new Scrn_Credits();
		
		
		// Misc. 
		private var game_start:Boolean = false; 
		private var highscore_start:Boolean = false;
		private var credit_start:Boolean = false;
	
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			// entry point
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void 
		{
			if (game_start == false && highscore_start == false && credit_start == false)
				addChild(startScreen);	
			
		
			
			
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.S)
			{
				game_start = true;				
				removeChild(startScreen);
				addChild(level);
			}
			if (event.keyCode == Keyboard.H)
			{
				highscore_start = true;
				removeChild (startScreen);	
				addChild(highScoreScreen);
			}
			if (event.keyCode == Keyboard.C)
			{
				credit_start = true;
				removeChild(startScreen);
				addChild(creditScreen)
			}
			if (event.keyCode == Keyboard.B)
			{
				addChild(startScreen);
				game_start = false;
				highscore_start = false;
				credit_start = false;
			}
		}
		
		
	}
	
}