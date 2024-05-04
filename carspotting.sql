-- Creazione della tabella Utenti
CREATE TABLE Utenti (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT NOT NULL,
    Password TEXT NOT NULL,
    ImmagineProfilo TEXT, -- Aggiunto campo per l'immagine del profilo dell'utente
    -- Altri campi pertinenti
);

-- Creazione della tabella Post
CREATE TABLE Post (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Utente INTEGER,
    Titolo TEXT NOT NULL,
    Contenuto TEXT NOT NULL,
    Immagine TEXT, -- Presumo che l'immagine sia memorizzata come un URL o un percorso
    FOREIGN KEY (ID_Utente) REFERENCES Utenti(ID)
    -- Altri campi pertinenti
);

-- Creazione della tabella Commenti
CREATE TABLE Commenti (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Utente INTEGER,
    ID_Post INTEGER,
    Contenuto TEXT NOT NULL,
    FOREIGN KEY (ID_Utente) REFERENCES Utenti(ID),
    FOREIGN KEY (ID_Post) REFERENCES Post(ID)
    -- Altri campi pertinenti
);

-- Creazione della tabella Follower
CREATE TABLE Follower (
    ID_Utente INTEGER,
    ID_Utente_Seguito INTEGER,
    FOREIGN KEY (ID_Utente) REFERENCES Utenti(ID),
    FOREIGN KEY (ID_Utente_Seguito) REFERENCES Utenti(ID),
    PRIMARY KEY (ID_Utente, ID_Utente_Seguito)
    -- Altri campi pertinenti
);

-- Creazione della tabella Post_Salvati
CREATE TABLE Post_Salvati (
    ID_Utente INTEGER,
    ID_Post INTEGER,
    FOREIGN KEY (ID_Utente) REFERENCES Utenti(ID),
    FOREIGN KEY (ID_Post) REFERENCES Post(ID),
    PRIMARY KEY (ID_Utente, ID_Post)
    -- Altri campi pertinenti
);

SELECT Post.ID, Post.Titolo, Post.Contenuto, Post.Immagine, Utenti.Nome AS NomeUtente, Utenti.ImmagineProfilo AS ImmagineProfiloUtente
FROM Post
JOIN Utenti ON Post.ID_Utente = Utenti.ID;

