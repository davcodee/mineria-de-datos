

select * from (((select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license,
null as license,
CAST(null as vehicle) 
from cleaner)
union 
(select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license,
null as license,
CAST(null as vehicle) 
from cashier)
union
(select
curp, 
id_establishment,
rfc,
ssn,
professional_license,
null as license,
CAST(null as vehicle) 
from doctor)
union
(select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license,
null as license,
CAST(null as vehicle) 
from manager)
union
(select 
curp, 
id_establishment,
rfc,
ssn,
null as professional_license,
license,
vehicle 
from deliveryman)) as empleados 
natural join establishment
join zip on establishment.zip_code = zip.code natural join state) 
join person on person.curp = empleados.curp

