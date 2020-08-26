-- Criando a tabela

CREATE TABLE PROD_BD
( COD_PROD NUMBER(10),
GRUPO_PROD VARCHAR2(10),
DESC_PROD VARCHAR2(20),
QTDE_ESTOQUE NUMBER(10,2));

-- Insert manual

INSERT INTO TABLE_PROD VALUES
(&COD_PROD, '&DESC_GRUPO_PROD' , '&DESC_PRODUTO', &QTDE_ESTOQUE);

-- mascara de data

select to_char(data, 'YYYY-MM-DD HH24:MI:SS') from prod_bd;