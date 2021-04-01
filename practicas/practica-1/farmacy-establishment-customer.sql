select * from customer join person on customer.curp = person.curp 
join zip on person.zip_code = zip.code join state on zip.id_state = state.id_state

select * from establishment join zip on establishment.zip_code = zip.code join state on zip.id_state = state.id_state


select * from ((select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license
from cleaner)
union 
(select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license
from cashier)
union
(select
curp, 
id_establishment,
rfc,
ssn,
professional_license
from doctor)
union
(select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license
from manager)) as empleados join establishment on 
empleados.id_establishment = establishment.id_establishment 
join zip on establishment.zip_code = zip.code join state on 
zip.id_state = state.id_state join person on person.curp = empleados.curp
limit 10
