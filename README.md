Big East Basketball Database

Project Summary:   

Our project is a Big East database application designed to store and organize information about teams, players, coaches, games, and player statistics over the course of the 2025-2026 season. 

 

Business Rules:  

Each team is identified by a unique team ID and has one team name. 

Each season is identified by a unique season ID and represents one specific year or year range. 

A team can participate in many seasons, and a season can include many teams. 

Each team has at most one coach in a season. 

A coach can coach only one team per season. 

Each player is identified by a unique player ID and belongs to one team in a season. 

A team can have many players in a season, but each player record is associated with only one team for that season. 

Each game is identified by a unique game ID and occurs in one season. 

Each game must involve exactly two teams. 

A team can play many games in a season. 

A player can appear in many games, and a game can include many players. 

The relationship between players and games is recorded through PlayerGameStats. 

Each PlayerGameStats record belongs to one player and one game. 

A player can have at most one PlayerGameStats record per game. 

A PlayerGameStats record cannot exist unless the corresponding player and game already exist in the database. 

Restrictions: 

Since there are 11 teams in the Big East, with each of these teams having about 15 players and 30+ games, it would be extremely time consuming (and kind of unnecessary) to input data for every single team, game, and player. So, we will only select 4-5 teams, about 5-6 players per team, and only 6-7 games per team. 
