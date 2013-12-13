package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.NavigateBackCommand;
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.controller.AddPoints;
	import info.tiefenauer.jasskass.jass.controller.AddScore;
	import info.tiefenauer.jasskass.jass.controller.AddStoeck;
	import info.tiefenauer.jasskass.jass.controller.AddWys;
	import info.tiefenauer.jasskass.jass.controller.CreateJass;
	import info.tiefenauer.jasskass.jass.controller.HideScore;
	import info.tiefenauer.jasskass.jass.controller.LoadJassesFromFile;
	import info.tiefenauer.jasskass.jass.controller.NewJass;
	import info.tiefenauer.jasskass.jass.controller.SaveJassesToFile;
	import info.tiefenauer.jasskass.jass.controller.ShowJassDetails;
	import info.tiefenauer.jasskass.jass.controller.ShowScore;
	import info.tiefenauer.jasskass.jass.controller.StartJass;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.ScoreEvent;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
	/**
	 * Bootstrap events/commands 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class BootstrapCommands extends SimpleCommand
	{
		[Inject] public var commandMap:IEventCommandMap;
		
		override public function execute():void{
			super.execute();
			
			// Initialization
			commandMap.map(InitializationEvent.LOAD_APP_CONFIG).toCommand(LoadAppConfiguration);
			commandMap.map(InitializationEvent.GET_GOOGLE_API_TOKEN).toCommand(GetOAuth2AccessToken);
			
			// Jass
			commandMap.map(JassEvent.NEW_JASS).toCommand(NewJass);
			commandMap.map(JassEvent.CREATE_JASS).toCommand(CreateJass);
			commandMap.map(JassEvent.START_JASS).toCommand(StartJass);
			commandMap.map(JassEvent.SHOW_SCORE).toCommand(ShowScore);
			commandMap.map(JassEvent.HIDE_SCORE).toCommand(HideScore);
			commandMap.map(JassEvent.SHOW_JASS_DETAIL).toCommand(ShowJassDetails);
			
			// JassProxy
			commandMap.map(JassProxyEvent.SAVE_JASSES).toCommand(SaveJassesToFile);
			commandMap.map(JassProxyEvent.LOAD_JASSES).toCommand(LoadJassesFromFile);

			// Points
			commandMap.map(PointsEvent.ADD_POINTS).toCommand(AddPoints);
			
			// Score
			commandMap.map(ScoreEvent.BERGPREIS).toCommand(AddScore);
			commandMap.map(ScoreEvent.SIEG).toCommand(AddScore);
			commandMap.map(ScoreEvent.MATCH).toCommand(AddScore);
			commandMap.map(ScoreEvent.KONTERMATCH).toCommand(AddScore);
			commandMap.map(ScoreEvent.VIER_BAUERN).toCommand(AddScore);
			
			// Wyses
			commandMap.map(WysEvent.WYS).toCommand(AddWys);
			commandMap.map(WysEvent.STOECK).toCommand(AddStoeck);
			
			// general
			commandMap.map(MobileView.BACK).toCommand(NavigateBackCommand);
		}
	}
}