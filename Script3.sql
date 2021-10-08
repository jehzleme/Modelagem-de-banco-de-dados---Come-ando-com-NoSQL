select JSON_EXTRACT(JSONVALUE, "$.Nome_Departamento")
from tb_object_departamento
where year(JSON_EXTRACT(JSONVALUE,"$.Data_Inicio_Gerente")) = 2005
