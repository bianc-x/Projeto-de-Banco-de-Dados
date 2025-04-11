--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-07 21:12:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16472)
-- Name: Alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Alunos" (
    id_aluno integer NOT NULL,
    nome character varying(200) NOT NULL,
    sobrenome character varying(200) NOT NULL,
    email character varying(200),
    telefone character varying(20),
    "ID_curso" integer NOT NULL,
    "ID_ME" integer
);


ALTER TABLE public."Alunos" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16581)
-- Name: Bibliotecas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bibliotecas" (
    "ID_Biblioteca" integer NOT NULL,
    "Nome_biblioteca" character varying(200) NOT NULL,
    "ID_Departamento" integer
);


ALTER TABLE public."Bibliotecas" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16479)
-- Name: Cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cursos" (
    id_curso integer NOT NULL,
    nome_curso character varying(200) NOT NULL,
    id_depar integer NOT NULL,
    tipo character varying(200)
);


ALTER TABLE public."Cursos" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16576)
-- Name: Departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Departamentos" (
    "ID_Departamento" integer NOT NULL,
    "Nome_Departamento" character varying(200) NOT NULL,
    "ID_uni" integer NOT NULL
);


ALTER TABLE public."Departamentos" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16711)
-- Name: Diretorio_academico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Diretorio_academico" (
    "ID_DA" integer NOT NULL,
    "ID_Curso" integer NOT NULL,
    "Predio" character varying,
    "ID_aluno" integer
);


ALTER TABLE public."Diretorio_academico" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16482)
-- Name: Disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Disciplina" (
    "ID_Disciplina" integer NOT NULL,
    "Nome_Disciplina" character varying(200) NOT NULL,
    "ID_Departamento" integer NOT NULL
);


ALTER TABLE public."Disciplina" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16678)
-- Name: Empresa_jr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Empresa_jr" (
    id_ej integer NOT NULL,
    id_depart integer NOT NULL,
    id_aluno integer NOT NULL,
    nome character varying(200) NOT NULL
);


ALTER TABLE public."Empresa_jr" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16596)
-- Name: Emprestimos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Emprestimos" (
    "ID_Emprestimo" integer NOT NULL,
    "ID_Livro" integer NOT NULL,
    "ID_aluno" integer NOT NULL,
    "Data_Emprestimo" date,
    "Data_Devolucao" date
);


ALTER TABLE public."Emprestimos" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16663)
-- Name: Iniciacao_cientifica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Iniciacao_cientifica" (
    id_ic integer NOT NULL,
    id_aluno integer NOT NULL,
    id_prof integer NOT NULL,
    titulo character varying(200) NOT NULL,
    data_ini date,
    data_fim date
);


ALTER TABLE public."Iniciacao_cientifica" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16586)
-- Name: Livros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Livros" (
    "ID_Livro" integer NOT NULL,
    "Titulo" character varying(200) NOT NULL,
    "Autor" character varying(200) NOT NULL,
    "ID_biblioteca" integer NOT NULL
);


ALTER TABLE public."Livros" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16648)
-- Name: Monitoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Monitoria" (
    "ID_monitoria" integer NOT NULL,
    "ID_aluno" integer NOT NULL,
    id_disc integer NOT NULL,
    data_ini date,
    data_fim date
);


ALTER TABLE public."Monitoria" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16723)
-- Name: Moradia_estudantil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Moradia_estudantil" (
    "ID_ME" integer NOT NULL,
    "ID_Uni" integer NOT NULL,
    "Endereco" character varying(200)
);


ALTER TABLE public."Moradia_estudantil" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16487)
-- Name: Professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Professor" (
    "ID_Professor" integer NOT NULL,
    "Nome_prof" character varying(200) NOT NULL,
    "Sobrenome_prof" character varying(200) NOT NULL,
    "Email_prof" character varying(200),
    "Telefone_prof" character varying(200),
    "ID_depart" integer NOT NULL
);


ALTER TABLE public."Professor" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16501)
-- Name: Turma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Turma" (
    "ID_Turma" integer NOT NULL,
    "ID_Disciplina" integer NOT NULL,
    "ID_Professor" integer NOT NULL,
    "Ano" integer,
    "Semestre" integer,
    "ID_aluno" integer
);


ALTER TABLE public."Turma" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16633)
-- Name: Universidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Universidade" (
    "ID_Universidade" integer NOT NULL,
    "Nome" character varying(200) NOT NULL,
    "UF" character(2) NOT NULL
);


