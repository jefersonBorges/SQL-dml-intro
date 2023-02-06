--1
/*
Carregando(dumping) dados na tabela 'PECA'
*/
INSERT INTO peca VALUES('P1','Nut','Red',12,'London');
INSERT INTO peca VALUES('P2','Bolt','Green',17,'Paris');
INSERT INTO peca VALUES('P3','Screw','Blue',17,'Rome');
INSERT INTO peca VALUES('P4','Hammer','Red',14,'London');
INSERT INTO peca VALUES('P5','Cam','Blue',12,'Paris');
INSERT INTO peca VALUES('P6','Cog','Red',19,'London');

/*
Carregando(dumping) dados na tabela 'FORNECEDOR'
*/
INSERT INTO fornecedor VALUES('S1','Smith',20,'London');
INSERT INTO fornecedor VALUES('S2','Jones',10,'Paris');
INSERT INTO fornecedor VALUES('S3','Blake',30,'Paris');
INSERT INTO fornecedor VALUES('S4','Clark',20,'London');
INSERT INTO fornecedor VALUES('S5','Adams',30,'Athens');

/*
Carregando(dumping) dados na tabela 'EXPEDICAO'
*/

INSERT INTO expedicao VALUES('S1','P1',300);
INSERT INTO expedicao VALUES('S1','P2',200);
INSERT INTO expedicao VALUES('S1','P3',400);
INSERT INTO expedicao VALUES('S1','P4',200);
INSERT INTO expedicao VALUES('S1','P5',100);
INSERT INTO expedicao VALUES('S1','P6',100);
INSERT INTO expedicao VALUES('S2','P1',300);
INSERT INTO expedicao VALUES('S2','P2',400);
INSERT INTO expedicao VALUES('S3','P2',200);
INSERT INTO expedicao VALUES('S4','P2',200);
INSERT INTO expedicao VALUES('S4','P4',300);
INSERT INTO expedicao VALUES('S4','P5',400);


--2.
--(a) Listar o código das peças que foram expedidas, sem repetições;

select distinct codp from expedicao;

--(b) Listar todos os atributos e registros de peças existentes;

select * from peca;

--(c) Listar o nome de todas as peças vermelhas;

select pname from peca where color = 'Red';

--(d) Listar o nome, a cor e a cidade de todas as peças vermelhas, ordenando de modo ascendente pelo nome da peça;

select  pname, color, city from peca where color = 'Red' order by pname;

--(e) Listar o nome, a cor e a cidade de todas as peças que sejam vermelhas ou azuis.

select pname, color, city from peca where (color ='Red' or color ='Blue');

/*(f) Listar o nome, a cor e a cidade de todas as peças que sejam vermelhas ou azuis.
Desse resultado exibir somente aquelas que estejam na cidade de Paris;*/

select pname, color, city from peca where city = 'Paris' and (color = 'Red' or color = 'Blue');

/*(g) Listar o nome de todos os fornecedores de Paris, ordenando-os pelo seu nome,
de modo decrescente;*/

select sname from fornecedor where city = 'Paris' order by sname desc;

/*(h) Listar o código de peças e o código de fornecedores que tiveram expedições
com quantidades de peças entre 100 e 500, inclusive 100 e 500.*/

select codp,cods from expedicao where (qty>= 100 and qty<= 500);

/*(i) Listar o código dos fornecedores que expediram peças ‘P1’ ou ‘P2’, sem repetir
os códigos de fornecedores.*/

select distinct cods from expedicao where (codp = 'P1' or codp = 'P2');

/*(j) Listar todos os atributos, das peças que não são vermelhas e que pesam entre
10 e 15 libras.*/

select * from peca where color <>'Red' and (weight>=10 and weight>=15);

/*(k) Liste os nomes e status dos fornecedores, ordenando-os de modo decrescente
pelo status.*/

select sname, status from fornecedor order by status desc;

/*(l) Apague os registros de fornecedores com status maior que 30;*/

delete from fornecedor where status>30;

/*(m) Remova as expedições do fornecedor ‘S1’, com menos de 50 unidades
expedidas.*/

delete from expedicao where (cods ='S1' and qty < 50);

--(n) Atualize a cor da peça ‘P4’ para ‘Green’ e a cidade dela para ‘Rome’.

update peca
	set color = 'Green', city = 'Rome'
	where codp ='P4';
	
select codp, color, city from peca where codp = 'P4';

--(o) Atualize todas as expedições da peça ‘P1’, triplicando suas quantidades;

select codp, qty from expedicao where codp ='P1';

update expedicao
	set qty = qty*3
	where codp = 'P1';
