# MOpublic
Es wird bei den Fixpunkten ein Koordinatenattribut hinzugefügt, damit bei der Abfrage im Web GIS Client die Koordinate **ohne** speziellen "Tooltip" in Erfahrung gebracht werden kann. Besser wäre wenn es es möglich wäre wie im QGIS Desktop sogenannte "derived" Attribute anzuzeigen.

Gleichzeitig müssen die Queries an den neuen AV-Import angepasst werden, z.B. leicht andere Attribut- und Tabellennamen, andere Verbindungsparameter (edit statt sogis-DB), Segmentieren der Kreisbogen, ...

Bei den Aufzähltypen wird das Attribut mit den Integer-Werten gelöscht. Vor der Einführung muss abgeklärt werden, wo es damit Probleme geben könnten. In den QML werden anscheinend immer (?) die Aufzähltypnamen verwenden. Jedoch heisst das Attribut dann anders (z.B. nicht mehr `art_txt`, sondern nur noch `art`)

Im gretjobs-Repo wurde ein Branch erstellt: `agi_mopublic_new_data_import`.

## Entwicklung
Es wird eine lokale Vagrant-Maschine mit _einer_ DB (`edit`) verwendet. Mit dem GRETL-Dockerimage werden die Daten umgebaut und transferiert.

### ili2pg
```
java -jar /Users/stefan/apps/ili2pg-4.0.0/ili2pg-4.0.0.jar \
--dbschema agi_mopublic_pub --models SO_MOpublic_20190424 --modeldir ".;http://models.geo.admin.ch" \
--defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript agi_mopublic_20190424.sql
```
### GRETL
```
export DB_URI_SOGIS=jdbc:postgresql://192.168.50.8:5432/edit
export DB_USER_SOGIS=ddluser
export DB_PWD_SOGIS=ddluser

export DB_URI_EDIT=jdbc:postgresql://192.168.50.8:5432/edit
export DB_USER_EDIT=ddluser
export DB_PWD_EDIT=ddluser

export DB_URI_PUB=jdbc:postgresql://192.168.50.8:5432/edit
export DB_USER_PUB=ddluser
export DB_PWD_PUB=ddluser

./scripts/start-gretl.sh --docker-image sogis/gretl-runtime:production --job-directory /Users/stefan/sources/gretljobs_agi_mopublic_new_data_import/agi_mopublic_pub/
```



## Einführung
- QML in AGDI anpassen wegen `art_txt` -> `art`.
- Auf Pub und Edit resp. auch noch sogis-DB?
- PLZ/Ortschaft muss auch in Edit-DB importiert werden. Varianten? Im Gretl-Skript einfach 2x importieren? Ich habe den Job bei mir einfach so laufen lassen. Scheint tadellos zu funktionieren.
(
java -jar /Users/stefan/apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --models PLZOCH1LV95D --dbschema agi_plz_ortschaften --schemaimport

)

- ...