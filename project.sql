DROP TABLE Team CASCADE CONSTRAINTS;
DROP TABLE Coach CASCADE CONSTRAINTS;
DROP TABLE Player CASCADE CONSTRAINTS;
DROP TABLE Game CASCADE CONSTRAINTS;
DROP TABLE Team_Game_Stats CASCADE CONSTRAINTS;
DROP TABLE Big_East_Standings CASCADE CONSTRAINTS;

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
    position varchar(20),
    class_year varchar(20),
    height varchar(20),
    weight varchar(20),
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID)
);

--Games
CREATE TABLE Game(
    game_ID varchar(7) NOT NULL PRIMARY KEY,
    game_date date,
    home_team varchar(5), FOREIGN KEY(home_team) REFERENCES Team(team_ID),
    away_team varchar(5), FOREIGN KEY(away_team) REFERENCES Team(team_ID),
    home_score int,
    away_score int
);

--Stats
CREATE TABLE Team_Game_Stats(
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID),
    game_ID varchar(7), FOREIGN KEY(game_ID) REFERENCES Game(game_ID),
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
    fouls int,
    PRIMARY KEY(team_ID, game_ID)
);

--Standings
CREATE TABLE Big_East_Standings(
    standing varchar(2) NOT NULL PRIMARY KEY,
    team_ID varchar(5), FOREIGN KEY(team_ID) REFERENCES Team(team_ID),
    conference_wins int,
    conference_losses int,
    overall_wins int,
    overall_losses int
);

--Teams
INSERT INTO Team VALUES('SJ', 'St. Johns', 'Johnnies', 'New York', 'New York', 'Carnesecca Arena');
INSERT INTO Team VALUES('VIL', 'Villanova', 'Wildcats', 'Villanova', 'Pennsylvania', 'Finneran Pavillion');
INSERT INTO Team VALUES('CRE', 'Creighton', 'Bluejays', 'Omaha', 'Nebraska', 'CHI Health Center Omaha');
INSERT INTO Team VALUES('SET', 'Seton Hall', 'Pirates', 'South Orange', 'New Jersey', 'Prudential Center');
INSERT INTO Team VALUES('CON', 'Connecticut', 'Huskies', 'Storrs', 'Connecticut', 'Harry A. Gample Pavillion'); 

--Coaches
INSERT INTO Coach VALUES('R.PIT', 'Rick', 'Pitino', 'SJ', '3');
INSERT INTO Coach VALUES('K.WIL', 'Kevin', 'Willard', 'VIL', '1');
INSERT INTO Coach VALUES('G.MCD', 'Greg', 'McDermott', 'CRE', '16');
INSERT INTO Coach VALUES('S.HOL', 'Shaheen', 'Holloway', 'SET', '4');
INSERT INTO Coach VALUES('D.HUR', 'Dan', 'Hurley', 'CON', '6');

--Players (Starting Lineup)

--St John's
INSERT INTO Player VALUES('SELL4', 'Oziyah', 'Sellers', '4', 'Guard', 'Senior', '6-5', '185lb', 'SJ');
INSERT INTO Player VALUES('JAC11', 'Ian', 'Jackson', '11', 'Guard', 'Sophomore', '6-4', '190lb', 'SJ');
INSERT INTO Player VALUES('MITC1', 'Dillon', 'Mitchell', '1', 'Forward', 'Senior', '6-8', '205lb', 'SJ');
INSERT INTO Player VALUES('HOP23', 'Bryce', 'Hopkins', '23', 'Forward', 'Senior', '6-6', '220lb', 'SJ');
INSERT INTO Player VALUES('EJI24', 'Zubi', 'Ejiofor', '24', 'Forward', 'Senior', '6-9', '240lb', 'SJ');

--Villanova
INSERT INTO Player VALUES('LEW55', 'Acaden', 'Lewis', '55', 'Guard', 'Freshman', '6-2', '180lb', 'VIL');
INSERT INTO Player VALUES('LIND3', 'Bryce', 'Lindsay', '2', 'Guard', 'Sophomore', '6-3', '190lb', 'VIL');
INSERT INTO Player VALUES('PERK4', 'Tyler', 'Perkins', '4', 'Guard', 'Junior', '6-4', '205lb', 'VIL');
INSERT INTO Player VALUES('HOD33', 'Matt', 'Hodge', '33', 'Forward', 'Freshman', '6-8', '220lb','VIL');
INSERT INTO Player VALUES('BRE24', 'Duke', 'Brennan', '24', 'Forward', 'Senior', '6-11', '235lb', 'VIL');

