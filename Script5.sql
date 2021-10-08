SELECT JSON_EXTRACT(JSONVALUE, "$.Numero_Projeto"),
AVG(JSON_EXTRACT(JSONVALUE,"$.Horas")) AS MEDIA_HORAS_TRABALHADAS
from tb_object_trabalha_em 
group by JSON_EXTRACT(JSONVALUE,"$.Numero_Projeto")