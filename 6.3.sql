DECLARE 
CURSOR cursorbased IS 
SELECT city, state, z.zip, COUNT(*) students 
FROM zipcode z, student s WHERE z.zip = s.zip 
GROUP BY city, state, z.zip;
zip_rec cursorbased%ROWTYPE; 
BEGIN
  OPEN cursorbased;
  LOOP
FETCH cursorbased into zip_rec;
    EXIT when cursorbased%notfound;
    dbms_output.put_line('Zip: ' || zip_rec.zip);    
    dbms_output.put_line('City: ' || zip_rec.city);
   dbms_output.put_line('State: ' || zip_rec.state);
   dbms_output.put_line('Students: ' || zip_rec.students);
END LOOP;
END;
