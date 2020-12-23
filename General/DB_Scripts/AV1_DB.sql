/*
Título: Script para AV1 de banco de dados avançado
Responsável: Matheus Lüdtke da Silva
Data de criação: 13/10/2020
Data de atualização: 13/10/2020

Descrição: Relação de scripts compilados e executados para realização e cumprimento do trabalho soicitado.

*/

--Criação da tablespace
create tablespace AV1_BD2020 datafile
'D:\DB_UNIASSELVI\AV1_BD2020.DBF' size 100M autoextend on
next 100M extent management local;

--Criação do usuário de ADM.

create user adm identified by 1234
default tablespace AV1_BD2020
quota unlimited on AV1_BD2020;

--Liberação de acesso para o user adm

grant create session, alter session,
create table, create procedure,
create view, create trigger,
create synonym, create sequence
to adm;

--Script para criação da estrutura (tabelas e ligações) 

create table empresa_conveniada ( codempresa   Number(5) not null,
                                  bairro Varchar(25),
                                  cep Number(9),
                                  cidade Varchar(25),
                                  cnpj Number(18),
                                  email Varchar(100),
                                  endereco Varchar(35),
                                  estado Varchar(2),
                                  fax Number(16),
                                  insc_est Number(18),
                                  nome Varchar(80),
                                  site Varchar(100),
                                  tel Number(16),
                                  constraint pk_empresa primary key (codempresa));


create table cliente ( codcli Number(5) not null, 
                       codempresa Number(5),
                       constraint fk_empresa 
                       foreign key (codempresa) 
                       references empresa_conveniada(codempresa),
                       constraint pk_cliente primary key (codcli), 
                       bairro Varchar(25),
                       cel Number(16),
                       cidade Varchar(30),
                       cpf Number(14),
                       data_nasc Date,
                       email Varchar(100),
                       endereco Varchar(35),
                       estado Varchar(2),
                       nome Varchar(50),
                       obs Varchar(50),
                       rg Number(12),
                       sexo Varchar(1),
                       tel Number(16));

create table usuario ( codusuario Number(15) not null,
                       bairro Varchar(25),
                       cel Number(16),
                       cep Number(9),
                       cidade Varchar(30),
                       data_nasc Date,
                       email Varchar(100),
                       endereco Varchar(35),
                       estado Varchar(2),
                       nome Varchar(50),
                       tel Number(16),
                       constraint pk_usuario primary key (codusuario)); 

create table classe (  codclasse Number(5) not null,
                       nome Varchar(30),
                       constraint pk_classe primary key (codclasse)); 

create table secao (   codsecao Number(5) not null,
                       nome Varchar(30),
                       constraint pk_secao primary key (codsecao)); 

create table portaria ( codportaria Number(5) not null,
                        nome Varchar(80),
                        reter_receita Varchar(20),
                        constraint pk_portaria primary key (codportaria)); 

create table fornecedor ( codforn Number(5) not null,
                          bairro Varchar(25),
                          cep Number(9),
                          cidade Varchar(25),
                          cnpj Number(18),
                          email Varchar(100),
                          endereco Varchar(35),
                          estado Varchar(2),
                          fax Number(16),
                          insc_est Number(18),
                          nome Varchar(80),
                          site Varchar(100),
                          tel Number(16),
                          constraint pk_fornecedor primary key (codforn));

create table fabricante ( codfab Number(5) not null,
                          bairro Varchar(25),
                          cep Number(9),
                          cidade Varchar(25),
                          cnpj Number(18),
                          email Varchar(100),
                          endereco Varchar(35),
                          estado Varchar(2),
                          fax Number(16),
                          insc_est Number(18),
                          nome Varchar(80),
                          site Varchar(100),
                          tel Number(16),
                          constraint pk_fabricante primary key (codfab));

                   
