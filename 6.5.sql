DECLARE
  CURSOR instr_cur IS
select section.course_no,  t.students_count, instructor_id
from (select section_id, count(student_id) as students_count
from enrollment group by section_id)t left join  section on t.section_id=section.section_id 
where t.students_count>10;
instr_rec instr_cur%rowtype;
BEGIN
  OPEN instr_cur;
  LOOP
FETCH instr_cur into instr_rec;
    EXIT when instr_cur%notfound;
    EXIT when instr_cur%notfound;
    EXIT when instr_cur%notfound;
    dbms_output.put_line('Instructor ID: ' || instr_rec.instructor_ID); 
    dbms_output.put_line('Number of students: ' || instr_rec.students_count); 
    dbms_output.put_line('Course: ' || instr_rec.course_no);    
  END LOOP;
  close instr_cur;
END;
