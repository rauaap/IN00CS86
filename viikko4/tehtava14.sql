c)
CREATE PROCEDURE `myohassaLainaajat` ()

BEGIN
    SELECT k.idKirja, t.Nimi, a.Etunimi, a.Sukunimi FROM Kirja k
    JOIN Teos t ON k.idTeos = t.idTeos
    JOIN Lainaus l ON k.idKirja = l.idKirja
    JOIN Asiakas a ON a.idAsiakas = l.idAsiakas
    WHERE l.PalautusPVM < CURRENT_DATE() AND l.Palautettu = FALSE;
END

d)
CREATE PROCEDURE `lisaaSuoritus` (
	etunimi VARCHAR(45),
    sukunimi VARCHAR(45),
    opintojaksoKoodi VARCHAR(45),
    arvosana INT
)
Aliohjelma:BEGIN
	DECLARE opiskelijaID INT DEFAULT 0;
    DECLARE opintojaksoID INT DEFAULT 0;

    IF arvosana < 0 OR arvosana > 5 THEN
		SELECT 'Arvosana ei ole välillä 0-5';
        LEAVE Aliohjelma;
    END IF;

    SELECT idOpiskelija INTO opiskelijaID FROM Opiskelija
    WHERE Opiskelija.Etunimi = etunimi AND Opiskelija.Sukunimi = sukunimi;
    IF opiskelijaID = 0 THEN
		SELECT 'Oppilasta ei ole tietokannassa';
		LEAVE Aliohjelma;
	END IF;

    SELECT idOpintojakso INTO opintojaksoID FROM Opintojakso
    WHERE Opintojakso.Koodi = opintojaksoKoodi;
    IF opintojaksoID = 0 THEN
		SELECT 'Opintojakson koodilla ei löydy opintojaksoa';
        LEAVE Aliohjelma;
	END IF;

    INSERT INTO Arviointi VALUES (
		NULL,
        CURRENT_DATE(),
        arvosana,
        opiskelijaID,
        opintojaksoID
	);
END

e)
CREATE PROCEDURE `poistaSuoritus` (
	etunimi VARCHAR(45),
    sukunimi VARCHAR(45),
    opintojaksoKoodi VARCHAR(45)
)
Aliohjelma:BEGIN
	DECLARE opiskelijaID INT DEFAULT 0;
    DECLARE opintojaksoID INT DEFAULT 0;
    DECLARE arviointiID INT DEFAULT 0;

    SELECT idOpiskelija INTO opiskelijaID FROM Opiskelija
    WHERE Opiskelija.Etunimi = etunimi AND Opiskelija.Sukunimi = sukunimi;

    SELECT idOpintojakso INTO opintojaksoID FROM Opintojakso
    WHERE Opintojakso.Koodi = opintojaksoKoodi;

    SELECT idArviointi INTO arviointiID FROM Arviointi a
    WHERE a.idOpiskelija = opiskelijaID
    AND a.idOpintojakso = opintojaksoID;

    IF arviointiID = 0 THEN
		SELECT 'Näillä tiedoilla ei löydy suoritusta';
        LEAVE Aliohjelma;
    END IF;

    DELETE FROM Arviointi WHERE idArviointi = arviointiID;

END
