SELECT SUM(salario) AS SALARIO_TOTAL FROM tb_funcionario;
SELECT JSON_EXTRACT(`JSON`, "$.Salario") AS SALARIO_TOTAL FROM tb_object_funcionario;
SELECT SUM(JSON_EXTRACT(`JSON`, "$.Salario")) AS SALARIO_TOTAL FROM tb_object_funcionario;

select Numero_Departamento, SUM(salario)
