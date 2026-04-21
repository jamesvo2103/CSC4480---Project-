DROP TABLE Team;
DROP TABLE Coach;
DROP TABLE Player;
DROP TABLE Game;
DROP TABLE Team_Game_Stats;
DROP TABLE Big_East_Standings;

--Teams
CREATE TABLE Team(
    team_ID varchar(5) NOT NULL PRIMARY KEY,
    school_name varchar(60),
    team_name varchar(50),
    city varchar(40),
    state varchar(30),
    arena varchar(50)
);

--Coaches
CREATE TABLE Coach(
    coach_ID varchar(5) NOT NULL PRIMARY KEY,
    first_name varchar(20),
    last_name varchar(30),
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID),
    seasons_with_team varchar(2)
);

--Players
CREATE TABLE Player(
    player_ID varchar(5) NOT NULL PRIMARY KEY,
    first_name varchar(20),
    last_name varchar(30),
    jersey_number varchar(2),
    position varchar(2),
    class_year varchar(4),
    height varchar(20),
    weight varchar(3),
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID)
);

--Games
CREATE TABLE Game(
    game_ID varchar(5) NOT NULL PRIMARY KEY,
    game_date date,
    location varchar(50),
    home_team varchar(5), FOREIGN KEY(home_team) REFERENCES Team(team_ID),
    away_team varchar(5), FOREIGN KEY(away_team) REFERENCES Team(team_ID),
    home_score int,
    away_score int
);

--Stats
CREATE TABLE Team_Game_Stats(
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID),
    game_ID varchar(5), FOREIGN KEY(game_ID) REFERENCES Game(game_ID),
    field_goals_made int,
    field_goals_attempted int,
    three_points_made int,
    three_points_attempted int,
    free_throws_made int,
    free_throws_attempted int,
    rebounds int,
    assists int,
    steals int,
    blocks int,
    turnovers int,
    fouls int
);

--Standings
CREATE TABLE Big_East_Standings(
    standing int NOT NULL PRIMARY KEY,
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID),
    conference_wins int,
    conference_losses int,
    overall_wins int,
    overall_losses int
);

--Teams
INSERT INTO Team VALUES('JOHNS', 'St. Johns', 'Johnnies', 'New York', 'New York', 'Carnesecca Arena');
INSERT INTO Team VALUES('NOVA', 'Villanova', 'Wildcats', 'Villanova', 'Pennsylvania', 'Finneran Pavillion');
INSERT INTO Team VALUES('CREIG', 'Creighton', 'Bluejays', 'Omaha', 'Nebraska', 'CHI Health Center Omaha');
INSERT INTO Team VALUES('SETON', 'Seton Hall', 'Pirates', 'South Orange', 'New Jersey', 'Prudential Center');
INSERT INTO Team VALUES('UCONN', 'Connecticut', 'Huskies', 'Storrs', 'Connecticut', 'Harry A. Gample Pavillion'); 

--Coaches
INSERT INTO Coach VALUES('R.PIT', 'Rick', 'Pitino', 'JOHNS', '3');
INSERT INTO Coach VALUES('K.WIL', 'Kevin', 'Willard', 'NOVA', '1');
INSERT INTO Coach VALUES('G.MCD', 'Greg', 'McDermott', 'CREIG', '16');
INSERT INTO Coach VALUES('S.HOL', 'Shaheen', 'Holloway', 'SETON', '4');
INSERT INTO Coach VALUES('D.HUR', 'Dan', 'Hurley', 'UCONN', '6');

