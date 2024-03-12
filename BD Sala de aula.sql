create database db_sala_de_aula;

use db_sala_de_aula;

create table tbl_alunos(
	id_aluno int unsigned auto_increment primary key,
    id_turma int unsigned,
    nome varchar(100),
    cpf varchar(14),
    rg varchar(9),
    tel_aluno varchar(11),
    tel_responsavel varchar(11),
    email varchar(100),
    data_nasc date,
    
    foreign key(id_turma) references tbl_turma(id_turma)
);

create table tbl_turma(
	id_turma int unsigned auto_increment primary key,
    sigla varchar(3) unique,
    nome varchar(100)
);

create table tbl_disciplinas(
	id_diciplina int unsigned auto_increment primary key,
    id_turma int unsigned,
    sigla varchar(5),
    
    foreign key(id_turma) references tbl_turma(id_turma)
);

create table tbl_frequencia(
	id_aluno int unsigned auto_increment primary key,
    id_disciplina int unsigned,
    data_chamada date,
    frequencia decimal(2,2),
    
    foreign key(id_aluno) references tbl_alunos(id_aluno),
    foreign key(id_disciplina) references tbl_disciplinas(id_disciplina)
);

insert into tbl_turma(sigla, nome)
values('BTT','Batata'),
('PAO','Pão');

insert into tbl_alunos(id_turma, nome, cpf /*continuado dps*/