--Creighton
INSERT INTO Player VALUES('SWAR1', 'Austin', 'Swartz', '1', 'Guard', 'Sophomore', '6-4', '200lb', 'CRE');
INSERT INTO Player VALUES('DIX4', 'Josh', 'Dix', '4', 'Guard', 'Senior', '6-5', '192lb', 'CRE');
INSERT INTO Player VALUES('DAVI9', 'Ty', 'Davis', '9', 'Guard', 'Sophomore', '6-4', '180lb', 'CRE');
INSERT INTO Player VALUES('GREE0', 'Jasen', 'Green', '0', 'Guard', 'Junior', '6-8', '225lb', 'CRE');
INSERT INTO Player VALUES('TRA41', 'Isaac', 'Traudt', '41', 'Forward', 'Junior', '6-10', '229lb', 'CRE');

--Seton Hall
INSERT INTO Player VALUES('CLAR0', 'Adam', 'Clark', '0', 'Guard', 'Junior', '5-10', '165lb', 'SET');
INSERT INTO Player VALUES('STA14', 'AJ', 'Staton-Mccray', '14', 'Guard', 'Senior', '6-4', '200lb', 'SET');
INSERT INTO Player VALUES('SIMP2', 'Tajuan', 'Simpkins', '2', 'Guard', 'Junior', '6-4', '190lb', 'SET');
INSERT INTO Player VALUES('PAYN6', 'Stephon', 'Payne', '6', 'Forward', 'Senior', '6-9', '235lb', 'SET');
INSERT INTO Player VALUES('FIS22', 'Elijah', 'Fisher', '22', 'Guard', 'Senior', '6-6', '220lb', 'SET');

-- UConn
INSERT INTO Player VALUES('BALL1', 'Solo', 'Ball', '1', 'Guard', 'Junior', '6-4', '200lb', 'CON');
INSERT INTO Player VALUES('DEMA2', 'Silas', 'Demary Jr', '2', 'Guard', 'Junior', '6-4', '195lb', 'CON');
INSERT INTO Player VALUES('STEW3', 'Jaylin', 'Stewart', '3', 'Forward', 'Junior', '6-7', '225lb', 'CON');
INSERT INTO Player VALUES('REED5', 'Tarris', 'Reed Jr', '5', 'Center', 'Senior', '6-11', '265lb', 'CON');
INSERT INTO Player VALUES('KAR11', 'Alex', 'Karaban', '11', 'Forward', 'Senior', '6-8', '230lb', 'CON');

--Games
INSERT INTO Game VALUES('SJ@CRE', DATE '2026-01-10', 'CRE', 'SJ', 73, 90);
INSERT INTO Game VALUES('SJ@VIL', DATE '2026-01-17', 'VIL', 'SJ', 79, 86);
INSERT INTO Game VALUES('SET@SJ', DATE '2026-01-20', 'SJ', 'SET', 65, 60);
INSERT INTO Game VALUES('CON@SJ', DATE '2026-02-06', 'SJ', 'CON', 81, 72);
INSERT INTO Game VALUES('CRE@SJ', DATE '2026-02-21', 'SJ', 'CRE', 81, 52);
INSERT INTO Game VALUES('SJ@CON', DATE '2026-02-25', 'CON', 'SJ', 72, 40);
INSERT INTO Game VALUES('VIL@SJ', DATE '2026-02-28', 'SJ', 'VIL', 89, 57);
INSERT INTO Game VALUES('SJ@SET', DATE '2026-03-06', 'SET', 'SJ', 72, 65);
INSERT INTO Game VALUES('VIL@SET', DATE '2025-12-23', 'SET', 'VIL', 56, 64);
INSERT INTO Game VALUES('CRE@VIL', DATE '2026-01-07', 'VIL', 'CRE', 72, 76);
INSERT INTO Game VALUES('VIL@CON', DATE '2026-01-24', 'CON', 'VIL', 75, 67);
INSERT INTO Game VALUES('SET@VIL', DATE '2026-02-04', 'VIL', 'SET', 72, 60);
INSERT INTO Game VALUES('VIL@CRE', DATE '2026-02-14', 'CRE', 'VIL', 69, 80);
INSERT INTO Game VALUES('CON@VIL', DATE '2026-02-21', 'VIL', 'CON', 63, 73);
INSERT INTO Game VALUES('CRE@SET', DATE '2026-01-04', 'SET', 'CRE', 56, 54);
INSERT INTO Game VALUES('CON@CRE', DATE '2026-01-31', 'CRE', 'CON', 58, 85);
INSERT INTO Game VALUES('SET@CRE', DATE '2026-02-07', 'CRE', 'SET', 69, 68);
INSERT INTO Game VALUES('CRE@CON', DATE '2026-02-18', 'CON', 'CRE', 84, 91);
INSERT INTO Game VALUES('CON@SET', DATE '2026-01-13', 'SET', 'CON', 64, 69);
INSERT INTO Game VALUES('SET@CON', DATE '2026-02-28', 'CON', 'SET', 71, 67); 

