DECLARE 
CURSOR course_cost IS
SELECT DISTINCT s.course_no FROM section s left join  enrollment e 
  on s.section_id = e.section_id 
  GROUP BY s.course_no, e.section_id, s.section_id 
  HAVING COUNT(*)>=8;
BEGIN 
FOR newcost IN course_cost   LOOP 
  UPDATE course SET cost = cost *0.95 
  WHERE course_no =newcost.course_no; 
  END LOOP; 
  COMMIT; 
END;
