SELECT `JSON` FROM t1;

drop table t1;
create table t1(`JSON` json);

insert into t1 values ('{
   "Cliente":[
	  {
         "Nome":"Joao",
         "Hobby": "Praia"
      },
      {
         "Nome":"Carlos",
         "Hobby": "Cinema"
      }
   ]
}');

select JSON_EXTRACT(`JSON`, "$.Cliente") FROM t1;

SELECT t2.NOME, t2.HOBBY FROM T1
CROSS JOIN
JSON_TABLE (JSON_EXTRACT(`JSON`, "$.Cliente"), "$[*]"
columns (NOME VARCHAR(10) PATH "$.Nome", HOBBY VARCHAR(10) PATH "$.Hobby")) t2;

select JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") AS NOME, JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby") AS HOBBY from t1
UNION
select JSON_EXTRACT(`JSON`, "$.Cliente[1].Nome") AS NOME, JSON_EXTRACT(`JSON`, "$.Cliente[1].Hobby") AS HOBBY from t1;  
