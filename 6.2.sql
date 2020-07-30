DECLARE 
CURSOR cursorbased IS 
SELECT * FROM zipcode; 
zip_rec cursorbased%ROWTYPE; 
BEGIN
  OPEN cursorbased;
  LOOP
FETCH cursorbased into zip_rec;
    EXIT when cursorbased%notfound;
    dbms_output.put_line('Zip: ' || zip_rec.zip);    
    dbms_output.put_line('City: ' || zip_rec.city);
   dbms_output.put_line('State: ' || zip_rec.state);
   dbms_output.put_line('Created By: ' || zip_rec.created_by);
 dbms_output.put_line('Created Date: ' || zip_rec.created_date);
dbms_output.put_line('Modified By: ' || zip_rec.modified_by);
 dbms_output.put_line('Modified Date: ' || zip_rec.modified_date);
END LOOP;
END;