ALTER TABLE public."Universidade" OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 16472)
-- Dependencies: 216
-- Data for Name: Alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Alunos" (id_aluno, nome, sobrenome, email, telefone, "ID_curso", "ID_ME") FROM stdin;
3	Pedro	Ferreira	pedro.ferreira@ufrj.br	(21) 3333-2222	2	3
1	João	Silva	joao.silva@uff.br	(21) 9999-8888	1	1
2	Maria	Souza	maria.souza@uff.br	(21) 7777-6666	1	2
4	Julia	Silva	maria.silva@universidade.com	(21) 98765-4321	2	\N
5	Pedro	Santos	pedro.santos@universidade.com	(21) 98765-4321	3	\N
6	Lucas	Souza	lucas.souza@universidade.com	(31) 98765-4321	4	1
7	Carla	Ferreira	carla.ferreira@universidade.com	(41) 98765-4321	5	1
\.


--
-- TOC entry 4945 (class 0 OID 16581)
-- Dependencies: 222
-- Data for Name: Bibliotecas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Bibliotecas" ("ID_Biblioteca", "Nome_biblioteca", "ID_Departamento") FROM stdin;
1	Biblioteca Central - Informática	1
2	Biblioteca de Engenharia	1
3	Biblioteca de Ciências Sociais	2
4	Biblioteca Central	2
5	Biblioteca de Física	3
\.


--
-- TOC entry 4940 (class 0 OID 16479)
-- Dependencies: 217
-- Data for Name: Cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cursos" (id_curso, nome_curso, id_depar, tipo) FROM stdin;
1	Sistemas de Informação	1	Bacharelado
2	Engenharia Elétrica	2	Bacharelado
3	Ciência da Computação	2	Bacharelado
4	Engenharia Civil	3	Bacharelado
\.


--
-- TOC entry 4944 (class 0 OID 16576)
-- Dependencies: 221
-- Data for Name: Departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Departamentos" ("ID_Departamento", "Nome_Departamento", "ID_uni") FROM stdin;
1	Departamento de Informática	1
2	Departamento de Engenharia	1
3	Departamento de Ciências Sociais	2
4	Departamento de Física	3
6	Departamento de Computação	2
7	Departamento de Engenharia Civil	3
\.


--
-- TOC entry 4952 (class 0 OID 16711)
-- Dependencies: 229
-- Data for Name: Diretorio_academico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Diretorio_academico" ("ID_DA", "ID_Curso", "Predio", "ID_aluno") FROM stdin;
1	1	Prédio da Informática	\N
2	2	Prédio da Engenharia	\N
3	2	Edifício Principal	\N
4	3	Bloco de Engenharia	\N
\.


--
-- TOC entry 4941 (class 0 OID 16482)
-- Dependencies: 218
-- Data for Name: Disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Disciplina" ("ID_Disciplina", "Nome_Disciplina", "ID_Departamento") FROM stdin;
1	Algoritmos e Estruturas de Dados	1
2	Circuitos Elétricos	2
3	Programação Avançada	2
4	Estruturas de Concreto	3
\.


--
-- TOC entry 4951 (class 0 OID 16678)
-- Dependencies: 228
-- Data for Name: Empresa_jr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Empresa_jr" (id_ej, id_depart, id_aluno, nome) FROM stdin;
1	1	1	Empresa Júnior de Informática
2	2	2	Empresa Júnior de Engenharia
3	2	2	Junior Empreendedores
4	3	3	Engenharia Junior
\.


--
-- TOC entry 4947 (class 0 OID 16596)
-- Dependencies: 224
-- Data for Name: Emprestimos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Emprestimos" ("ID_Emprestimo", "ID_Livro", "ID_aluno", "Data_Emprestimo", "Data_Devolucao") FROM stdin;
1	1	1	2024-07-01	\N
2	2	2	2024-07-02	\N
3	3	3	2024-07-03	\N
4	4	2	2024-06-25	2024-07-25
5	5	3	2024-06-30	2024-07-30
\.


--
-- TOC entry 4950 (class 0 OID 16663)
-- Dependencies: 227
-- Data for Name: Iniciacao_cientifica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Iniciacao_cientifica" (id_ic, id_aluno, id_prof, titulo, data_ini, data_fim) FROM stdin;
1	1	1	Estudo de Algoritmos	2024-07-01	2025-06-30
2	2	2	Pesquisa em Engenharia	2024-07-02	2025-06-30
3	2	2	Estudo de Algoritmos Avançados	2024-04-01	2024-09-30
4	3	3	Materiais de Construção Sustentável	2024-05-01	2024-10-31
\.


