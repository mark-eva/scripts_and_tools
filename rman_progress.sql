set linesize 200
set pagesize 999
col message format a85
col opname format a30
select
  sid
, sofar
, totalwork
, to_char(round(sofar/totalwork*100,2),'90.00') "% Done"
, replace(to_char(floor(secs_left/3600),'09')|| ':' || to_char(floor(mod(secs_left,3600)/60),'09')|| ':' || to_char(mod(secs_left,60),'09'), ' ' ) hr_min_sec_left
, opname
, message
from
(
  select
    sid
  , sofar
  , totalwork
  , time_remaining secs_left
  , opname
  , message
  from
    v$session_longops
  where
    opname     like 'RMAN%'       and
    opname not like '%aggregate%' and
    totalwork  != 0               and
    sofar      <> totalwork
)
order by
  5
;

