create database project
use project

-- 1️⃣ Teams Table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    coach VARCHAR(100)
);

-- 2️⃣ Players Table
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- 3️⃣ Stadiums Table
CREATE TABLE Stadiums (
    stadium_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    capacity INT
);

-- 4️⃣ Matches Table
CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    stadium_id INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id)
);

-- 5️⃣ Scores Table
CREATE TABLE Scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT,
    team_id INT,
    points INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- 6️⃣ Standings Table
CREATE TABLE Standings (
    standing_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT,
    matches_played INT DEFAULT 0,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0,
    draws INT DEFAULT 0,
    points INT DEFAULT 0,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);


-- ===============================
-- 1️⃣ TEAMS (10 IPL Teams)
-- ===============================
INSERT INTO Teams (name, coach) VALUES 
('Chennai Super Kings', 'Stephen Fleming'),
('Mumbai Indians', 'Mark Boucher'),
('Royal Challengers Bangalore', 'Andy Flower'),
('Kolkata Knight Riders', 'Chandrakant Pandit'),
('Delhi Capitals', 'Ricky Ponting'),
('Rajasthan Royals', 'Kumar Sangakkara'),
('Sunrisers Hyderabad', 'Daniel Vettori'),
('Punjab Kings', 'Trevor Bayliss'),
('Lucknow Super Giants', 'Justin Langer'),
('Gujarat Titans', 'Ashish Nehra');

-- ===============================
-- 2️⃣ PLAYERS (~100 Players)
-- ===============================
-- CSK Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('MS', 'Dhoni', 'Wicketkeeper', 1),
('Ruturaj', 'Gaikwad', 'Batsman', 1),
('Deepak', 'Chahar', 'Bowler', 1),
('Ravindra', 'Jadeja', 'All-Rounder', 1),
('Devon', 'Conway', 'Batsman', 1),
('Moeen', 'Ali', 'All-Rounder', 1),
('Matheesha', 'Pathirana', 'Bowler', 1),
('Ajinkya', 'Rahane', 'Batsman', 1),
('Tushar', 'Deshpande', 'Bowler', 1),
('Prashant', 'Solanki', 'Bowler', 1);

-- MI Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Rohit', 'Sharma', 'Batsman', 2),
('Ishan', 'Kishan', 'Wicketkeeper', 2),
('Suryakumar', 'Yadav', 'Batsman', 2),
('Tilak', 'Varma', 'Batsman', 2),
('Hardik', 'Pandya', 'All-Rounder', 2),
('Jasprit', 'Bumrah', 'Bowler', 2),
('Piyush', 'Chawla', 'Bowler', 2),
('Tim', 'David', 'All-Rounder', 2),
('Dewald', 'Breviss', 'Batsman', 2),
('Arjun', 'Tendulkar', 'Bowler', 2);

-- RCB Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Virat', 'Kohli', 'Batsman', 3),
('Faf', 'du Plessis', 'Batsman', 3),
('Glenn', 'Maxwell', 'All-Rounder', 3),
('Mohammed', 'Siraj', 'Bowler', 3),
('Dinesh', 'Karthik', 'Wicketkeeper', 3),
('Rajat', 'Patidar', 'Batsman', 3),
('Mahipal', 'Lomror', 'All-Rounder', 3),
('Cameron', 'Green', 'All-Rounder', 3),
('Will', 'Jacks', 'Batsman', 3),
('Reece', 'Topley', 'Bowler', 3);

-- KKR Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Shreyas', 'Iyer', 'Batsman', 4),
('Andre', 'Russell', 'All-Rounder', 4),
('Sunil', 'Narine', 'All-Rounder', 4),
('Nitish', 'Rana', 'Batsman', 4),
('Rinku', 'Singh', 'Batsman', 4),
('Rahmanullah', 'Gurbaz', 'Wicketkeeper', 4),
('Venkatesh', 'Iyer', 'All-Rounder', 4),
('Shardul', 'Thakur', 'All-Rounder', 4),
('Lockie', 'Ferguson', 'Bowler', 4),
('Varun', 'Chakravarthy', 'Bowler', 4);

