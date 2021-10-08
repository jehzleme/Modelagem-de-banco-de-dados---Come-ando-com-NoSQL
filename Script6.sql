select * from tb_dependente where CPF_FUNCIONARIO = 12345678966;
select JSON_EXTRACT(`JSON`, "$.Dependentes") AS Dependentes FROM tb_object_funcionario WHERE CPF = '12345678966';


create table t1(`JSON` json);
insert into t1 values ('{"Hobby": ["Praia", "Futebol", "Volei"]}');
select `JSON` from t1;
select JSON_EXTRACT(`JSON`, "$.Hobby") as HOBBIES from t1;
select JSON_EXTRACT(`JSON`, "$.Hobby[0]") as HOBBIES from t1;
select JSON_EXTRACT(`JSON`, "$.Hobby[1]") as HOBBIES from t1;
select JSON_EXTRACT(`JSON`, "$.Hobby[2]") as HOBBIES from t1;

drop table t1;
create table t1(`JSON` json);
insert into t1 values ('{
   "Cliente":[
	  {
         "Nome":"Joao",
         "Hobby":[
            "Praia",
            "Futebol",
            "Volei"
         ]
      },
      {
         "Nome":"Carlos",
         "Hobby":[
            "Cinema",
            "Luta"
         ]
      }
   ]
}');

select `JSON` from t1;
select JSON_EXTRACT(`JSON`, "$.Cliente") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[1].Nome") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[1].Hobby") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby[0]") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby[1]") FROM t1;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby[2]") FROM t1;


