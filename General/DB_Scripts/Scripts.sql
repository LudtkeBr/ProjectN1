--Scrit para criar uma tablespace
--OBS: para criar a tablespace, é necessário criar a pasta para armazena-la
create tablespace BD_INF2020 datafile
'C:\TEMP\BD2020.DBF' size 100M autoextend on
next 100M extent management local;

-- Script para criar usuário

create user aluno identified by 1234
default tablespace BD_INF2020
quota unlimited on BD_INF2020;

-- Script para conceder acesso ao usuário

grant create session, alter session,
create table, create procedure,
create view, create trigger,
create synonym, create sequence
to aluno;

-- Script para criar uma tabela 

CREATE TABLE TABELA_EXEMPLO (ID_CODIGO   NUMBER(10),   DSC_EXEMPLO VARCHAR2(100));

-- Script para criar nova coluna

alter table tabela_exemplo add DATA_ULT_ALTERACAO DATE NOT NULL;

-- Script para inserir informações em umaa tabela

INSERT INTO TABELA_EXEMPLO (ID_CODIGO, DSC_EXEMPLO, DATA_ULT_ALTERACAO) VALUES (1, 'TESTE', SYSDATE);

-- Comando para aumentar a quantide de caracteres no cmd do Oracle

SET LINESIZE 200

--Comando para mostrar o user conectado

SHOW USER;

-- Haabilitar messageria no oracle

set serveroutput on;

-- retorna um erro (Ex:uso para um loop).

 raise_application_error (-20001, 'ERRO - SAIDA INESPERADA'); 