--St John's
INSERT INTO Player VALUES('SELL4', 'Oziyah', 'Sellers', '4', 'Guard', 'Senior', '6-5', '185lb', 'JOHNS');
INSERT INTO Player VALUES('JAC11', 'Ian', 'Jackson', '11', 'Guard', 'Sophomore', '6-4', '190lb', 'JOHNS');
INSERT INTO Player VALUES('MITC1', 'Dillon', 'Mitchell', '1', 'Forward', 'Senior', '6-8', '205lb', 'JOHNS');
INSERT INTO Player VALUES('HOP23', 'Bryce', 'Hopkins', '23', 'Forward', 'Senior', '6-6', '220lb', 'JOHNS');
INSERT INTO Player VALUES('EJI24', 'Zubi', 'Ejiofor', '24', 'Forward', 'Senior', '6-9', '240lb', 'JOHNS');

--Villanova
INSERT INTO Player VALUES('LEW55', 'Acaden', 'Lewis', '55', 'Guard', 'Freshman', '6-2', '180lb', 'NOVA');
INSERT INTO Player VALUES('LIND3', 'Bryce', 'Lindsay', '2', 'Guard', 'Sophomore', '6-3', '190lb', 'NOVA');
INSERT INTO Player VALUES('PERK4', 'Tyler', 'Perkins', '4', 'Guard', 'Junior', '6-4', '205lb', 'NOVA');
INSERT INTO Player VALUES('HOD33', 'Matt', 'Hodge', '33', 'Forward', 'Freshman', '6-8', '220lb','NOVA');
INSERT INTO Player VALUES('BRE24', 'Duke', 'Brennan', '24', 'Forward', 'Senior', '6-11', '235lb', 'NOVA');

--Creighton
INSERT INTO Player VALUES('SWAR1', 'Austin', 'Swartz', '1', 'Guard', 'Sophomore', '6-4', '200lb', 'CREIG');
INSERT INTO Player VALUES('DIX4', 'Josh', 'Dix', '4', 'Guard', 'Senior', '6-5', '192lb', 'CREIG');
INSERT INTO Player VALUES('DAVI9', 'Ty', 'Davis', '9', 'Guard', 'Sophomore', '6-4', '180lb', 'CREIG');
INSERT INTO Player VALUES('GREE0', 'Jasen', 'Green', '0', 'Guard', 'Junior', '6-8', '225lb', 'CREIG');
INSERT INTO Player VALUES('TRA41', 'Isaac', 'Traudt', '41', 'Forward', 'Junior', '6-10', '229lb', 'CREIG');

--Seton Hall
INSERT INTO Player VALUES('CLAR0', 'Adam', 'Clark', '0', 'Guard', 'Junior', '5-10', '165lb', 'SETON');
INSERT INTO Player VALUES('STA14', 'AJ', 'Staton-Mccray', '14', 'Guard', 'Senior', '6-4', '200lb', 'SETON');
INSERT INTO Player VALUES('SIMP2', 'Tajuan', 'Simpkins', '2', 'Guard', 'Junior', '6-4', '190lb', 'SETON');
INSERT INTO Player VALUES('PAYN6', 'Stephon', 'Payne', '6', 'Forward', 'Senior', '6-9', '235lb', 'SETON');
INSERT INTO Player VALUES('FIS22', 'Elijah', 'Fisher', '22', 'Guard', 'Senior', '6-6', '220lb', 'SETON');

-- UConn
INSERT INTO Player VALUES('BALL1', 'Solo', 'Ball', '1', 'Guard', 'Junior', '6-4', '200lb', 'UCONN');
INSERT INTO Player VALUES('DEMA2', 'Silas', 'Demary Jr', '2', 'Guard', 'Junior', '6-4', '195lb', 'UCONN');
INSERT INTO Player VALUES('STEW3', 'Jaylin', 'Stewart', '3', 'Forward', 'Junior', '6-7', '225lb', 'UCONN');
INSERT INTO Player VALUES('REED5', 'Tarris', 'Reed Jr', '5', 'Center', 'Senior', '6-11', '265lb', 'UCONN');
INSERT INTO Player VALUES('KAR11', 'Alex', 'Karaban', '11', 'Forward', 'Senior', '6-8', '230lb', 'UCONN');

