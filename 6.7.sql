DECLARE studid student.student_id%TYPE; 
CURSOR curstudent IS 
  SELECT student_id, first_name, last_name FROM student WHERE student_id < 110; 
CURSOR curcourse IS 
SELECT c.course_no, c.description FROM course c 
  inner join  section s on c.course_no = s.course_no 
  inner join  enrollment e on s.section_id = e.section_id
  and e.student_id = studid; 
BEGIN
FOR in_student IN curstudent 
  LOOP studid := in_student.student_id; 
  DBMS_OUTPUT.PUT_LINE(chr(10));
  DBMS_OUTPUT.PUT_LINE(in_student.student_id||', '|| in_student.first_name||' '|| in_student.last_name); 
  DBMS_OUTPUT.PUT_LINE(' All courses of this student '); 
 FOR in_course IN curcourse 
  LOOP DBMS_OUTPUT.PUT_LINE(in_course.course_no|| ', '||in_course.description); 
  END LOOP; 
END LOOP;
END;
