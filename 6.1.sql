DECLARE vr_zip zipcode%ROWTYPE;
BEGIN 	
SELECT * INTO vr_zip FROM zipcode WHERE zip = 00914;
DBMS_OUTPUT.PUT_LINE ('Zip: '||vr_zip.zip); 
DBMS_OUTPUT.PUT_LINE ('City: '|| vr_zip.city); 
DBMS_OUTPUT.PUT_LINE ('State: '|| vr_zip.state);
DBMS_OUTPUT.PUT_LINE ('Created By: '||vr_zip.created_by); 
DBMS_OUTPUT.PUT_LINE ('Created Date: '|| vr_zip.created_date); 
DBMS_OUTPUT.PUT_LINE ('Modified by: '|| vr_zip.modified_date);
END;