--
-- TOC entry 4946 (class 0 OID 16586)
-- Dependencies: 223
-- Data for Name: Livros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Livros" ("ID_Livro", "Titulo", "Autor", "ID_biblioteca") FROM stdin;
1	Introdução à Programação	Fulano de Tal	1
2	Engenharia de Software	Beltrano da Silva	2
3	História da Sociologia	Ciclano dos Santos	3
4	Introdução à Computação	José da Silva	2
5	Engenharia de Estruturas	Ana Souza	3
\.


--
-- TOC entry 4949 (class 0 OID 16648)
-- Dependencies: 226
-- Data for Name: Monitoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Monitoria" ("ID_monitoria", "ID_aluno", id_disc, data_ini, data_fim) FROM stdin;
1	1	1	2024-07-01	2024-12-31
2	2	2	2024-07-02	2024-12-31
3	2	2	2024-05-01	2024-07-01
4	3	2	2024-05-10	2024-07-10
\.


--
-- TOC entry 4953 (class 0 OID 16723)
-- Dependencies: 230
-- Data for Name: Moradia_estudantil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Moradia_estudantil" ("ID_ME", "ID_Uni", "Endereco") FROM stdin;
3	2	Rua dos Alunos, 789, Rio de Janeiro - RJ
1	1	Rua dos Estudantes, 123, Niterói - RJ
2	1	Avenida das Oliveiras, 456, Niterói - RJ
\.


--
-- TOC entry 4942 (class 0 OID 16487)
-- Dependencies: 219
-- Data for Name: Professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Professor" ("ID_Professor", "Nome_prof", "Sobrenome_prof", "Email_prof", "Telefone_prof", "ID_depart") FROM stdin;
2	José	Oliveira	jose.oliveira@ufrj.br	(21) 5555-4444	2
1	Ana	Pereira	ana.pereira@uff.br	(21) 8888-7777	1
3	João Oliveira	Silva	joao.oliveira@universidade.com	(21) 98765-6789	2
4	Mariana Rodrigues	Santos	mariana.rodrigues@universidade.com	(21) 98765-6789	3
\.


--
-- TOC entry 4943 (class 0 OID 16501)
-- Dependencies: 220
-- Data for Name: Turma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Turma" ("ID_Turma", "ID_Disciplina", "ID_Professor", "Ano", "Semestre", "ID_aluno") FROM stdin;
1	1	1	2024	1	\N
2	2	2	2024	1	\N
3	2	2	2024	1	\N
4	3	3	2024	1	\N
\.


--
-- TOC entry 4948 (class 0 OID 16633)
-- Dependencies: 225
-- Data for Name: Universidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Universidade" ("ID_Universidade", "Nome", "UF") FROM stdin;
1	Universidade Federal Fluminense	RJ
2	Universidade Federal do Rio de Janeiro	RJ
3	Universidade Estadual de Campinas	SP
4	Universidade Estadual do Rio de Janeiro	RJ
5	Universidade Federal Rural do Rio de Janeiro	RJ
\.


--
-- TOC entry 4757 (class 2606 OID 16585)
-- Name: Bibliotecas Bibliotecas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bibliotecas"
    ADD CONSTRAINT "Bibliotecas_pkey" PRIMARY KEY ("ID_Biblioteca");


--
-- TOC entry 4747 (class 2606 OID 16500)
-- Name: Cursos Cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cursos"
    ADD CONSTRAINT "Cursos_pkey" PRIMARY KEY (id_curso);


--
-- TOC entry 4755 (class 2606 OID 16580)
-- Name: Departamentos Departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departamentos"
    ADD CONSTRAINT "Departamentos_pkey" PRIMARY KEY ("ID_Departamento");


--
-- TOC entry 4771 (class 2606 OID 16717)
-- Name: Diretorio_academico Diretorio_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Diretorio_academico"
    ADD CONSTRAINT "Diretorio_academico_pkey" PRIMARY KEY ("ID_DA");


--
-- TOC entry 4749 (class 2606 OID 16486)
-- Name: Disciplina Disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Disciplina"
    ADD CONSTRAINT "Disciplina_pkey" PRIMARY KEY ("ID_Disciplina");


