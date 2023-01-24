SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE PROCEDURE get_mov_time(title IN MOVIE.MOV_TITLE%TYPE)
AS
  time MOVIE.MOV_TIME%TYPE;
  mov_hour number;
  rem_time number;
  mov_min number;
  interval number;
begin
  SELECT max(MOV_TIME) INTO time FROM MOVIE WHERE MOVIE.MOV_TITLE = title;
  rem_time:=MOD(time,70);
  IF(rem_time>30) THEN 
    interval:=TRUNC(time/70,0);
  ELSE
    interval:=TRUNC(time/70 -1,0);
  END IF;
  time:=time+interval*15;
  mov_hour:=time/60;
  mov_min:=MOD(time,60);
  dbms_output.PUT_LINE(TRUNC(mov_hour,0)||' '||TRUNC(mov_min,0));

end;
/

DECLARE
    mov_title movie.mov_title%TYPE;
BEGIN
    mov_title:='&something';
    get_mov_time(mov_title);
END;
/