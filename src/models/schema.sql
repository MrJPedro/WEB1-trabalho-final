DROP DATABASE IF EXISTS alunos;
CREATE DATABASE alunos;
USE alunos;

DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS tipo;

CREATE TABLE IF NOT EXISTS tiposCursos (
    curso_tipo varchar(20) primary key
);

CREATE TABLE IF NOT EXISTS turnosCursos (
    curso_turno varchar(10) primary key
);

CREATE TABLE IF NOT EXISTS cursos (
    id_curso int primary key AUTO_INCREMENT,
    nome_curso varchar(100) not null,
    carga_horaria int not null,
    vis bit(1),
    curso_tipo varchar(20) not null,
    curso_turno varchar(10) not null,
    constraint fkCursosTiposCursos foreign key (curso_tipo) references tiposCursos (curso_tipo),
    constraint fkCursosTurnosCursos foreign key (curso_turno) references turnosCursos (curso_turno)
);

CREATE TABLE IF NOT EXISTS matriculas (
    estado_matricula varchar(10) primary key 
);

CREATE TABLE IF NOT EXISTS alunos (
    id_aluno int AUTO_INCREMENT primary key,
    nome_aluno varchar(100) not null,
    email_aluno varchar(100) unique,
    tel_aluno char(14),
    vis bit(1),
    id_curso int not null,
    estado_matricula varchar(10) not null,
    constraint fkAlunosCursos foreign key (id_curso) references cursos (id_curso),
    constraint fkAlunosMatriculas foreign key (estado_matricula) references matriculas (estado_matricula)
);

insert into tiposCursos (curso_tipo)
    values ('Bacharelado'),
    ('Tecnólogo'),
    ('Engenharia');

insert into turnosCursos (curso_turno)
    values ('Matutino'),
    ('Vespertino'),
    ('Noturno'),
    ('Integral');

insert into cursos (nome_curso, carga_horaria, vis, curso_tipo, curso_turno)
    values ('Análise e Desenvolvimento de Sistemas', 2310, 1,'Tecnólogo', 'Noturno'),
    ('Ciência da Computação', 3200, 1, 'Bacharelado', 'Integral'),
    ('Engenharia Elétrica', 3600, 1, 'Engenharia', 'Integral');

insert into matriculas (estado_matricula)
    values ('Ativa'),
    ('Trancada'),
    ('Cancelada');

insert into alunos (nome_aluno, email_aluno, tel_aluno, vis, id_curso, estado_matricula) values
    ('João Pedro Gonçalves Cardoso', 'joao.mail@ufpr.br', '(41)91111-1111', 1, 1, 'Ativa'),
    ('Kauan Kelvin', 'kauan.mail@ufpr.br', '(41)92222-2222', 1, 1, 'Ativa'),
    ('João Gabriel Fanti', 'fanti.mail@ufpr.br', '(41)93333-3333', 1, 2, 'Ativa'),
    ('Fulano de Tal', 'fulano.mail@ufpr.br', '(41)94444-4444', 1, 3, 'Trancada'),
    ('Ciclano de Tal', 'ciclano.mail@ufpr.br', '(41)95555-5555', 1, 3, 'Cancelada');


show tables;
select * from alunos;