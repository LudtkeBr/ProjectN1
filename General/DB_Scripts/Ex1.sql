CREATE TABLE DEPARTAMENTO (id int not null,
                           nome varchar(30),
                           nome_diretor varchar(90),
                           ramal  int,
                           constraint pk_departamento primary key (id));

CREATE TABLE FUNCIONARIO (id int not null,
                          nome varchar(90),
                          telefones varchar(20),
                          idade int,
                          data_nascimento date,
                          endereco varchar(200),
                          departamento_id int,
                          constraint pk_funcionario primary key (id),
                          constraint fk_departamento foreign key (departamento_id)
                          references departamento(id));

INSERT INTO departamento values (1, 'Vendas', 'Gilmar', 5);
INSERT INTO departamento values (2, 'SAC', 'Laura', 6);
INSERT INTO departamento values (3, 'TI', 'Andrea', 5);

INSERT INTO funcionario values (1, 'Caio', '222', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 1', 1);
INSERT INTO funcionario values (2, 'Joao', '333', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 2', 1);
INSERT INTO funcionario values (3, 'Carlos', '444', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 3', 1);
INSERT INTO funcionario values (4, 'Jorge', '555', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 4', 1);
INSERT INTO funcionario values (5, 'Cacio', '666', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 5', 1);

INSERT INTO funcionario values (6, 'Caio', '2222', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 1', 2);
INSERT INTO funcionario values (7, 'Joao', '3333', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 2', 2);
INSERT INTO funcionario values (8, 'Carlos', '4444', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 3', 2);
INSERT INTO funcionario values (9, 'Jorge', '5555', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 4', 2);
INSERT INTO funcionario values (10, 'Cacio', '6666', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 5', 2);

INSERT INTO funcionario values (11, 'Caio', '2220', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 1', 3);
INSERT INTO funcionario values (12, 'Joao', '3330', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 2', 3);
INSERT INTO funcionario values (13, 'Carlos', '4440', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 3', 3);
INSERT INTO funcionario values (14, 'Jorge', '5550', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 4', 3);
INSERT INTO funcionario values (15, 'Cacio', '6660', 25, to_date('26/05/2000','DD/MM/YYYY'), 'Rua 5', 3);

SELECT * FROM 