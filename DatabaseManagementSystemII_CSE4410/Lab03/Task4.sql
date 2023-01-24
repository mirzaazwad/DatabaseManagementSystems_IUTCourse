SET SERVEROUTPUT ON SIZE 1000000
CREATE OR REPLACE FUNCTION GENRE_INFO(id IN mtype.gen_id%TYPE)
RETURN varchar2
AS
  avg_rev_count number;
  avg_rating number;
  gen_count number;
  rev_count number;
  curr_rating number;
BEGIN
  select avg(rev_stars) into avg_rating from mtype,rating where mtype.mov_id=rating.mov_id;
  select count(rev_id) into avg_rev_count from mtype,rating where mtype.mov_id=rating.mov_id;
  select count(distinct gen_id) into gen_count from mtype;
  avg_rev_count:=avg_rev_count/gen_count;
  select avg(rev_stars) into curr_rating from mtype,rating where mtype.mov_id=rating.mov_id AND mtype.gen_id=id;
  select count(rev_id) into rev_count from mtype,rating where mtype.mov_id=rating.mov_id AND mtype.gen_id=id;
  IF(curr_rating<avg_rating AND rev_count>avg_rev_count) THEN
    return 'Widely Watched, Review Count: '||rev_count||', Average Rating: '||TRUNC(curr_rating,2);
  ELSIF (curr_rating>avg_rating AND rev_count<avg_rev_count) THEN
    return 'High Rated, Review Count: '||rev_count||', Average Rating: '||TRUNC(curr_rating,2);
  ELSIF (curr_rating>avg_rating AND rev_count>avg_rev_count) THEN
    return 'Peoples favorite, Review Count: '||rev_count||', Average Rating: '||TRUNC(curr_rating,2);
  ELSE
    return 'So so, Review Count: '||rev_count||', Average Rating: '||TRUNC(curr_rating,2);
  END IF;
    
END;
/

DECLARE
    gen_id mtype.gen_id%TYPE;
BEGIN
    gen_id:='&something';
    DBMS_OUTPUT.PUT_LINE(GENRE_INFO(gen_id));
END;
/