select * from tb_funcionario Where sexo = 'F';
select * from tb_object_funcionario Where JSON_EXTRACT(`JSON`,"$.Sexo") = 'F';
