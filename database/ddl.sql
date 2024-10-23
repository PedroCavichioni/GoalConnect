DROP DATABASE IF EXISTS goalconnect;
CREATE DATABASE goalconnect;

/*CREATING TEAM TABLE*/
CREATE TABLE team(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL CHECK (state IN( 'AC', 'AL', 'AP', 'AM', 'BA','CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG',
    'PA', 'PB', 'PR', 'PE', 'PI', 'RJ')),
    photo_url VARCHAR(1024) NOT NULL,
    
    unique(name, state)
);

/*CREATING MATCH TABLE*/
CREATE TABLE match(
    id SERIAL PRIMARY KEY,
    date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    team_one_id INTEGER NOT NULL REFERENCES team(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    score_team_one INTEGER NOT NULL,
    team_two_id INTEGER NOT NULL REFERENCES team(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    score_team_two INTEGER NOT NULL,
    team_suported_id INTEGER NOT NULL REFERENCES team(id) ON UPDATE CASCADE ON DELETE NO ACTION,

    unique(date, team_one_id, team_two_id)
)