--
-- TOC entry 4769 (class 2606 OID 16682)
-- Name: Empresa_jr Empresa_jr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empresa_jr"
    ADD CONSTRAINT "Empresa_jr_pkey" PRIMARY KEY (id_ej);


--
-- TOC entry 4761 (class 2606 OID 16600)
-- Name: Emprestimos Emprestimos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emprestimos"
    ADD CONSTRAINT "Emprestimos_pkey" PRIMARY KEY ("ID_Emprestimo");


--
-- TOC entry 4745 (class 2606 OID 16478)
-- Name: Alunos Estudantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alunos"
    ADD CONSTRAINT "Estudantes_pkey" PRIMARY KEY (id_aluno);


--
-- TOC entry 4767 (class 2606 OID 16667)
-- Name: Iniciacao_cientifica Iniciacao_cientifica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iniciacao_cientifica"
    ADD CONSTRAINT "Iniciacao_cientifica_pkey" PRIMARY KEY (id_ic);


--
-- TOC entry 4759 (class 2606 OID 16590)
-- Name: Livros Livros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Livros"
    ADD CONSTRAINT "Livros_pkey" PRIMARY KEY ("ID_Livro");


--
-- TOC entry 4765 (class 2606 OID 16652)
-- Name: Monitoria Monitoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Monitoria"
    ADD CONSTRAINT "Monitoria_pkey" PRIMARY KEY ("ID_monitoria");


--
-- TOC entry 4773 (class 2606 OID 16727)
-- Name: Moradia_estudantil Moradia_estudantil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Moradia_estudantil"
    ADD CONSTRAINT "Moradia_estudantil_pkey" PRIMARY KEY ("ID_ME");


--
-- TOC entry 4751 (class 2606 OID 16493)
-- Name: Professor Professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Professor"
    ADD CONSTRAINT "Professor_pkey" PRIMARY KEY ("ID_Professor");


--
-- TOC entry 4753 (class 2606 OID 16505)
-- Name: Turma Turma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Turma"
    ADD CONSTRAINT "Turma_pkey" PRIMARY KEY ("ID_Turma");


--
-- TOC entry 4763 (class 2606 OID 16637)
-- Name: Universidade Universidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Universidade"
    ADD CONSTRAINT "Universidade_pkey" PRIMARY KEY ("ID_Universidade");


--
-- TOC entry 4793 (class 2606 OID 16718)
-- Name: Diretorio_academico fk_ID_Curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Diretorio_academico"
    ADD CONSTRAINT "fk_ID_Curso" FOREIGN KEY ("ID_Curso") REFERENCES public."Cursos"(id_curso);


--
-- TOC entry 4777 (class 2606 OID 16742)
-- Name: Disciplina fk_ID_Departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Disciplina"
    ADD CONSTRAINT "fk_ID_Departamento" FOREIGN KEY ("ID_Departamento") REFERENCES public."Departamentos"("ID_Departamento") NOT VALID;


--
-- TOC entry 4783 (class 2606 OID 16628)
-- Name: Bibliotecas fk_ID_Departamento_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bibliotecas"
    ADD CONSTRAINT "fk_ID_Departamento_" FOREIGN KEY ("ID_Departamento") REFERENCES public."Departamentos"("ID_Departamento") NOT VALID;


--
-- TOC entry 4779 (class 2606 OID 16747)
-- Name: Turma fk_ID_Disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Turma"
    ADD CONSTRAINT "fk_ID_Disciplina" FOREIGN KEY ("ID_Disciplina") REFERENCES public."Disciplina"("ID_Disciplina") NOT VALID;


--
-- TOC entry 4785 (class 2606 OID 16601)
-- Name: Emprestimos fk_ID_Estudante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emprestimos"
    ADD CONSTRAINT "fk_ID_Estudante" FOREIGN KEY ("ID_aluno") REFERENCES public."Alunos"(id_aluno);


--
-- TOC entry 4786 (class 2606 OID 16606)
-- Name: Emprestimos fk_ID_Livro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emprestimos"
    ADD CONSTRAINT "fk_ID_Livro" FOREIGN KEY ("ID_Livro") REFERENCES public."Livros"("ID_Livro");


--
-- TOC entry 4774 (class 2606 OID 16733)
-- Name: Alunos fk_ID_ME; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alunos"
    ADD CONSTRAINT "fk_ID_ME" FOREIGN KEY ("ID_ME") REFERENCES public."Moradia_estudantil"("ID_ME") NOT VALID;


