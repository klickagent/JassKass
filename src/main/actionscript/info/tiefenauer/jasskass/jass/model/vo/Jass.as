/**
 * Jass
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.vo
{
	import flash.display3D.IndexBuffer3D;
	
	import mx.utils.UIDUtil;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * 
	 * @author Daniel Tiefenauer
	 */
	[Bindable]
	public class Jass implements IJass
	{
		// private vars
		private var _id:String = UIDUtil.createUID();
		private var _currentTeam:IJassTeam;
		private var _date:Date;
		private var _team1:IJassTeam = new JassTeam();
		private var _team2:IJassTeam = new JassTeam();
		private var _games:Vector.<IJassGame> = new Vector.<IJassGame>();
		private var _team1Striche:Number = 0;
		private var _team2Striche:Number = 0;
		
		private var _currentGame:IJassGame;
		
		/**
		 * Constructor 
		 */
		public function Jass(){
			_date = new Date();
			_team1.player1 = new JassPlayer();
			_team1.player2 = new JassPlayer();
			_team2.player1 = new JassPlayer();
			_team2.player2 = new JassPlayer();
		}

		//---------------------------------
		// Public functions
		//---------------------------------
		/**
		 * Create new Game 
		 */
		public function newGame():void{
			var game:IJassGame = new JassGame(this);
			_currentGame = game;
			_games.push(game);
		}
		
		/**
		 * Change round 
		 */
		public function newRound():void{
			if (_currentTeam == _team1)
				_currentTeam = _team2;
			else
				_currentTeam = _team1;
		}
		
		/**
		 * Get sum for team 1
		 * @return 
		 */
		public function get team1TotalPoints():Number{
			return team1PointsPlayed + team1WysPoints;
		}
		
		/**
		 * Get sum for team 2
		 * @return 
		 */
		public function get team2TotalPoints():Number{
			return team2PointsPlayed + team2WysPoints;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function toObject():Object{
			var obj:Object = new Object();
			obj['date'] = _date.time;
			obj['team1'] = _team1.toObject();
			obj['team2'] = _team2.toObject();
			obj['team1striche'] = _team1Striche;
			obj['team2striche'] = _team2Striche;
			var games:Array = new Array();
			for each(var game:IJassGame in _games){
				games.push(game.toObject());
			}
			obj['games'] = games;
			return obj;
		}
		
		/**
		 * 
		 * @param obj
		 * 
		 */
		public function fromObject(obj:Object):void{
			for (var key:String in obj){
				switch(key){
					case 'date':
						_date = new Date();
						_date.time = Number(obj[key]);
						break;
					case 'team1':
						_team1 = new JassTeam();
						_team1.fromObject(obj[key]);
						break;
					case 'team2':
						_team2 = new JassTeam();
						_team2.fromObject(obj[key]);
						break;
					case 'team1striche':
						_team1Striche = obj[key];
						break;
					case 'team2striche':
						_team2Striche = obj[key];
						break;
					case 'games':
						for each(var gameObj:Object in obj[key]){
							var game:JassGame = new JassGame(this);
							game.fromObject(gameObj);
							_games.push(game);
						}
						break;
				}
			}
		}
		
		public function get team1PointsPlayed():Number{
			var points:Number = 0;
			_games.every(function(item:IJassGame, index:int, vector:Vector.<IJassGame>):void{
				points += item.team1PointsPlayed;
			});
			return points;
		}
		public function get team2PointsPlayed():Number{
			var points:Number = 0;
			_games.every(function(item:IJassGame, index:int, vector:Vector.<IJassGame>):void{
				points += item.team2PointsPlayed;
			});
			return points;
		}
		public function get team1WysPoints():Number{
			var wysPoints:Number = 0;
			for each(var game:IJassGame in _games){
				game.team1Wyses.every(function(item:IWys, index:int, vector:Vector.<IWys>):void{
					wysPoints += item.value;
				});
			}
			return wysPoints;
		}
		public function get team2WysPoints():Number{
			var wysPoints:Number = 0;
			for each(var game:IJassGame in _games){
				game.team2Wyses.every(function(item:IWys, index:int, vector:Vector.<IWys>):void{
					wysPoints += item.value;
				});
			}
			return wysPoints;
		}
		
		//----------------------------------
		// Getter/Setter
		//----------------------------------
		public function get id():String{
			return _id;
		}
		public function get date():Date{
			return _date;
		}
		public function get team1():IJassTeam{
			return _team1;
		}
		public function set team1(value:IJassTeam):void{
			_team1 = value;
		}
		public function get team2():IJassTeam{
			return _team2;
		}
		public function set team2(value:IJassTeam):void{
			_team2 = value;
		}
		public function get currentTeam():IJassTeam{
			return _currentTeam;
		}
		public function get games():Vector.<IJassGame>{
			return _games;
		}
		public function get currentGame():IJassGame{
			return _currentGame;
		}
		public function set currentGame(value:IJassGame):void{
			_currentGame = value;
		}
		public function get team1Penalty():Number{
			return _team1Striche;
		}
		public function set team1Penalty(value:Number):void{
			_team1Striche = value;
		}
		public function get team2Penalty():Number{
			return _team2Striche;
		}
		public function set team2Penalty(value:Number):void{
			_team2Striche = value;
		}

	}
}