--Team Stats By Game

--St. Johns
INSERT INTO Team_Game_Stats VALUES('SJ', 'SJ@CRE', 33, 65, 12, 23, 12, 18, 39, 19, 7, 3, 6, 20);
INSERT INTO Team_Game_Stats VALUES('SJ', 'SJ@VIL', 30, 58, 5, 15, 21, 31, 31, 13, 8, 3, 9, 17);
INSERT INTO Team_Game_Stats VALUES('SJ', 'SET@SJ', 21, 59, 2, 12, 21, 30, 41, 14, 8, 3, 12, 12);
INSERT INTO Team_Game_Stats VALUES('SJ', 'CON@SJ', 27, 54, 5, 19, 22, 31, 32, 16, 9, 3, 10, 15);
INSERT INTO Team_Game_Stats VALUES('SJ', 'CRE@SJ', 29, 63, 3, 14, 20, 23, 44, 20, 10, 6, 11, 17);
INSERT INTO Team_Game_Stats VALUES('SJ', 'SJ@CON', 11, 56, 5, 20, 13, 17, 37, 8, 0, 4, 8, 11);
INSERT INTO Team_Game_Stats VALUES('SJ', 'VIL@SJ', 32, 61, 8, 15, 17, 24, 40, 26, 11, 5, 8, 17);
INSERT INTO Team_Game_Stats VALUES('SJ', 'SJ@SET', 26, 52, 7, 20, 13, 22, 30, 16, 5, 6, 10, 18);

--Villanova
INSERT INTO Team_Game_Stats VALUES('VIL', 'SJ@VIL', 25, 54, 11, 26, 18, 24, 28, 13, 4, 3, 14, 21);
INSERT INTO Team_Game_Stats VALUES('VIL', 'VIL@SJ', 20, 54, 7, 23, 10, 16, 26, 11, 4, 2, 16, 18);
INSERT INTO Team_Game_Stats VALUES('VIL', 'VIL@SET', 22, 45, 10, 23, 10, 16, 38, 9, 4, 3, 18, 18);
INSERT INTO Team_Game_Stats VALUES('VIL', 'CRE@VIL', 29, 66, 6, 24, 8, 11, 30, 14, 4, 2, 6, 15);
INSERT INTO Team_Game_Stats VALUES('VIL', 'VIL@CON', 20, 59, 10, 26, 17, 22, 39, 14, 4, 2, 11, 21);
INSERT INTO Team_Game_Stats VALUES('VIL', 'SET@VIL', 23, 51, 9, 29, 17, 22, 37, 15, 7, 0, 15, 13);
INSERT INTO Team_Game_Stats VALUES('VIL', 'VIL@CRE', 30, 65, 6, 21, 14, 19, 41, 14, 7, 2, 7, 16);
INSERT INTO Team_Game_Stats VALUES('VIL', 'CON@VIL', 24, 59, 6, 24, 9, 14, 24, 12, 8, 4, 10, 14);