--
-- TOC entry 4780 (class 2606 OID 16752)
-- Name: Turma fk_ID_Professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Turma"
    ADD CONSTRAINT "fk_ID_Professor" FOREIGN KEY ("ID_Professor") REFERENCES public."Professor"("ID_Professor") NOT VALID;


--
-- TOC entry 4795 (class 2606 OID 16728)
-- Name: Moradia_estudantil fk_ID_Uni; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Moradia_estudantil"
    ADD CONSTRAINT "fk_ID_Uni" FOREIGN KEY ("ID_Uni") REFERENCES public."Universidade"("ID_Universidade");


--
-- TOC entry 4787 (class 2606 OID 16653)
-- Name: Monitoria fk_ID_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Monitoria"
    ADD CONSTRAINT "fk_ID_aluno" FOREIGN KEY ("ID_aluno") REFERENCES public."Alunos"(id_aluno);


--
-- TOC entry 4781 (class 2606 OID 16772)
-- Name: Turma fk_ID_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Turma"
    ADD CONSTRAINT "fk_ID_aluno" FOREIGN KEY ("ID_aluno") REFERENCES public."Alunos"(id_aluno) NOT VALID;


--
-- TOC entry 4794 (class 2606 OID 16777)
-- Name: Diretorio_academico fk_ID_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Diretorio_academico"
    ADD CONSTRAINT "fk_ID_aluno" FOREIGN KEY ("ID_aluno") REFERENCES public."Alunos"(id_aluno) NOT VALID;


--
-- TOC entry 4784 (class 2606 OID 16706)
-- Name: Livros fk_ID_biblioteca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Livros"
    ADD CONSTRAINT "fk_ID_biblioteca" FOREIGN KEY ("ID_biblioteca") REFERENCES public."Bibliotecas"("ID_Biblioteca") NOT VALID;


--
-- TOC entry 4775 (class 2606 OID 16757)
-- Name: Alunos fk_ID_curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alunos"
    ADD CONSTRAINT "fk_ID_curso" FOREIGN KEY ("ID_curso") REFERENCES public."Cursos"(id_curso) NOT VALID;


--
-- TOC entry 4778 (class 2606 OID 16762)
-- Name: Professor fk_ID_depart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Professor"
    ADD CONSTRAINT "fk_ID_depart" FOREIGN KEY ("ID_depart") REFERENCES public."Departamentos"("ID_Departamento") NOT VALID;


--
-- TOC entry 4788 (class 2606 OID 16658)
-- Name: Monitoria fk_ID_disc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Monitoria"
    ADD CONSTRAINT "fk_ID_disc" FOREIGN KEY (id_disc) REFERENCES public."Disciplina"("ID_Disciplina");


--
-- TOC entry 4782 (class 2606 OID 16701)
-- Name: Departamentos fk_ID_uni; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departamentos"
    ADD CONSTRAINT "fk_ID_uni" FOREIGN KEY ("ID_uni") REFERENCES public."Universidade"("ID_Universidade") NOT VALID;


--
-- TOC entry 4789 (class 2606 OID 16668)
-- Name: Iniciacao_cientifica fk_id_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iniciacao_cientifica"
    ADD CONSTRAINT fk_id_aluno FOREIGN KEY (id_aluno) REFERENCES public."Alunos"(id_aluno);


--
-- TOC entry 4791 (class 2606 OID 16683)
-- Name: Empresa_jr fk_id_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empresa_jr"
    ADD CONSTRAINT fk_id_aluno FOREIGN KEY (id_aluno) REFERENCES public."Alunos"(id_aluno);


--
-- TOC entry 4792 (class 2606 OID 16688)
-- Name: Empresa_jr fk_id_depart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empresa_jr"
    ADD CONSTRAINT fk_id_depart FOREIGN KEY (id_depart) REFERENCES public."Departamentos"("ID_Departamento");


--
-- TOC entry 4776 (class 2606 OID 16694)
-- Name: Cursos fk_id_depart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cursos"
    ADD CONSTRAINT fk_id_depart FOREIGN KEY (id_depar) REFERENCES public."Departamentos"("ID_Departamento") NOT VALID;


--
-- TOC entry 4790 (class 2606 OID 16673)
-- Name: Iniciacao_cientifica fk_id_prof; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iniciacao_cientifica"
    ADD CONSTRAINT fk_id_prof FOREIGN KEY (id_prof) REFERENCES public."Professor"("ID_Professor");


-- Completed on 2024-07-07 21:12:20

--
-- PostgreSQL database dump complete
--

