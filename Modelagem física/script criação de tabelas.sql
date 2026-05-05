CREATE TABLE tb_planos(
    id_plano           INTEGER,
    valor              DOUBLE PRECISION,
    duracao            INTEGER,
    tipo               VARCHAR(25),

    CONSTRAINT pk_tb_planos_id_plano 
        PRIMARY KEY(id_plano)
);

SELECT * FROM tb_planos;

CREATE TABLE tb_aluno(
    id_aluno           INTEGER,
    id_plano           INTEGER,
    nome               VARCHAR(60) CONSTRAINT nn_tb_aluno_nome NOT NULL,
    telefone           VARCHAR(16),
    data_nascimento    DATE,
    endereco           VARCHAR(100),
    ativo              BOOLEAN,
    tipo               VARCHAR(20),

    CONSTRAINT pk_tb_aluno_id_aluno 
        PRIMARY KEY(id_aluno),

    CONSTRAINT fk_tb_aluno_id_plano
        FOREIGN KEY(id_plano)
        REFERENCES tb_planos(id_plano)
);

SELECT * FROM tb_aluno;

CREATE TABLE tb_treino(
    id_treino          INTEGER,
    id_aluno           INTEGER,
    nome               VARCHAR(25),
    tipo               VARCHAR(25),
    data_treino        DATE,
    status_treino      BOOLEAN,

    CONSTRAINT pk_tb_treino_id_treino 
        PRIMARY KEY(id_treino),

    CONSTRAINT fk_tb_treino_id_aluno
        FOREIGN KEY(id_aluno)
        REFERENCES tb_aluno(id_aluno)
);

SELECT * FROM tb_treino;


CREATE TABLE tb_exercicio(
    id_exercicio       INTEGER,
    nome               VARCHAR(30),
    ds_exercicio       VARCHAR(100),

    CONSTRAINT pk_tb_exercicio_id_exercicio 
        PRIMARY KEY(id_exercicio)
);

SELECT * FROM tb_exercicio;

CREATE TABLE tb_exercicio_treino(
    id_treino          INTEGER,
    id_exercicio       INTEGER,
    series             INTEGER,
    repeticoes         INTEGER,
    carga              DOUBLE PRECISION,
    tempo_descanso     VARCHAR(20),
    status_ex_treino   BOOLEAN,
    potencia           VARCHAR(20),

    CONSTRAINT pk_tb_exercicio_treino_ids
        PRIMARY KEY(id_treino, id_exercicio),

    CONSTRAINT fk_tb_ex_treino_id_treino
        FOREIGN KEY(id_treino)
        REFERENCES tb_treino(id_treino),

    CONSTRAINT fk_tb_ex_treino_id_exercicio
        FOREIGN KEY(id_exercicio)
        REFERENCES tb_exercicio(id_exercicio)
);

SELECT * FROM tb_exercicio_treino;


CREATE TABLE tb_horario_aluno(
    id_aluno           INTEGER,
    horario            VARCHAR(20),
    data_horario       DATE,

    CONSTRAINT pk_tb_horario_aluno
        PRIMARY KEY(id_aluno, horario, data_horario),

    CONSTRAINT fk_tb_horario_aluno_id_aluno
        FOREIGN KEY(id_aluno)
        REFERENCES tb_aluno(id_aluno)
);

SELECT * FROM tb_horario_aluno;

CREATE TABLE tb_horario_treino(
    id_aluno           INTEGER,
    data_horario       DATE,
    horario            VARCHAR(20),
    checkin            BOOLEAN,
    observacao         VARCHAR(100),

    CONSTRAINT pk_tb_horario_treino
        PRIMARY KEY(id_aluno, data_horario, horario),

    CONSTRAINT fk_tb_horario_treino_id_aluno
        FOREIGN KEY(id_aluno)
        REFERENCES tb_aluno(id_aluno)
);

SELECT * FROM tb_horario_treino;
