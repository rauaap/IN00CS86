use t8blaa04;

INSERT INTO Asiakas VALUES (NULL, 'Essi', 'Esimerkki', NULL, '040-1111111');
SET @essiID := LAST_INSERT_ID();
INSERT INTO Asiakas VALUES (NULL, 'Paavo', 'Pasianssi', 'Osoite 123', NULL);
SET @paavoID := LAST_INSERT_ID();

INSERT INTO Teos VALUES
    (NULL, 'Pasianssin strategia', '123456789')
;
SET @tID := LAST_INSERT_ID();

INSERT INTO Tekija VALUES (NULL, 'Jones', 'Hackman');
SET @jonesID := LAST_INSERT_ID();
INSERT INTO Tekija VALUES (NULL, 'Anthony', 'Hackman');
SET @anthonyID := LAST_INSERT_ID();

INSERT INTO Tekija_Teos VALUES
    (@jonesID, @tID),
    (@anthonyID, @tID)
;

INSERT INTO Kirja VALUES (NULL, @tID, 'Tietokirja');
SET @paavonLainaamaID := LAST_INSERT_ID();
INSERT INTO Kirja VALUES (NULL, @tID, 'Tietokirja');
SET @essinLainaamaID := LAST_INSERT_ID();

INSERT INTO Lainaus VALUES
    (NULL, '2022-02-01', '2022-02-10', @essiID, @essinLainaamaID, FALSE),
    (NULL, '2022-01-15', '2022-02-01', @paavoID, @paavonLainaamaID, FALSE)
;
