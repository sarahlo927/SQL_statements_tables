IF OBJECT_ID('ActressMovie') IS NOT NULL DROP TABLE ActressMovie;
IF OBJECT_ID('Movie') IS NOT NULL DROP TABLE Movie;
IF OBJECT_ID('Actress') IS NOT NULL DROP TABLE Actress;

CREATE TABLE Actress (
	actressId	Integer		NOT NULL,
	name		Char(50)	NOT NULL,
	agentEmail	Char(50)	NOT NULL,
	CONSTRAINT	ActressPk	PRIMARY KEY(actressId)
	);
CREATE TABLE Movie (
	movieId		Integer		NOT NULL,
	title		Char(100)	NOT NULL,
	yearReleased	Char(4)	NOT NULL,
	totalRevenue Float		NOT NULL,
	CONSTRAINT	MoviePk		PRIMARY KEY(movieId)
	);
CREATE TABLE ActressMovie (
	actressId	Integer		NOT NULL,
	movieId		Integer		NOT NULL,
	CONSTRAINT	ActressMoviePk	PRIMARY KEY(actressId, movieId),
	CONSTRAINT	ActressFk	FOREIGN KEY(actressId)	REFERENCES Actress(actressId),
	CONSTRAINT	MovieFk		FOREIGN KEY(movieId)	REFERENCES Movie(movieId)
	);

INSERT INTO Actress (actressId, name, agentEmail)
	VALUES(1, 'Zoe Saldana', 'amara@bigbigtalent.com'),
	(2, 'Scarlett Johansson','tallulah@genericagency.com'),
	(3, 'Emma Watson', 'cho@leadingtalentagency.com'),
	(4, 'Letitia Wright', 'adira@hollywoodtalent.com'),
	(5, 'Emma Thompston', 'fatima@uktalentstars.co.uk')
	;
INSERT INTO Movie (movieId, title, yearReleased, totalRevenue)
	VALUES(101, 'Avatar', 2009, 2787965087),
	(102, 'Avengers:Endgame', 2019,	2797800564),
	(103, 'Ready Player One', 2018, 579278642),
	(104, 'Harry Potter and the Deathly Hallows: Part II', 2011, 1341656673),
	(105, 'Beauty and the Beast', 2017, 1263204500)
	;
INSERT INTO ActressMovie (actressId,movieId)
	VALUES(2, 102),
	(4, 103),
	(3, 105),
	(1, 101),
	(4, 102),
	(5, 105),
	(1, 102),
	(3, 104),
	(5, 104)
	;
	
SELECT a.actressId, AVG(totalRevenue) AS avgtotalRevenue
FROM Actress AS a INNER JOIN ActressMovie AS am ON a.actressId = am.actressId INNER JOIN Movie AS m ON m.movieId=am.movieId
GROUP BY a.actressId
ORDER BY avgtotalRevenue DESC