-- DC Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Rishabh', 'Pant', 'Wicketkeeper', 5),
('David', 'Warner', 'Batsman', 5),
('Prithvi', 'Shaw', 'Batsman', 5),
('Axar', 'Patel', 'All-Rounder', 5),
('Kuldeep', 'Yadav', 'Bowler', 5),
('Anrich', 'Nortje', 'Bowler', 5),
('Lalit', 'Yadav', 'All-Rounder', 5),
('Mitchell', 'Marsh', 'All-Rounder', 5),
('Khaleel', 'Ahmed', 'Bowler', 5),
('Ishant', 'Sharma', 'Bowler', 5);

-- RR Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Sanju', 'Samson', 'Wicketkeeper', 6),
('Jos', 'Buttler', 'Batsman', 6),
('Yashasvi', 'Jaiswal', 'Batsman', 6),
('Riyan', 'Parag', 'All-Rounder', 6),
('Trent', 'Boult', 'Bowler', 6),
('Shimron', 'Hetmyer', 'Batsman', 6),
('Ravichandran', 'Ashwin', 'All-Rounder', 6),
('Yuzvendra', 'Chahal', 'Bowler', 6),
('Adam', 'Zampa', 'Bowler', 6),
('Navdeep', 'Saini', 'Bowler', 6);

-- SRH Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Aiden', 'Markram', 'Batsman', 7),
('Rahul', 'Tripathi', 'Batsman', 7),
('Abhishek', 'Sharma', 'All-Rounder', 7),
('Mayank', 'Agarwal', 'Batsman', 7),
('Heinrich', 'Klaasen', 'Wicketkeeper', 7),
('Umran', 'Malik', 'Bowler', 7),
('Bhuvneshwar', 'Kumar', 'Bowler', 7),
('T Natarajan', '', 'Bowler', 7),
('Marco', 'Jansen', 'All-Rounder', 7),
('Washington', 'Sundar', 'All-Rounder', 7);

-- PBKS Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Shikhar', 'Dhawan', 'Batsman', 8),
('Liam', 'Livingstone', 'All-Rounder', 8),
('Sam', 'Curran', 'All-Rounder', 8),
('Arshdeep', 'Singh', 'Bowler', 8),
('Jonny', 'Bairstow', 'Wicketkeeper', 8),
('Kagiso', 'Rabada', 'Bowler', 8),
('Shahrukh', 'Khan', 'Batsman', 8),
('Rishi', 'Dhawan', 'All-Rounder', 8),
('Rahul', 'Chahar', 'Bowler', 8),
('Harpreet', 'Brar', 'Bowler', 8);

-- LSG Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('KL', 'Rahul', 'Wicketkeeper', 9),
('Quinton', 'de Kock', 'Wicketkeeper', 9),
('Marcus', 'Stoinis', 'All-Rounder', 9),
('Deepak', 'Hooda', 'All-Rounder', 9),
('Avesh', 'Khan', 'Bowler', 9),
('Krunal', 'Pandya', 'All-Rounder', 9),
('Mark', 'Wood', 'Bowler', 9),
('Nicholas', 'Pooran', 'Wicketkeeper', 9),
('Kyle', 'Mayers', 'All-Rounder', 9),
('Ravi', 'Bishnoi', 'Bowler', 9);

-- GT Players
INSERT INTO Players (first_name, last_name, position, team_id) VALUES
('Shubman', 'Gill', 'Batsman', 10),
('David', 'Miller', 'Batsman', 10),
('Rashid', 'Khan', 'Bowler', 10),
('Wriddhiman', 'Saha', 'Wicketkeeper', 10),
('Mohammed', 'Shami', 'Bowler', 10),
('Rahul', 'Tewatia', 'All-Rounder', 10),
('Sai', 'Sudharsan', 'Batsman', 10),
('Kane', 'Williamson', 'Batsman', 10),
('Noor', 'Ahmed', 'Bowler', 10),
('Joshua', 'Little', 'Bowler', 10);

-- ===============================
-- 3️⃣ STADIUMS
-- ===============================
INSERT INTO Stadiums (name, location, capacity) VALUES
('MA Chidambaram Stadium', 'Chennai', 50000),
('Wankhede Stadium', 'Mumbai', 33000),
('M Chinnaswamy Stadium', 'Bangalore', 40000),
('Eden Gardens', 'Kolkata', 68000),
('Arun Jaitley Stadium', 'Delhi', 41000),
('Sawai Mansingh Stadium', 'Jaipur', 30000),
('Rajiv Gandhi Intl Stadium', 'Hyderabad', 55000),
('IS Bindra Stadium', 'Mohali', 28000),
('BRSABV Ekana Stadium', 'Lucknow', 50000),
('Narendra Modi Stadium', 'Ahmedabad', 132000);

