--7.5
--A)
--i)
CREATE VIEW titulos_autores AS
	SELECT title, au_fname, au_lname
	FROM ((pubs.dbo.titles JOIN pubs.dbo.titleauthor ON pubs.dbo.titles.title_id=pubs.dbo.titleauthor.title_id) JOIN pubs.dbo.authors ON pubs.dbo.titleauthor.au_id=pubs.dbo.authors.au_id);
--ii)
CREATE VIEW editores_funcname AS
	SELECT pub_name, fname, lname
	FROM (pubs.dbo.publishers JOIN pubs.dbo.employee ON pubs.dbo.employee.pub_id=pubs.dbo.publishers.pub_id);

--iii)
CREATE VIEW lojas_titulos AS
	SELECT stor_name, title
	FROM ((pubs.dbo.titles JOIN pubs.dbo.sales ON pubs.dbo.titles.title_id=pubs.dbo.sales.title_id) JOIN pubs.dbo.stores on pubs.dbo.sales.stor_id=pubs.dbo.stores.stor_id)
	GROUP BY stor_name, title; -- Perguntar se é necessários

--iv)
CREATE VIEW livros_business AS
	SELECT *
	FROM pubs.dbo.titles
	WHERE type='Business';


--B)
--i) Selecionar os títulos dos livros com autores com o primeiro nome ‘Albert’
SELECT title
FROM titulos_autores
WHERE au_fname='Albert'

--ii) Selecionar os empregados da editora ‘Binnet & Hardley’
SELECT pub_name, fname
FROM editores_funcname
WHERE pub_name='Binnet & Hardley'

--iii) Selecionar os títulos dos livros vendidos na loja ‘Bookbeat’
SELECT title
FROM lojas_titulos
WHERE stor_name='Bookbeat'

--iv) Selecionar os livros do tipo ‘Business’ em que o preço é superior a 10€
SELECT *
FROM livros_business
WHERE price>10

--C)

ALTER VIEW titulos_autores AS
	SELECT title, au_fname, au_lname, titles.title_id
	FROM ((pubs.dbo.titles JOIN pubs.dbo.titleauthor ON pubs.dbo.titles.title_id=pubs.dbo.titleauthor.title_id) JOIN pubs.dbo.authors ON pubs.dbo.titleauthor.au_id=pubs.dbo.authors.au_id);

ALTER VIEW lojas_titulos AS
	SELECT stor_name, title, titles.title_id
	FROM ((pubs.dbo.titles JOIN pubs.dbo.sales ON pubs.dbo.titles.title_id=pubs.dbo.sales.title_id) JOIN pubs.dbo.stores on pubs.dbo.sales.stor_id=pubs.dbo.stores.stor_id)
	GROUP BY stor_name, title, titles.title_id; -- Perguntar se é necessários

SELECT stor_name, concat(au_fname,' ',au_lname) AS author
FROM titulos_autores JOIN lojas_titulos ON titulos_autores.title_id=lojas_titulos.title_id


-- D) Provavelmente não daria pq o tipo dos livros da View são Business e o tipo que estamos a inserir é ‘popular_comp’.
