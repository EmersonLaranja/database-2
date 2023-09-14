Entrando no psql: docker exec -it d6cdad039a88 psql -U postgres

\du vemos que só tem o user postgres 

Criei uma role
CREATE role laranja;

Lista todas as roles
SELECT rolname FROM pg_roles;

\du vemos que só tem o user postgres 

Role com senha
CREATE ROLE faz_login 
SUPERUSER 
LOGIN 
PASSWORD 'securePass1';


create role joe 
login 
password 'Abcd1234';

Logando com o Joe
docker exec -it d6cdad039a88 psql -U joe -W postgres

Se eu der um select na tabela course

No user postgres
GRANT SELECT ON candidates TO joe;

Fazendo com que Joe dê um INSERT:
INSERT INTO candidates(first_name, last_name, email, phone)
VALUES('Joe','Com','joe.com@example.com','408-111-2222');
------------------------
FAZENDO O PEDIDO PELO EXERCICIO:

dba com todos os poderes:
GRANT ALL ON course TO dba;

Vi que não dei superuser pro dba, agora vou alterar a role:
ALTER ROLE dba WITH SUPERUSER;


Agora no dba eu dou permissao para u2 sobre course;
GRANT ALL ON course TO u2;

Agora u2 vai criar u3:
CREATE ROLE u3 WITH SUPERUSER LOGIN;
--------------------------
CREATE ROLE dba LOGIN PASSWORD 'dba'
GRANT ALL ON ALL TABLES ON SCHEMA PUBLIC TO dba WITH GRANT OPTION

- entrar como dba
