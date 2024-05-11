-- Creazione della tabella Utenti
CREATE TABLE Utenti (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    DataNascita DATE NOT NULL,
    NomeUtente VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    ImmagineProfilo VARCHAR(255)
);

-- Creazione della tabella Post
CREATE TABLE Post (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UtenteID INT,
    Testo VARCHAR(255),
    Immagine VARCHAR(255),
    Video VARCHAR(255),
    DataOra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UtenteID) REFERENCES Utenti(ID) ON DELETE CASCADE
);

-- Creazione della tabella Commenti
CREATE TABLE Commenti (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT,
    UtenteID INT,
    Testo VARCHAR(255),
    DataOra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Post(ID) ON DELETE CASCADE,
    FOREIGN KEY (UtenteID) REFERENCES Utenti(ID) ON DELETE CASCADE
);
