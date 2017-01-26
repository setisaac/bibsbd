-- Database: bibs

-- DROP DATABASE bibs;

CREATE DATABASE bibs
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Argentina.1252'
       LC_CTYPE = 'Spanish_Argentina.1252'
       CONNECTION LIMIT = -1;


CREATE TABLE public.whoscored_match_report
(
idmatch integer NOT NULL,
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
posesionv numeric(5,2) NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.whoscored_match_report
  OWNER TO postgres;



-- Function: public.ins_json(boolean, character varying, integer, integer, integer)

-- DROP FUNCTION public.ins_json(boolean, character varying, integer, integer, integer);

CREATE OR REPLACE FUNCTION public.import_ws_reportmatches(
    _activo boolean,
    _fecha character varying,
    _cantidad integer,
    _res1 integer,
    _res2 integer)
  RETURNS void AS
$BODY$
INSERT INTO public.json(
            activo, fecha, cantidad, res1, res2)
    VALUES (_activo, _fecha, _cantidad, _res1, _res2);$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.import_ws_reportmatches(boolean, character varying, integer, integer, integer)
  OWNER TO postgres;

