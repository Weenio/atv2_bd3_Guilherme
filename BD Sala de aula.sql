create database db_sala_de_aula;

use db_sala_de_aula;

create table tbl_turma(
	id_turma int unsigned auto_increment primary key,
    sigla varchar(3) unique,
    nome varchar(100)
);

create table tbl_alunos(
	id_aluno int unsigned auto_increment primary key,
    id_turma int unsigned,
    nome varchar(100),
    cpf varchar(14),
    rg varchar(9),
    tel_aluno varchar(15),
    tel_responsavel varchar(15),
    email varchar(100),
    data_nasc date,
    
    foreign key(id_turma) references tbl_turma(id_turma)
);

create table tbl_disciplinas(
	id_disciplina int unsigned auto_increment primary key,
    id_turma int unsigned,
    sigla varchar(5),
    
    foreign key(id_turma) references tbl_turma(id_turma)
);

create table tbl_frequencia(
	id_aluno int unsigned,
    id_disciplina int unsigned,
    data_chamada date,
    frequencia decimal(2,2),
    
    foreign key(id_aluno) references tbl_alunos(id_aluno),
    foreign key(id_disciplina) references tbl_disciplinas(id_disciplina)
);

insert into tbl_turma(sigla, nome)
values('BTT','Batata'),
('PAO','Pão');

/*Primeira turma*/
INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('João Silva', '123.456.789-00', '1234567-8', '(11) 91234-5678', '(11) 98765-4321', 'joao@example.com', '2005-05-10', 1);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Maria Oliveira', '987.654.321-00', '9876543-2', '(11) 94567-8901', '(11) 99876-5432', 'maria@example.com', '2006-08-15', 1);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Pedro Santos', '456.789.123-00', '4567891-0', '(11) 93333-4444', '(11) 97777-8888', 'pedro@example.com', '2004-12-20', 1);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Ana Oliveira', '111.222.333-44', '1112223-4', '(11) 95555-6666', '(11) 99999-0000', 'ana@example.com', '2007-03-25', 1);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Luiz Souza', '999.888.777-66', '9998887-7', '(11) 97777-2222', '(11) 93333-1111', 'luiz@example.com', '2003-10-05', 1);

/*Segunda turma*/
INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Carla Silva', '333.444.555-66', '3334445-5', '(11) 98888-7777', '(11) 92222-3333', 'carla@example.com', '2006-07-12', 2);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Fernando Santos', '777.888.999-00', '7778889-9', '(11) 91111-2222', '(11) 94444-5555', 'fernando@example.com', '2005-01-30', 2);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Juliana Costa', '222.333.444-55', '2223334-4', '(11) 93333-8888', '(11) 97777-4444', 'juliana@example.com', '2004-11-25', 2);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Ricardo Oliveira', '555.666.777-88', '5556667-7', '(11) 98888-9999', '(11) 92222-1111', 'ricardo@example.com', '2007-09-18', 2);

INSERT INTO tbl_alunos (nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, id_turma)
VALUES ('Camila Lima', '888.999.000-11', '8889990-0', '(11) 95555-7777', '(11) 93333-5555', 'camila@example.com', '2003-12-03', 2);

/*Diciplinas primeira turma*/

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (1, 'MAT');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (1, 'PORT');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (1, 'CIEN');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (1, 'HIST');

/*Diciplinas segunda turma*/

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (2, 'MAT');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (2, 'FIS');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (2, 'QUI');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (2, 'BIO');

INSERT INTO tbl_disciplinas (id_turma, sigla)
VALUES (2, 'POR');

/*Primeira view*/

CREATE VIEW vw_alunos_turma AS
SELECT a.nome AS nome_aluno, 
       a.tel_aluno, 
       a.tel_responsavel, 
       a.email, 
       t.sigla AS sigla_turma, 
       t.nome AS nome_turma
FROM tbl_alunos a
INNER JOIN tbl_turma t ON a.id_turma = t.id_turma;

/*Segunda view*/

CREATE VIEW vw_disciplinas_turma AS
SELECT d.sigla AS sigla_disciplina, 
       t.sigla AS sigla_turma, 
       t.nome AS nome_turma
FROM tbl_disciplinas d
INNER JOIN tbl_turma t ON d.id_turma = t.id_turma;

/*Terceira view*/

CREATE VIEW vw_alunos_turma_disciplina AS
SELECT a.nome AS nome_aluno, 
       a.tel_aluno, 
       a.tel_responsavel, 
       a.email, 
       CONCAT(t.sigla, '-', t.nome) AS turma, 
       d.sigla AS disciplina
FROM tbl_alunos a
INNER JOIN tbl_turma t ON a.id_turma = t.id_turma
INNER JOIN tbl_disciplinas d ON t.id_turma = d.id_turma;

/*Tabelas de Backup*/
CREATE TABLE tbl_alunos_bkp (
    id_aluno INT UNSIGNED,
    id_turma INT UNSIGNED,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    rg VARCHAR(9),
    tel_aluno VARCHAR(15),
    tel_responsavel VARCHAR(15),
    email VARCHAR(100),
    data_nasc DATE,
    data_hora_exclusao DATETIME
);

/*Triggers de backup*/
delimiter $

CREATE TRIGGER trg_backup_aluno
AFTER DELETE ON tbl_alunos
FOR EACH ROW
BEGIN
    INSERT INTO tbl_alunos_bkp (id_aluno, id_turma, nome, cpf, rg, tel_aluno, tel_responsavel, email, data_nasc, data_hora_exclusao)
    VALUES (OLD.id_aluno, OLD.id_turma, OLD.nome, OLD.cpf, OLD.rg, OLD.tel_aluno, OLD.tel_responsavel, OLD.email, OLD.data_nasc, NOW());
END;

$

/*Procedure aluno-sala*/
delimiter $

create procedure listagem_alunos()
begin

select
a.nome, a.tel_aluno, a.tel_responsavel, a.email, a.data_nasc, b.sigla, b.nome
from tbl_alunos a
inner join tbl_turma b
on b.id_turma = a.id_turma;

end;

$

call listagem_alunos();

/*Procedure busca aluno*/

delimiter $

create procedure busca_alunos(in id_alunoPARAM int)
begin

select
a.nome, a.tel_aluno, a.tel_responsavel, a.email, a.data_nasc, b.sigla, b.nome
from tbl_alunos a
inner join tbl_turma b
on b.id_turma = a.id_turma
where id_aluno = id_alunoPARAM;

end;

$
call busca_alunos(1);

/*Procedure conta aluno*/
delimiter $

create procedure contagem_alunos(out totalAluPARAM int)
begin

select count(id_aluno) into totalAluPARAM from tbl_alunos;

end;

$

call contagem_alunos(@totalAluPARAM);
