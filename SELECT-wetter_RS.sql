-- Wetterdaten DML

-- 1. Erstellen Sie eine Liste mit den vollständigen Tupeln (Datensätze) aller Wetterstation
SELECT * FROM Wetterstation;

-- 2. Erstellen Sie eine nach der Höhe sortierte Standort-Liste (Listenausgabe nur der Standorte).
SELECT Standort FROM Wetterstation ORDER BY Hoehe;

-- 3. Erstellen Sie eine nach den Standorten alphabetisch absteigende (beginnend bei Z) Liste mit den Attributen Standort sowie den beiden geografischen Koordinaten.
SELECT Standort, Geo_Breite, Geo_Laenge FROM Wetterstation ORDER BY Standort DESC;

-- 4. Erstellen Sie eine Abfrage, welche gleichzeitig das Datum der ersten und der letzten Messung ausgibt.
SELECT MIN(datum), MAX(datum) FROM wettermessung;

-- 5.Erstellen Sie eine Abfrage, welche die Anzahl verschiedener Messtage ausgibt. Die Ausgabespalte soll dabei mit „Anzahl Messtage“ beschriftet sein.
SELECT COUNT(DISTINCT datum) AS 'Anzahl Messtage' FROM wettermessung;

-- 6.Wie lange war die durchschnittliche Sonnenscheindauer aller Stationen während der beiden Monate Juli und August 2017? Achtung, das Datum kann abweichen, je nach dem welchen Stand Sie eingelesen haben.
SELECT AVG (sonnenscheindauer) 'Durchschnittl. Sonnenschein' FROM wettermessung WHERE datum BETWEEN '2017-07-01' AND '2017-08-31';

-- 7.Über wie viele Wetterstationen verfügen die einzelnen Betreiber? Geben Sie in der Ausgabe den Betreiber und die jeweilige Anzahl aus.
SELECT betreiber, COUNT(betreiber) AS 'Anzahl Stationen' FROM wetterstation GROUP BY betreiber;

-- 8.Erstellen Sie eine Abfrage, welche alle Wettermessungen ausgibt, welche die Angaben über die Niederschlagshoehe grösser als 0 verfügen.
SELECT * FROM wettermessung WHERE niederschlagshoehe > 0;


-- 9.Welche Wetterstation weist die grösste Differenz zwischen der geringsten Tiefsttemperatur und der maximalen Höchsttemperatur 2m über 
-- dem Boden über alle Messdaten hinweg aus und wie gross ist diese Temperatur? 
-- Geben Sie eine Liste aller Wetterstationen aus, geordnet nach der Temperaturdifferenz, beginnend mit der Grössten. 
-- Die Ausgabespalte der Temperaturdifferenz soll dabei mit „Max. Temperaturdifferenz“ beschriftet sein.
SELECT Stations_ID, MAX(max_2m)-MIN(min_2m) AS 'Max. Temp.differenz' FROM wettermessung
GROUP BY Stations_ID
ORDER BY (MAX(max_2m)-MIN(min_2m)) DESC;

-- 10.Erstellen Sie eine Liste, welche die Stations_ID sowie die zugehörige, absteigend sortierte, 
-- durchschnittliche Datenqualität über den gesamten Messzeitraum ausgibt. 
-- Als zweites Kriterium soll die Liste auch noch aufsteigend nach der Stations_ID sortiert sein.
SELECT stations_ID, AVG(qualitaet) FROM wettermessung
GROUP BY stations_ID
ORDER BY AVG(qualitaet) DESC, stations_ID;

-- 11.Gesucht ist der gesamte Wetterstation-Tupel (Datensatz) der nördlichsten Wetterstation.
SELECT * FROM wetterstation
WHERE Geo_Breite = (SELECT MIN(geo_breite) FROM wetterstation);

-- 12.Gesucht sind die Stations_ID und die entsprechende Temperatur, für welche die höchste jemals gemessene Temperatur 2m über Boden gemessen wurde.
USE wetterdaten;
SELECT stations_ID, max_2m FROM wettermessung
WHERE max_2m = (SELECT MAX(max_2m) FROM wettermessung);

-- 13.Laden Sie Ihre SQL-Datei auf die Lernplattform.country