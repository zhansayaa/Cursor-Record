DECLARE
  CURSOR grade_cur IS
  select student_id, section_id, finalmark from (select sum(average*PERCENT_OF_FINAL_GRADE/100) finalmark,table1.student_id, table1.section_id
from grade_type_weight gtw
left join (select grade.student_id, grade.GRADE_TYPE_CODE, avg(NUMERIC_GRADE) as average,
grade_type_weight.section_id
from grade left join GRADE_TYPE_weight on
grade.section_id=GRADE_TYPE_weight.section_id
group by grade.student_id,
grade.grade_type_code, GRADE_TYPE_weight.section_id)table1 on gtw.GRADE_TYPE_CODE=table1.GRADE_TYPE_CODE and gtw.section_id=table1.section_id
group by table1.student_id, table1.section_id)t2;
grade_rec grade_cur%rowtype;
BEGIN
  OPEN grade_cur;
  LOOP
    FETCH grade_cur into grade_rec;
    EXIT when grade_cur%notfound;
    EXIT when grade_cur%notfound;
    EXIT when grade_cur%notfound;
    dbms_output.put_line('Student ID: ' || grade_rec.student_ID); 
    dbms_output.put_line('Section ID: ' || grade_rec.section_id); 
    dbms_output.put_line('Grade: ' || grade_rec.finalmark);    
  END LOOP;
close grade_cur;
END;
