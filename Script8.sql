select JSON_EXTRACT(`JSON`, "$.Dependentes") FROM tb_object_funcionario;
select JSON_EXTRACT(`JSON`, "$.Dependentes[0]") FROM tb_object_funcionario;
select JSON_EXTRACT(`JSON`, "$.Dependentes[0].Nome_Dependente") FROM tb_object_funcionario;
select JSON_EXTRACT(`JSON`, "$.Cpf"), JSON_EXTRACT(`JSON`, "$.Dependentes[0].Nome_Dependente") FROM tb_object_funcionario;

select JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf") AS CPF_Funcionario,
tb_object_dependente.Nome_Dependente,
tb_object_dependente.Sexo,
tb_object_dependente.Data_Nascimento,
tb_object_dependente.Parentesco
from tb_object_funcionario
cross join
JSON_TABLE(JSON_EXTRACT(`JSON`, "$.Dependentes"), "$[*]"
Columns (
Nome_Dependente VARCHAR(20) PATH "$.Nome_Dependente", 
Sexo VARCHAR(20) PATH "$.Sexo",
Data_Nascimento Datetime PATH "$.Data_Nascimento",
Parentesco VARCHAR(20) PATH "$.Parentesco")) AS tb_object_dependente;