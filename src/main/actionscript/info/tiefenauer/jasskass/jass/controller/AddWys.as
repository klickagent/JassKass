/**
 * AddWys
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * Add wys to current game 
	 * @author Daniel Tiefenauer
	 */
	public class AddWys extends SimpleCommand
	{
		[Inject] public var event:WysEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			for each(var wys:IWys in event.wyses){
				wys.value = event.factor * wys.value;
			}
			jassProxy.addWysToCurrentGame(event.team, event.wyses)
		}
	}
}