use lefti_olteancristian;
/* 
	In urma interogarii de mai jos se va afisa ultima plata facuta care s-a realizat cu cardul de credit.
	Se vor afisa urmatoarele date : nume, suma platita, metoda de plata, data si ora la care a fost efectuata plata.
 */
 
 /*///////////////////////////////////////////////////////////////////////////////*/
 
select Customer_Name, Payment_Amount, Payment_Method_Name, Payment_Date_Time
	from Customers inner join Events using(Customer_ID) 
					inner join Payments on Event_ID=Event_Payment_ID 
					inner join Ref_Payment_Methods using(Payment_Method_Code)
                    where Payment_Method_Name = 'Credit card'
                    order by Payment_Date_Time desc
                    limit 1;
                    
/*///////////////////////////////////////////////////////////////////////////////*/


/*select * from Customers inner join Events using(Customer_ID)
						inner join Products_and_Services using(Service_CD);*/