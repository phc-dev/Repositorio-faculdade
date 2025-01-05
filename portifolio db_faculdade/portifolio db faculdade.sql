create database db_faculdade_ead;

use db_faculdade_ead;

create table tbl_alunos(
	id_alunos int not null primary key auto_increment,
	matricula_aluno int not null,
    nome_alunos varchar(120) not null,
	rg varchar(21) not null,
	cpf varchar(25) not null,
	data_nascimento date,
    email varchar(150) not null,
	unique index(id_alunos) );

create table tbl_telefonealunos(
	id_telefonealunos int not null primary key auto_increment,
    telefone varchar(20) not null,
    fk_alunos int,
    unique index(id_telefonealunos),
    constraint foreign key (fk_alunos)
    references tbl_alunos(id_alunos));
    
create table tbl_curso(
	id_curso int not null primary key auto_increment,
    nome_curso varchar(100) not null,
    duracao_curso varchar(50) not null,
    especializacao varchar(50) not null,
    matricula_curso int not null,
    categoria varchar(100) not null,
    unique index(id_curso));
    
create table tbl_materias(
	id_materias int not null primary key auto_increment,
    nome_materia varchar(85) not null,
    qtde_unidade int not null,
    categoria_materias varchar(85) not null,
    obrigatoriedade boolean not null,
    unique index(id_materias));
    
create table tbl_notas_alunos(
	id_notas_alunos int not null primary key auto_increment,
    nota1 float not null,
    nota2 float not null,
    nota3 float not null,
    nota4 float not null,
    unique index(id_notas_alunos));
    
create table tbl_notas_alunos_materias(
	id_notas_alunos int,
    id_materias int,
    constraint foreign key (id_notas_alunos)
    references tbl_notas_alunos(id_notas_alunos),
    constraint foreign key (id_materias)
    references tbl_materias(id_materias));
    
create table tbl_professores(
	id_professores int not null primary key auto_increment,
    nome_professores varchar(100) not null,
    rg varchar(21) not null,
    cpf varchar(25) not null,
    especializacao varchar(50),
    unique index(id_professores));

create table tbl_telefoneprofessores(
	id_telefoneprofessores int not null primary key auto_increment,
    numero varchar(30) not null,
    fk_professores int,
    constraint foreign key(fk_professores)
    references tbl_professores(id_professores));
    
create table tbl_disciplina(
	id_disciplina int not null primary key auto_increment,
    nome_disciplina varchar(50) not null,
    fk_professores int,
    unique index(id_disciplina),
    constraint foreign key(fk_professores)
    references tbl_professores(id_professores));

create table tbl_turmas(
	id_turmas int not null primary key auto_increment,
    capacidade int not null,
    fk_curso int,
    fk_alunos int,
    fk_materias int,
    fk_professores int,
    unique index(id_turmas),
    constraint foreign key (fk_curso)
    references tbl_curso(id_curso),
    constraint foreign key (fk_alunos)
    references tbl_alunos (id_alunos),
    constraint foreign key (fk_materias)
    references tbl_materias (id_materias),
    constraint foreign key (fk_professores)
    references tbl_professores (id_professores));