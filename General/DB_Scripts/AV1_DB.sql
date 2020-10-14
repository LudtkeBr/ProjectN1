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
                                  tel Number(16)),
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
                          nome Varchar(80),
                          reter_receita Varchar(20),
                          constraint pk_fornecedor primary key (codforn));

                        

create table produto ( cod_produto Number(25),
                       descricao Varchar(30),
                       preco Number(20,2),
                       constraint pk_produto primary key (cod_produto));

create table estoque ( cod_estoque Number(15) not null,
                       cod_produto Number(25),
                       constraint fk_produto
                       foreign key (cod_produto)
                       references produto(cod_produto),
                       constraint pk_estoque primary key (cod_estoque),
                       quantidade Number(15));

create table venda  ( codvenda Number(5) not null,
                      valor_venda Number(9,2)
                      codcli Number(5),
                      codempresa Number(5),
                      codusuario Number(5),
                      dt_venda Date,
                      constraint fk_cliente_venda
                      foreign key (codcli)
                      references cliente(codcli),
                      constraint fk_empresa_venda
                      foreign key (codempresa)
                      references cliente(codempresa),
                      constraint fk_usuario_venda
                      foreign key (codusuario)
                      references usuario(cod_produto),
                      constraint pk_venda primary key (codvenda));                       