--Creighton
INSERT INTO Team_Game_Stats VALUES('CRE', 'SJ@CRE', 23, 50, 10, 26, 17, 20, 26, 12, 4, 2, 9, 18);
INSERT INTO Team_Game_Stats VALUES('CRE', 'CRE@SJ', 17, 53, 6, 22, 12, 18, 30, 12, 6, 3, 18, 19);
INSERT INTO Team_Game_Stats VALUES('CRE', 'CRE@VIL', 29, 58, 7, 23, 11, 16, 39, 10, 3, 3, 8, 12);
INSERT INTO Team_Game_Stats VALUES('CRE', 'VIL@CRE', 27, 65, 8, 27, 7, 12, 41, 16, 5, 1, 12, 15);
INSERT INTO Team_Game_Stats VALUES('CRE', 'CRE@SET', 19, 55, 6, 27, 10, 16, 41, 11, 6, 2, 11, 17);
INSERT INTO Team_Game_Stats VALUES('CRE', 'CON@CRE', 18, 44, 5, 21, 17, 24, 24, 10, 4, 2, 10, 13);
INSERT INTO Team_Game_Stats VALUES('CRE', 'SET@CRE', 23, 53, 13, 30, 10, 12, 30, 14, 6, 5, 18, 12);
INSERT INTO Team_Game_Stats VALUES('CRE', 'CRE@CON', 27, 55, 10, 21, 27, 32, 41, 10, 4, 2, 8, 15);

--Seton Hall
INSERT INTO Team_Game_Stats VALUES('SET', 'SET@SJ', 22, 58, 5, 13, 11, 20, 41, 11, 8, 7, 13, 25);
INSERT INTO Team_Game_Stats VALUES('SET', 'SJ@SET', 23, 56, 1, 11, 18, 27, 36, 8, 5, 4, 9, 17);
INSERT INTO Team_Game_Stats VALUES('SET', 'VIL@SET', 21, 63, 3, 13, 11, 16, 35, 10, 7, 2, 9, 15);
INSERT INTO Team_Game_Stats VALUES('SET', 'SET@VIL', 24, 56, 2, 17, 10, 11, 27, 9, 8, 0, 10, 18);
INSERT INTO Team_Game_Stats VALUES('SET', 'CRE@SET', 19, 53, 2, 7, 16, 19, 34, 11, 8, 5, 8, 15);
INSERT INTO Team_Game_Stats VALUES('SET', 'SET@CRE', 27, 54, 5, 9, 9, 14, 30, 10, 9, 5, 14, 16);
INSERT INTO Team_Game_Stats VALUES('SET', 'CON@SET', 24, 58, 1, 16, 15, 25, 37, 6, 8, 9, 14, 22);
INSERT INTO Team_Game_Stats VALUES('SET', 'SET@CON', 25, 53, 9, 18, 8, 9, 27, 13, 10, 9, 15, 22);

--UConn
INSERT INTO Team_Game_Stats VALUES('CON', 'CON@SJ', 29, 53, 9, 19, 5, 12, 26, 14, 6, 6, 15, 23);
INSERT INTO Team_Game_Stats VALUES('CON', 'SJ@CON', 28, 59, 7, 25, 9, 11, 41, 20, 6, 9, 5, 18);
INSERT INTO Team_Game_Stats VALUES('CON', 'VIL@CON', 25, 61, 8, 22, 17, 22, 42, 17, 5, 1, 9, 18);
INSERT INTO Team_Game_Stats VALUES('CON', 'CON@VIL', 28, 51, 6, 19, 11, 13, 37, 19, 3, 8, 14, 15);
INSERT INTO Team_Game_Stats VALUES('CON', 'CON@CRE', 33, 61, 16, 31, 3, 7, 37, 16, 5, 2, 8, 21);
INSERT INTO Team_Game_Stats VALUES('CON', 'CRE@CON', 31, 71, 11, 30, 11, 18, 35, 21, 7, 4, 5, 21);
INSERT INTO Team_Game_Stats VALUES('CON', 'CON@SET', 25, 49, 3, 17, 16, 26, 34, 14, 8, 6, 17, 21);
INSERT INTO Team_Game_Stats VALUES('CON', 'SET@CON', 21, 46, 9, 21, 20, 29, 30, 17, 9, 3, 15, 10);

--Standings Table

INSERT INTO Big_East_Standings VALUES('1', 'SJ', 18, 2, 30, 7);
INSERT INTO Big_East_Standings VALUES('2', 'CON', 17, 3, 34, 6);
INSERT INTO Big_East_Standings VALUES('3', 'VIL', 15, 5, 24, 9);
INSERT INTO Big_East_Standings VALUES('4', 'SET', 10, 10, 21, 12);
INSERT INTO Big_East_Standings VALUES('5', 'CRE', 9, 11, 16, 18);