-- ===============================
-- 4️⃣ MATCHES (~30 Matches)
-- ===============================
INSERT INTO Matches (home_team_id, away_team_id, match_date, stadium_id) VALUES
(1, 2, '2025-03-25', 1),
(3, 4, '2025-03-26', 2),
(5, 6, '2025-03-27', 3),
(7, 8, '2025-03-28', 4),
(9, 10, '2025-03-29', 5),
(1, 4, '2025-04-01', 6),
(2, 5, '2025-04-02', 7),
(3, 6, '2025-04-03', 8),
(4, 7, '2025-04-04', 9),
(5, 8, '2025-04-05', 10),
(6, 9, '2025-04-06', 1),
(7, 10, '2025-04-07', 2),
(1, 5, '2025-04-08', 3),
(2, 6, '2025-04-09', 4),
(3, 7, '2025-04-10', 5),
(4, 8, '2025-04-11', 6),
(5, 9, '2025-04-12', 7),
(6, 10, '2025-04-13', 8),
(1, 6, '2025-04-14', 9),
(2, 7, '2025-04-15', 10),
(3, 8, '2025-04-16', 1),
(4, 9, '2025-04-17', 2),
(5, 10, '2025-04-18', 3),
(1, 7, '2025-04-19', 4),
(2, 8, '2025-04-20', 5),
(3, 9, '2025-04-21', 6),
(4, 10, '2025-04-22', 7),
(1, 8, '2025-04-23', 8),
(2, 9, '2025-04-24', 9),
(3, 10, '2025-04-25', 10);


INSERT INTO Scores (match_id, team_id, points) VALUES
(1, 1, 180), (1, 2, 175),
(2, 3, 190), (2, 4, 165),
(3, 5, 170), (3, 6, 172),
(4, 7, 160), (4, 8, 155),
(5, 9, 185), (5, 10, 180),
(6, 1, 170), (6, 4, 150),
(7, 2, 165),
(7, 5, 155),
(8, 3, 170),
(8, 6, 160),
(9, 4, 175),
(9, 7, 165),
(10, 5, 180),
(10, 8, 170),
(11, 6, 175),
(11, 9, 165),
(12, 7, 180),
(12, 10, 175),
(13, 1, 165),
(13, 5, 155),
(14, 2, 170),
(14, 6, 160),
(15, 3, 175),
(15, 7, 165),
(16, 4, 180),
(16, 8, 170),
(17, 5, 175),
(17, 9, 165),
(18, 6, 180),
(18, 10, 170),
(19, 1, 175),
(19, 6, 165),
(20, 2, 180),
(20, 7, 170),
(21, 3, 185),
(21, 8, 175),
(22, 4, 180),
(22, 9, 170),
(23, 5, 185),
(23, 10, 175),
(24, 1, 180),
(24, 7, 170),
(25, 2, 185),
(25, 8, 175),
(26, 3, 180),
(26, 9, 170),
(27, 4, 185),
(27, 10, 175),
(28, 1, 180),
(28, 8, 170),
(29, 2, 185),
(29, 9, 175),
(30, 3, 190),
(30, 10, 180);


-- Standings for each team
INSERT INTO Standings (team_id, matches_played, wins, losses, draws, points) VALUES
(1, 6, 4, 2, 0, 8),
(2, 6, 3, 3, 0, 6),
(3, 6, 5, 1, 0, 10),
(4, 6, 2, 4, 0, 4),
(5, 6, 3, 3, 0, 6),
(6, 6, 4, 2, 0, 8),
(7, 6, 2, 4, 0, 4),
(8, 6, 1, 5, 0, 2),
(9, 6, 5, 1, 0, 10),
(10, 6, 2, 4, 0, 4);



----QUERY

---SHOW ALL TEAMS:

SELECT * FROM teams

---show all player with their team names:

select p.player_id,p.first_name,p.last_name,t.name
from players as p
join teams as t on t.team_id=p.team_id

---Find all matches with home and away team names

