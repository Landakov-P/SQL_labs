CREATE TABLE Disciplines (
    DisciplineID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Description TEXT
);

CREATE TABLE Teams (
    TeamID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    DisciplineID INTEGER,
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID)
);

CREATE TABLE Participants (
    ParticipantID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Age INTEGER,
    TeamID INTEGER,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Competitions (
    CompetitionID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Date DATE,
    DisciplineID INTEGER,
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID)
);

CREATE TABLE TeamResults (
    ResultID INTEGER PRIMARY KEY,
    CompetitionID INTEGER,
    TeamID INTEGER,
    Score INTEGER,
    FOREIGN KEY (CompetitionID) REFERENCES Competitions(CompetitionID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE IndividualAchievements (
    AchievementID INTEGER PRIMARY KEY,
    ParticipantID INTEGER,
    Description TEXT,
    Date DATE,
    Score INTEGER,
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID)
);