create table produto ( codprod Number(25),
                       codclasse Number(5),
                       codfab Number(5),
                       codportaria Number(5),
                       codsecao Number(5),
                       margem_lucro Number(7,2),
                       nome Varchar(30),
                       preco_fab Number(6,2),
                       preco_venda Number(6,2),
                       qtde_caixa Number(3),
                       constraint fk_classe_produto
                       foreign key (codclasse)
                       references classe(codclasse),
                       constraint fk_fabricante_produto
                       foreign key (codfab)
                       references fabricante(codfab),
                       constraint fk_portaria_produto
                       foreign key (codportaria)
                       references portaria(codportaria),
                       constraint fk_secao_produto
                       foreign key (codsecao)
                       references secao(codsecao),
                       constraint pk_produto primary key (codprod));

create table estoque ( codestoque Number(15) not null,
                       codprod Number(5),
                       constraint fk_produto_estoque
                       foreign key (codprod)
                       references produto(codprod),
                       constraint pk_estoque primary key (codestoque),
                       quantidade Number(15));

create table venda  ( codvenda Number(5) not null,
                      valor_venda Number(9,2),
                      codcli Number(5),
                      codempresa Number(5),
                      codusuario Number(5),
                      dt_venda Date,
                      constraint fk_cliente_venda
                      foreign key (codcli)
                      references cliente(codcli),
                      constraint fk_empresa_venda
                      foreign key (codempresa)
                      references empresa_conveniada(codempresa),
                      constraint fk_usuario_venda
                      foreign key (codusuario)
                      references usuario(cod_produto),
                      constraint pk_venda primary key (codvenda));

create table prod_venda  (  codvenda Number(5) not null,
                            codprod Number(5),
                            valor_prod_venda Number(9,2),
                            quantidade Number(4),
                            codcli Number(5),
                            codempresa Number(5),
                            codusuario Number(5),
                            dt_venda Date,
                            constraint fk_venda_capa
                            foreign key (codvenda)
                            references venda(codvenda),
                            constraint fk_produto_venda
                            foreign key (codprod)
                            references produto(codprod),
                            constraint pk_venda_produto primary key (codvenda)); 

create table forn_prod   (  codforn Number(5) not null,
                            codprod Number(5) not null,
                            constraint fk_prod_forn_forn
                            foreign key (codforn)
                            references fornecedor(codforn),
                            constraint fk_prod_forn_prod
                            foreign key (codprod)
                            references produto(codprod)); 

create table entrada_nota ( codnota Number(5) not null,
                            codforn Number(5),
                            codusuario Number(5),
                            dt_emissao Date,
                            dt_entrada Date,
                            valor_nota Number(9,2),
                            constraint fk_entrada_forn
                            foreign key (codforn)
                            references fornecedor(codforn),
                            constraint fk_entrada_usuario
                            foreign key (codusuario)
                            references usuario(codusuario),
                            constraint pk_entrada primary key (codnota));

create table prod_nota   (  codnota Number(5) not null,
                            codprod Number(5),
                            valor_prod_nota Number(9,2),
                            quantidade Number(5),
                            constraint fk_prod_nota_item
                            foreign key (codnota)
                            references entrada_nota(codnota),
                            constraint fk_prod_nota_prod
                            foreign key (codprod)
                            references produto(codprod));

-- Criação das procedures para inserção, deleção e atualização dos dados

CREATE OR REPLACE PROCEDURE pr_empresa_conveniada (
  vOpr CHAR,
  vcodempresa   Number,
  vbairro Varchar,
  vcep Number,
  vcidade Varchar,
  vcnpj Number,
  vemail Varchar,
  vendereco Varchar,
  vestado Varchar,
  vfax Number,
  vinsc_est Number,
  vnome Varchar,
  vsite Varchar,
  vtel Number
  )
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.empresa_conveniada(
    codempresa,
    bairro,
    cep,
    cidade,
    cnpj,
    email,
    endereco,
    estado,
    fax,
    insc_est,
    nome,
    site,
    tel)
    VALUES(
    vcodempresa,
    vbairro,
    vcep,
    vcidade,
    vcnpj,
    vemail,
    vendereco,
    vestado,
    vfax,
    vinsc_est,
    vnome,
    vsite,
    vtel);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.empresa_conveniada SET
    bairro = vbairro,
    cep = vcep,
    cidade = vcidade,
    cnpj = vcnpj,
    email = vemail,
    endereco = vendereco,
    estado = vestado,
    fax = vfax,
    insc_est = vinsc_est,
    nome = vnome,
    site = vsite,
    tel = vtel
    WHERE
    codempresa = vcodempresa; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.empresa_conveniada WHERE codempresa = vcodempresa;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_empresa_conveniada;

