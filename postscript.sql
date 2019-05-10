COMMENT ON SCHEMA
    agi_mopublic_pub
IS
    'Vereinfachtes Datenmodell der Daten der amtlichen Vermessung. Fragen: stefan.ziegler@bd.so.ch'
;

GRANT USAGE ON SCHEMA agi_mopublic_pub TO public, ogc_server, sogis_service, gretl;

GRANT SELECT ON ALL TABLES IN SCHEMA agi_mopublic_pub TO public, ogc_server, sogis_service;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA agi_mopublic_pub TO gretl;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA agi_mopublic_pub TO gretl;

CREATE INDEX mopublic_bodenbedeckung_art_txt_idx ON agi_mopublic_pub.mopublic_bodenbedeckung USING btree (art_txt);
CREATE INDEX mopublic_bodenbedeckung_bfsnr_idx ON agi_mopublic_pub.mopublic_bodenbedeckung USING btree (bfs_nr);

CREATE INDEX mopublic_einzelobjekt_flaeche_art_txt_idx ON agi_mopublic_pub.mopublic_einzelobjekt_flaeche USING btree (art_txt);
CREATE INDEX mopublic_einzelobjekt_flaeche_bfsnr_idx ON agi_mopublic_pub.mopublic_einzelobjekt_flaeche USING btree (bfs_nr);

CREATE INDEX mopublic_einzelobjekt_linie_art_txt_idx ON agi_mopublic_pub.mopublic_einzelobjekt_linie USING btree (art_txt);
CREATE INDEX mopublic_einzelobjekt_linie_bfsnr_idx ON agi_mopublic_pub.mopublic_einzelobjekt_linie USING btree (bfs_nr);

CREATE INDEX mopublic_einzelobjekt_punkt_art_txt_idx ON agi_mopublic_pub.mopublic_einzelobjekt_punkt USING btree (art_txt);
CREATE INDEX mopublic_einzelobjekt_punkt_bfsnr_idx ON agi_mopublic_pub.mopublic_einzelobjekt_punkt USING btree (bfs_nr);

CREATE INDEX mopublic_mopublic_fixpunkt_typ_txt_idx ON agi_mopublic_pub.mopublic_fixpunkt USING btree (typ_txt);
CREATE INDEX mopublic_mopublic_fixpunkt_punktzeichen_txt_idx ON agi_mopublic_pub.mopublic_fixpunkt USING btree (punktzeichen_txt);
CREATE INDEX mopublic_mopublic_fixpunkt_bfsnr_idx ON agi_mopublic_pub.mopublic_fixpunkt USING btree (bfs_nr);

CREATE INDEX mopublic_mopublic_flurname_bfsnr_idx ON agi_mopublic_pub.mopublic_flurname USING btree (bfs_nr);

CREATE INDEX mopublic_mopublic_gelaendename_bfsnr_idx ON agi_mopublic_pub.mopublic_gelaendename USING btree (bfs_nr);

CREATE INDEX mopublic_mopublic_gebaeudeadresse_bfsnr_idx ON agi_mopublic_pub.mopublic_gebaeudeadresse USING btree (bfs_nr);

CREATE INDEX mopublic_mopublic_gemeindegrenze_bfsnr_idx ON agi_mopublic_pub.mopublic_gemeindegrenze USING btree (bfs_nr);

CREATE INDEX mopublic_mopublic_grenzpunkt_punktzeichen_txt_idx ON agi_mopublic_pub.mopublic_grenzpunkt USING btree (punktzeichen_txt);
CREATE INDEX mopublic_mopublic_grenzpunkt_bfsnr_idx ON agi_mopublic_pub.mopublic_grenzpunkt USING btree (bfs_nr);

CREATE INDEX mopublic_grundstueck_art_txt_idx ON agi_mopublic_pub.mopublic_grundstueck USING btree (art_txt);
CREATE INDEX mopublic_grundstueck_bfsnr_idx ON agi_mopublic_pub.mopublic_grundstueck USING btree (bfs_nr);
CREATE INDEX mopublic_grundstueck_grundbuch_idx ON agi_mopublic_pub.mopublic_grundstueck USING btree (grundbuch);
CREATE INDEX mopublic_grundstueck_gemeinde_idx ON agi_mopublic_pub.mopublic_grundstueck USING btree (gemeinde);

CREATE INDEX mopublic_strassenachse_strassenname_idx ON agi_mopublic_pub.mopublic_strassenachse USING btree (strassenname);
CREATE INDEX mopublic_strassenachse_bfsnr_idx ON agi_mopublic_pub.mopublic_strassenachse USING btree (bfs_nr);
