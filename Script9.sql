SELECT tb_funcionario.PRIMEIRO_NOME, tb_funcionario.NOME_MEIO, tb_funcionario.ULTIMO_NOME
FROM tb_funcionario
LEFT JOIN tb_dependente ON tb_funcionario.CPF = tb_dependente.CPF_FUNCIONARIO
WHERE
tb_dependente.CPF_FUNCIONARIO IS NULL;

-- tb_funcionario
SELECT JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Primeiro_Nome") AS Primeiro_Nome,
JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Nome_Meio") AS Nome_Meio,
JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Ultimo_Nome") AS Ultimo_nome
FROM tb_object_funcionario
LEFT JOIN (
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
Parentesco VARCHAR(20) PATH "$.Parentesco")) AS tb_object_dependente
) tb_dependente
ON JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf") = tb_dependente.CPF_Funcionario
WHERE tb_dependente.CPF_Funcionario is null;