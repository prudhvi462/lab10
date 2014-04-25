-- Name:Prudhvi Krishna Narra
--CWID :200 54 101
--Date :4/24/214


--*****************************--
1.
create function PreReqsFor(courseNum1 integer) returns integer as $$
declare
      
      prerequisite integer;
begin

 
  
 select preReqNum 
 from Prerequisites where courseNum = courseNum1
 into prerequisite;
 

 
 
 
 --delete from Prerequisites
 -- where preReqNum = prerequisite;
  
 return prerequisite;
end
$$ language plpgsql;

--sample data
select PreReqsFor(308);

--*******************************--
2.
CREATE OR REPLACE FUNCTION IsPreReqFor(tot integer)
RETURNS Char(50) AS $test$
declare
        cname Char(50);
BEGIN
SELECT name from Courses where num in (select preReqNum into cname FROM Prerequisites where courseNum=tot);
   RETURN cname;
END;
$test$ LANGUAGE plpgsql;

--sample data
select IsPreReqFor(220)