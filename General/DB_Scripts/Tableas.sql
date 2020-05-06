create table vendedor ( cod_vendedor Number(20) not null,
                        nome         Varchar(20),
                        endereco     Varchar(30),
                        comissao     NUmber(5,2),
                        constraint vendedor_pk primary key (cod_vendedor));


create table cliente ( cod_cliente Number(15) not null, 
                       cod_vendedor Number(20),
                       constraint fk_vendedor 
                       foreign key (cod_vendedor) 
                       references vendedor(cod_vendedor),
                       constraint pk_cliente primary key (cod_cliente), 
                       nome Varchar(20), 
                       cpf_cnpj Number(14), 
                       endereco Varchar(30),
                       telefone Number(11),
                       faturamento_ac Number(10,2),
                       limite_credito Number(10,2));

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

create table pedido ( cod_pedido Number(20) not null,
                      cod_cliente Number(15),
                      cod_vendedor Number(20),
                      cod_produto Number (25),
                      data_pedido Date,
                      nome_cliente Varchar(20),
                      endereco_cliente Varchar(30),
                      quantidade Number(15),
                      preco_cotado Number(20),
                      constraint fk_vendedor_pedido
                      foreign key (cod_vendedor)
                      references vendedor(cod_vendedor),
                      constraint fk_cliente_pedido
                      foreign key (cod_cliente)
                      references cliente(cod_cliente),
                      constraint fk_produto_pedido
                      foreign key (cod_produto)
                      references produto (cod_produto),
                      constraint pk_pedido primary key (cod_pedido));                       