SELECT 
  m.match_id,
  ht.name AS home_team,
  at.name AS away_team,
  m.match_date,
  s.name AS stadium
FROM Matches m
JOIN Teams ht ON m.home_team_id = ht.team_id
JOIN Teams at ON m.away_team_id = at.team_id
JOIN Stadiums s ON m.stadium_id = s.stadium_id;

-- Show all stadiums with capacity greater than 40000:

select * from stadiums where capacity > 40000

----List players who are bowlers:
select first_name,last_name from players where position="bowler"

-- Count number of players per team:

SELECT 
  t.name AS team_name,
  COUNT(p.player_id) AS total_players
FROM Teams t
LEFT JOIN Players p ON t.team_id = p.team_id
GROUP BY t.name;

---Find total matches played in each stadium

SELECT 
  s.name AS stadium_name,
  COUNT(m.match_id) AS total_matches
FROM Stadiums s
JOIN Matches m ON s.stadium_id = m.stadium_id
GROUP BY s.name;

--Get total points scored by each team:

SELECT 
  t.name AS team_name,
  SUM(sc.points) AS total_points
FROM Teams t
JOIN Scores sc ON t.team_id = sc.team_id
GROUP BY t.name
ORDER BY total_points DESC;

---Get teams with more than 8 players:

SELECT 
  t.name,
  COUNT(p.player_id) AS player_count
FROM Teams t
JOIN Players p ON t.team_id = p.team_id
GROUP BY t.team_id
HAVING COUNT(p.player_id) > 8;

 Get all matches where total score exceeded 350:

SELECT 
  m.match_id,
  m.match_date,
  SUM(sc.points) AS total_points
FROM Matches m
JOIN Scores sc ON m.match_id = sc.match_id
GROUP BY m.match_id
HAVING SUM(sc.points) > 350;

--Subquery: Find players in teams with more than 8 players:
SELECT 
  first_name, last_name
FROM Players
WHERE team_id IN (
  SELECT team_id
  FROM Players
  GROUP BY team_id
  HAVING COUNT(player_id) > 8
);

--Get match count for each team (as home):

SELECT 
  t.name AS team_name,
  COUNT(m.match_id) AS home_matches
FROM Teams t
JOIN Matches m ON t.team_id = m.home_team_id
GROUP BY t.team_id;

-- Find top 3 teams by standings points:

SELECT 
  t.name, s.points
FROM Standings s
JOIN Teams t ON s.team_id = t.team_id
ORDER BY s.points DESC
LIMIT 3;

---Update a team’s coach:

UPDATE Teams
SET coach = 'kieron pollard'
WHERE name = 'Mumbai Indians';

--Find players who are not all-rounders:

SELECT first_name, last_name 
FROM Players 
WHERE position <> 'All-Rounder';

-- Get average score per team:

SELECT 
  t.name,
  AVG(sc.points) AS avg_points
FROM Teams t
JOIN Scores sc ON t.team_id = sc.team_id
GROUP BY t.name;

-- Find teams who have never won any match (wins = 0):
SELECT 
  t.name 
FROM Standings s
JOIN Teams t ON s.team_id = t.team_id
WHERE s.wins = 0;

-- List matches played by Chennai Super Kings:

SELECT 
  m.match_id,
  m.match_date,
  s.name AS stadium
FROM Matches m
JOIN Stadiums s ON m.stadium_id = s.stadium_id
WHERE m.home_team_id = 1 OR m.away_team_id = 1;

--Find teams who scored more than 180 in any match:

SELECT DISTINCT t.name
FROM Teams t
JOIN Scores s ON t.team_id = s.team_id
WHERE s.points > 180;

------SUBQUERY:
---Find the names of players whose team coach is 'Stephen Fleming':

SELECT 
  first_name,
  last_name
FROM Players
WHERE team_id = (
  SELECT team_id
  FROM Teams
  WHERE coach = 'Stephen Fleming'
);

-- Find teams that have never hosted a match:

SELECT 
  name
FROM Teams
WHERE team_id NOT IN (
  SELECT DISTINCT home_team_id
  FROM Matches
);

--Procedure: Get all players for a team by team name:

CALL GetPlayersByTeamName('Chennai Super Kings');

--Procedure: Insert a new player
CALL AddNewPlayer('Test', 'Player', 'Batsman', 1);

SELECT*FROM PLAYERS