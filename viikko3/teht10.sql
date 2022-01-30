1)
SELECT Etunimi, Sukunimi FROM Opiskelija
JOIN Arviointi ON Opiskelija.idOpiskelija = Arviointi.idOpiskelija
WHERE Arvosana=0;

2)
SELECT Etunimi, Sukunimi FROM Opiskelija
JOIN Arviointi ON Opiskelija.idOpiskelija = Arviointi.idOpiskelija
JOIN Opintojakso ON Arviointi.idOpintojakso = Opintojakso.idOpintojakso
WHERE Opintojakso.Nimi = 'Fysiikka 3' AND Arviointi.Arvosana > 0;

3)
SELECT Opintojakso.Nimi FROM Opiskelija
JOIN Arviointi ON Opiskelija.idOpiskelija = Arviointi.idOpiskelija
JOIN Opintojakso ON Arviointi.idOpintojakso = Opintojakso.idOpintojakso
WHERE Opiskelija.Etunimi = 'Anssi' AND Opiskelija.Sukunimi = 'Asukas';

4)
SELECT AVG(Arviointi.Arvosana) FROM Opiskelija
JOIN Arviointi ON Opiskelija.idOpiskelija = Arviointi.idOpiskelija
WHERE Opiskelija.Etunimi = 'Paavo' AND Opiskelija.Sukunimi = 'Pasianssi';


5)
SELECT Opintojakso.Nimi from Opintojakso LEFT JOIN Arviointi ON Opintojakso.idOpintojakso = Arviointi.idOpintojakso WHERE idArviointi IS NULL;
