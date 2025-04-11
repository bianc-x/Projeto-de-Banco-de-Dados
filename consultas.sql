-- Total de livros em cada biblioteca
SELECT b."ID_Biblioteca", b."Nome_biblioteca", COUNT(l."ID_Livro") AS Total_Livros
FROM public."Bibliotecas" b, public."Livros" l
WHERE b."ID_Biblioteca" = l."ID_biblioteca"
GROUP BY b."ID_Biblioteca", b."Nome_biblioteca";

-- Total de empréstimos realizados por cada aluno
SELECT a."id_aluno", a."nome", COUNT(e."ID_Emprestimo") AS Total_Emprestimos
FROM public."Alunos" a, public."Emprestimos" e
WHERE a."id_aluno" = e."ID_aluno"
GROUP BY a."id_aluno", a."nome"
ORDER BY Total_Emprestimos DESC;

-- Alunos que emprestaram livros específicos
SELECT a."nome", a."sobrenome", l."Titulo"
FROM public."Alunos" a
JOIN public."Emprestimos" e ON a."id_aluno" = e."ID_aluno"
JOIN public."Livros" l ON e."ID_Livro" = l."ID_Livro"
WHERE l."Titulo" = 'História da Sociologia';

-- Lista de professores por universidade
SELECT p."Nome_prof", p."Sobrenome_prof", u."Nome"
FROM public."Professor" p
JOIN public."Departamentos" d ON p."ID_depart" = d."ID_Departamento"
JOIN public."Universidade" u ON d."ID_uni" = u."ID_Universidade";

-- Professores que orientaram iniciação científica
SELECT p."Nome_prof", p."Sobrenome_prof", ic."titulo"
FROM public."Professor" p
JOIN public."Iniciacao_cientifica" ic ON p."ID_Professor" = ic."id_prof";

-- Professor com mais orientação em iniciação científica
SELECT p."ID_Professor", p."Nome_prof", p."Sobrenome_prof", COUNT(ic."id_ic") AS "Total_Orientacoes"
FROM public."Professor" p
JOIN public."Iniciacao_cientifica" ic ON p."ID_Professor" = ic."id_prof"
GROUP BY p."ID_Professor", p."Nome_prof", p."Sobrenome_prof"
ORDER BY "Total_Orientacoes" DESC
LIMIT 1;

-- Calcular a média de duração dos empréstimos (em dias) para cada aluno:
SELECT a."id_aluno", a."nome", a."sobrenome", AVG(e."Data_Devolucao" - e."Data_Emprestimo") AS "Media_Duracao_Emprestimos"
FROM public."Alunos" a
JOIN public."Emprestimos" e ON a."id_aluno" = e."ID_aluno"
GROUP BY a."id_aluno", a."nome", a."sobrenome";

--Alunos que realizaram monitoria em uma disciplina específica
SELECT a."nome", a."sobrenome", d."Nome_Disciplina"
FROM public."Alunos" a
JOIN public."Monitoria" m ON a."id_aluno" = m."ID_aluno"
JOIN public."Disciplina" d ON m."id_disc" = d."ID_Disciplina"
WHERE d."Nome_Disciplina" = 'Algoritmos e Estruturas de Dados';

--Universidades com mais de 3 departamentos
SELECT u."Nome", COUNT(d."ID_Departamento")
FROM public."Universidade" u
JOIN public."Departamentos" d ON u."ID_Universidade" = d."ID_uni"
GROUP BY u."Nome"
HAVING COUNT(d."ID_Departamento") > 3;

-- Cursos oferecidos por cada departamento
SELECT d."Nome_Departamento", c."nome_curso"
FROM public."Departamentos" d
JOIN public."Cursos" c ON d."ID_Departamento" = c."id_depar";



