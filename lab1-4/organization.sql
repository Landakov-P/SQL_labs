CREATE TABLE Disciplines (
    DisciplineID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Description TEXT
);

CREATE TABLE Teams (
    TeamID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    DisciplineID INTEGER,
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID)
);

CREATE TABLE Participants (
    ParticipantID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Age INTEGER,
    TeamID INTEGER,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Competitions (
    CompetitionID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Date DATE,
    DisciplineID INTEGER,
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID)
);

CREATE TABLE TeamResults (
    ResultID SERIAL PRIMARY KEY,
    CompetitionID INTEGER,
    TeamID INTEGER,
    Score INTEGER,
    FOREIGN KEY (CompetitionID) REFERENCES Competitions(CompetitionID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE IndividualAchievements (
    AchievementID SERIAL PRIMARY KEY,
    ParticipantID INTEGER,
    Description TEXT,
    Date DATE,
    Score INTEGER,
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID)
);
