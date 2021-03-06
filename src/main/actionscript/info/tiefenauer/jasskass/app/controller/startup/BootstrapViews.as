/**
 * BootstrapViews.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.views.JassDetailViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassGameViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassListViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassPenaltyViewMediator;
	import info.tiefenauer.jasskass.jass.views.TeamBuilderViewMediator;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassDetailView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassGameView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassListView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassPenaltyView;
	import info.tiefenauer.jasskass.jass.views.interfaces.ITeamBuilderView;
	import info.tiefenauer.jasskass.kass.views.KassViewMediator;
	import info.tiefenauer.jasskass.kass.views.interfaces.IKassView;
	import info.tiefenauer.jasskass.profile.views.GroupBuilderViewMediator;
	import info.tiefenauer.jasskass.profile.views.JassGroupListViewMediator;
	import info.tiefenauer.jasskass.profile.views.JassGroupViewMediator;
	import info.tiefenauer.jasskass.profile.views.RegisterGroupViewMediator;
	import info.tiefenauer.jasskass.profile.views.interfaces.IGroupBuilderView;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJassGroupListView;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJassGroupView;
	import info.tiefenauer.jasskass.profile.views.interfaces.IRegisterGroupView;
	import info.tiefenauer.jasskass.statistics.views.StatisticsViewMediator;
	import info.tiefenauer.jasskass.statistics.views.interfaces.IStatisticsView;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	
	/**
	 * Bootstrap views/mediators 
	 * @author Daniel Tiefenauer
	 */
	public class BootstrapViews extends SimpleCommand
	{
		[Inject] public var mediatorMap:IMediatorMap;
		
		override public function execute():void{
			super.execute();
			// jass
			mediatorMap.map(ITeamBuilderView).toMediator(TeamBuilderViewMediator);
			mediatorMap.map(IJassListView).toMediator(JassListViewMediator);
			mediatorMap.map(IJassGameView).toMediator(JassGameViewMediator);
			mediatorMap.map(IJassPenaltyView).toMediator(JassPenaltyViewMediator);
			mediatorMap.map(IJassDetailView).toMediator(JassDetailViewMediator);
			
			// balance
			mediatorMap.map(IKassView).toMediator(KassViewMediator);
			
			// profile
			mediatorMap.map(IJassGroupView).toMediator(JassGroupViewMediator);
			mediatorMap.map(IGroupBuilderView).toMediator(GroupBuilderViewMediator);
			mediatorMap.map(IJassGroupListView).toMediator(JassGroupListViewMediator);
			mediatorMap.map(IRegisterGroupView).toMediator(RegisterGroupViewMediator);
			
			// statistics
			mediatorMap.map(IStatisticsView).toMediator(StatisticsViewMediator);
		}
	}
}