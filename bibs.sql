-- Database: bibs

-- DROP DATABASE bibs;

CREATE DATABASE bibs
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Argentina.1252'
       LC_CTYPE = 'Spanish_Argentina.1252'
       CONNECTION LIMIT = -1;

--DROP TABLE public.whoscored_match_report

CREATE TABLE public.whoscored_match_report
(
country character varying(20) NOT NULL,
liga character varying(20) NOT NULL,
temporada character varying(20) NOT NULL,
idmatch integer NOT NULL,
fecha timestamp NULL,
equipol character varying(50) NOT NULL,
equipov character varying(50) NOT NULL,
fulltime character varying(15) NOT NULL,
golesl numeric(2,0) NOT NULL,
golesv numeric(2,0) NOT NULL,
goleshalftimel numeric(2,0) NOT NULL,
goleshalftimev numeric(2,0) NOT NULL,
tirosl numeric(2,0) NOT NULL,
tirosv numeric(2,0) NOT NULL,
tirospuertal numeric(2,0) NOT NULL,
tirospuertav numeric(2,0) NOT NULL,
posesionl numeric(5,2) NOT NULL,
posesionv numeric(5,2) NOT NULL,
porexitosopasesl numeric(2,0) NULL,
porexitosopasesv numeric(2,0) NULL,
dribleswonl numeric(3,0) NULL,
dribleswonv numeric(3,0) NULL,
aerialduelsuccessl numeric(3,0) NULL,
aerialduelsuccessv numeric(3,0) NULL,
fechalote timestamp NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.whoscored_match_report
  OWNER TO postgres;



-- Function: public.ins_json(boolean, character varying, integer, integer, integer)

-- DROP FUNCTION public.ins_json(boolean, character varying, integer, integer, integer);

CREATE OR REPLACE FUNCTION public.import_ws_reportmatches(
	_country character varying(20),
	_liga character varying(20),
	_temporada character varying(20),
	_idmatch integer,
	_fecha timestamp ,
	_equipol character varying(50),
	_equipov character varying(50),
	_fulltime character varying(15),
	_golesl numeric(2,0),
	_golesv numeric(2,0),
	_goleshalftimel numeric(2,0),
	_goleshalftimev numeric(2,0),
	_tirosl numeric(2,0),
	_tirosv numeric(2,0),
	_tirospuertal numeric(2,0),
	_tirospuertav numeric(2,0),
	_posesionl numeric(5,2),
	_posesionv numeric(5,2),
	_porexitosopasesl numeric(2,0) ,
	_porexitosopasesv numeric(2,0) ,
	_dribleswonl numeric(3,0) ,
	_dribleswonv numeric(3,0) ,
	_aerialduelsuccessl numeric(3,0) ,
	_aerialduelsuccessv numeric(3,0),
	_fechalote timestamp
	)
  RETURNS void AS
$BODY$

INSERT INTO public.whoscored_match_report(
            country, liga, temporada, idmatch, fecha, equipol, equipov, fulltime, 
            golesl, golesv, goleshalftimel, goleshalftimev, tirosl, tirosv, 
            tirospuertal, tirospuertav, posesionl, posesionv, porexitosopasesl, 
            porexitosopasesv, dribleswonl, dribleswonv, aerialduelsuccessl, 
            aerialduelsuccessv, fechalote)
    VALUES (            _country, _liga, _temporada, _idmatch, _fecha, _equipol, _equipov, _fulltime, 
            _golesl, _golesv, _goleshalftimel, _goleshalftimev, _tirosl, _tirosv, 
            _tirospuertal, _tirospuertav, _posesionl, _posesionv, _porexitosopasesl, 
            _porexitosopasesv, _dribleswonl, _dribleswonv, _aerialduelsuccessl, 
            _aerialduelsuccessv, _fechalote);

$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