-----------------------------------------FIM/INICIO PROC-------------------------------------

CREATE OR REPLACE PROCEDURE pr_cliente (
    vOpr CHAR,
    vcodcli Number, 
    vcodempresa Number,
    vbairro Varchar,
    vcel Number,
    vcidade Varchar,
    vcpf Number,
    vdata_nasc Date,
    vemail Varchar,
    vendereco Varchar,
    vestado Varchar,
    vnome Varchar,
    vobs Varchar,
    vrg Number,
    vsexo Varchar,
    vtel Number
  )
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.cliente(
    codcli, 
    codempresa,
    bairro,
    cel,
    cidade,
    cpf,
    data_nasc,
    email,
    endereco,
    estado,
    nome,
    obs,
    rg,
    sexo,
    tel)
    VALUES(
    vcodcli, 
    vcodempresa,
    vbairro,
    vcel,
    vcidade,
    vcpf,
    vdata_nasc,
    vemail,
    vendereco,
    vestado,
    vnome,
    vobs,
    vrg,
    vsexo,
    vtel);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.cliente SET
    codempresa = vcodempresa,
    bairro = vbairro,
    cel = vcel,
    cidade = vcidade,
    cpf = vcpf,
    data_nasc = vdata_nasc,
    email = vemail,
    endereco = vendereco,
    estado = vestado,
    nome = vnome,
    obs = vobs,
    rg = vrg,
    sexo = vsexo,
    tel = vtel
    WHERE codcli = vcodcli; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.cliente WHERE codcli = vcodcli;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_cliente;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_usuario (
    vOpr CHAR,
    vcodusuario Number,
    vbairro Varchar,
    vcel Number,
    vcep Number,
    vcidade Varchar,
    vdata_nasc Date,
    vemail Varchar,
    vendereco Varchar,
    vestado Varchar,
    vnome Varchar,
    vtel Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.usuario(
    codusuario,
    bairro,
    cel,
    cep,
    cidade,
    data_nasc,
    email,
    endereco,
    estado,
    nome,
    tel)
    VALUES(
    vcodusuario,
    vbairro,
    vcel,
    vcep,
    vcidade,
    vdata_nasc,
    vemail,
    vendereco,
    vestado,
    vnome,
    vtel);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.usuario SET
    bairro = vbairro,
    cel = vcel,
    cep = vcep,
    cidade = vcidade,
    data_nasc = vdata_nasc,
    email = vemail,
    endereco = vendereco,
    estado = vestado,
    nome = vnome,
    tel = vtel
    WHERE codusuario = vcodusuario; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.usuario WHERE codusuario = vcodusuario;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_usuario;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_classe (
    vOpr CHAR,
    vcodclasse Number,
    vnome Varchar
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.classe(
    codclasse,
    nome)
    VALUES(
    vcodclasse,
    vnome);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.classe SET
    nome = vnome
    WHERE codclasse = vcodclasse; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.classe WHERE codclasse = vcodclasse;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_classe;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_secao (
    vOpr CHAR,
    vcodsecao Number,
    vnome Varchar
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.secao(
    codsecao,
    nome)
    VALUES(
    vcodsecao,
    vnome);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.secao SET
    nome = vnome
    WHERE codsecao = vcodsecao; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.secao WHERE codsecao = vcodsecao;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_secao;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_portaria (
    vOpr CHAR,
    vcodportaria Number,
    vnome Varchar,
    vreter_receita Varchar
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.portaria(
    codportaria,
    nome,
    reter_receita)
    VALUES(
    vcodportaria,
    vnome,
    vreter_receita);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.portaria SET
    nome = vnome,
    reter_receita = vreter_receita
    WHERE codportaria = vcodportaria; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.portaria WHERE codportaria = vcodportaria;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_portaria;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_fornecedor (
    vOpr CHAR,
    vcodforn Number,
    vbairro Varchar,
    vcep Number,
    vcidade Varchar,
    vcnpj Number,
    vemail Varchar,
    vendereco Varchar,
    vestado Varchar,
    vfax Number,
    vinsc_est Number,
    vnome Varchar,
    vsite Varchar,
    vtel Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.fornecedor(
    codforn,
    bairro,
    cep,
    cidade,
    cnpj,
    email,
    endereco,
    estado,
    fax,
    insc_est,
    nome,
    site,
    tel)
    VALUES(
    vcodforn,
    vbairro,
    vcep,
    vcidade,
    vcnpj,
    vemail,
    vendereco,
    vestado,
    vfax,
    vinsc_est,
    vnome,
    vsite,
    vtel);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.fornecedor SET
    bairro = vbairro,
    cep = vcep,
    cidade = vcidade,
    cnpj = vcnpj,
    email = vemail,
    endereco = vendereco,
    estado = vestado,
    fax = vfax,
    insc_est = vinsc_est,
    nome = vnome,
    site = vsite,
    tel = vtel
    WHERE  codforn = vcodforn; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.fornecedor WHERE codforn = vcodforn;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_fornecedor;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_fabricante (
    vOpr CHAR,
    vcodfab Number,
    vbairro Varchar,
    vcep Number,
    vcidade Varchar,
    vcnpj Number,
    vemail Varchar,
    vendereco Varchar,
    vestado Varchar,
    vfax Number,
    vinsc_est Number,
    vnome Varchar,
    vsite Varchar,
    vtel Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.fabricante(
    codfab,
    bairro,
    cep,
    cidade,
    cnpj,
    email,
    endereco,
    estado,
    fax,
    insc_est,
    nome,
    site,
    tel)
    VALUES(
    vcodfab,
    vbairro,
    vcep,
    vcidade,
    vcnpj,
    vemail,
    vendereco,
    vestado,
    vfax,
    vinsc_est,
    vnome,
    vsite,
    vtel);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.fabricante SET
    bairro = vbairro,
    cep = vcep,
    cidade = vcidade,
    cnpj = vcnpj,
    email = vemail,
    endereco = vendereco,
    estado = vestado,
    fax = vfax,
    insc_est = vinsc_est,
    nome = vnome,
    site = vsite,
    tel = vtel
    WHERE  codfab = vcodfab; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.fabricante WHERE codfab = vcodfab;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_fabricante;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_produto (
    vOpr CHAR,
    vcodprod Number,
    vcodclasse Number,
    vcodfab Number,
    vcodportaria Number,
    vcodsecao Number,
    vmargem_lucro Number,
    vnome Varchar,
    vpreco_fab Number,
    vpreco_venda Number,
    vqtde_caixa Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.produto(
    codprod,
    codclasse,
    codfab,
    codportaria,
    codsecao,
    margem_lucro,
    nome,
    preco_fab,
    preco_venda,
    qtde_caixa)
    VALUES(
    vcodprod,
    vcodclasse,
    vcodfab,
    vcodportaria,
    vcodsecao,
    vmargem_lucro,
    vnome,
    vpreco_fab,
    vpreco_venda,
    vqtde_caixa);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.produto SET
    codclasse = vcodclasse,
    codfab = vcodfab,
    codportaria = vcodportaria,
    codsecao = vcodsecao,
    margem_lucro = vmargem_lucro,
    nome = vnome,
    preco_fab = vpreco_fab,
    preco_venda = vpreco_venda,
    qtde_caixa = vqtde_caixa
    WHERE  codprod = vcodprod; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.produto WHERE codprod = vcodprod;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_produto;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_estoque (
    vOpr CHAR,
    vcodestoque Number,
    vcodprod Number,
    vquantidade Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.estoque(
    codestoque,
    codprod,
    quantidade)
    VALUES(
    vcodestoque,
    vcodprod,
    vquantidade);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.estoque SET
    codprod = vcodprod,
    quantidade = vquantidade
    WHERE  codestoque = vcodestoque; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.estoque WHERE codestoque = vcodestoque;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_estoque;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_venda (
    vOpr CHAR,
    vcodvenda Number
    vvalor_venda Number,
    vcodcli Number,
    vcodempresa Number,
    vcodusuario Number,
    vdt_venda Date
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.venda(
    codvenda,
    valor_venda,
    odcli,
    codempresa,
    codusuario,
    dt_venda)
    VALUES(
    vcodvenda,
    vvalor_venda,
    vcodcli,
    vcodempresa,
    vcodusuario,
    vdt_venda);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.venda SET
    valor_venda = vvalor_venda,
    odcli = vodcli,
    codempresa = vcodempresa,
    codusuario = vcodusuario,
    dt_venda = vdt_venda
    WHERE  codvenda = vcodvenda; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.venda WHERE codvenda = vcodvenda;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_venda;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_forn_prod (
    vOpr CHAR,
    vcodforn Number,
    vcodprod Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.forn_prod(
    codforn,
    codprod)
    VALUES(
    vcodforn,
    vcodprod);

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.forn_prod WHERE codforn = vcodforn AND codprod = vcodprod;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, ou D (I=Inserção, D=Deleção).', FALSE);
END pr_forn_prod;

-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_entrada_nota (
    vOpr CHAR,
    vcodnota Number,
    vcodforn Number,
    vcodusuario Number,
    vdt_emissao Date,
    vdt_entrada Date,
    vvalor_nota Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.entrada_nota(
    codnota,
    codforn,
    codusuario,
    dt_emissao,
    dt_entrada,
    valor_nota)
    VALUES(
    vcodnota,
    vcodforn,
    vcodusuario,
    vdt_emissao,
    vdt_entrada,
    vvalor_nota);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.entrada_nota SET
    codforn = vcodforn,
    codusuario = vcodusuario,
    dt_emissao = vdt_emissao,
    dt_entrada = vdt_entrada,
    valor_nota = vvalor_nota
    WHERE  codnota = vcodnota; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.entrada_nota WHERE codnota = vcodnota;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_entrada_nota;


-------------------------------------------------FIM/INICIO PROC------------------------------------------------------------


CREATE OR REPLACE PROCEDURE pr_prod_nota (
    vOpr CHAR,
    vcodnota Number,
    vcodprod Number,
    vvalor_prod_nota Number,
    vquantidade Number
)
IS
  vExecao EXCEPTION;
BEGIN
  IF (vOpr = 'I') THEN

    INSERT INTO adm.prod_nota(
    codnota,
    codprod,
    valor_prod_nota,
    quantidade)
    VALUES(
    vcodnota,
    vcodprod,
    vvalor_prod_nota,
    vquantidade);

  ELSE

  IF(vOpr = 'A') THEN

    UPDATE adm.prod_nota SET
    codprod = vcodprod,
    valor_prod_nota = vvalor_prod_nota,
    quantidade = vquantidade
    WHERE  codnota = vcodnota; 

  ELSE

  IF(vOpr = 'D')THEN
    
    DELETE FROM adm.prod_nota WHERE codnota = vcodnota;

  ELSE

    RAISE vExecao;

  END IF;
  END IF;
  END IF;

  EXCEPTION
    WHEN vExecao THEN
      RAISE_APPLICATION_ERROR(-20999,'Error! Operação diferente de I, A ou D (I=Inserção, A=Alteração, D=Deleção).', FALSE);
END pr_prod_nota;