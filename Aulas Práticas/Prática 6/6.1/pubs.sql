/** a) **/ 

SELECT * FROM authors;

/** b) **/ 

SELECT au_fname, au_lname, phone FROM authors;

/** c) **/ 

SELECT au_fname, au_lname, phone 
FROM authors
ORDER BY
au_fname,
au_lname;

/** d) **/ 

SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
FROM authors
ORDER BY
au_fname,
au_lname;

/** e) **/ 
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
FROM  authors
WHERE state='CA' AND au_lname!='Ringer'
ORDER BY
au_fname,
au_lname;

/** f) **/ 

SELECT * FROM publishers
WHERE pub_name LIKE '%Bo%';

/** g) **/ 

SELECT distinct pub_name 
FROM publishers 
INNER JOIN titles ON publishers.pub_id=titles.pub_id 
WHERE titles.type='business';

/** h) **/ 

SELECT  pub_name, SUM(qty) AS sales
FROM (publishers INNER JOIN titles ON publishers.pub_id=titles.pub_id) INNER JOIN sales ON titles.title_id=sales.title_id 
GROUP BY pub_name;


/** i) **/ 

SELECT  pub_name, titles.title, SUM(qty) AS sales
FROM (publishers INNER JOIN titles ON publishers.pub_id=titles.pub_id) INNER JOIN sales ON titles.title_id=sales.title_id 
GROUP BY pub_name, titles.title;

/** j) **/ 

SELECT stor_name, SUM(qty) AS vendas
FROM(stores INNER JOIN sales ON stores.stor_id=sales.stor_id)
WHERE stor_name='Bookbeat'
GROUP BY stor_name;

/** k) **/ 

SELECT au_fname AS first_name, au_lname AS last_name
FROM (authors INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id) INNER JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY au_fname, au_lname
HAVING COUNT(distinct titles.type)>1;

/** l) **/ 

SELECT titles.type, titles.pub_id, AVG(price) AS preco_medio, SUM(qty) AS vendas
FROM titles INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY titles.type, pub_id;

/** m) **/ 

SELECT titles.type
FROM titles
GROUP BY titles.type
HAVING MAX(advance)>=1.5*AVG(advance);

/** n) **/ 

SELECT titles.title, au_fname, au_lname, titles.ytd_sales*titles.price*royalty/100*royaltyper/100 as ganho
FROM ((titles INNER JOIN sales ON titles.title_id=sales.title_id) INNER JOIN titleauthor ON titles.title_id=titleauthor.title_id) INNER JOIN authors ON titleauthor.au_id=authors.au_id
GROUP BY titles.title, authors.au_fname, authors.au_lname, titles.ytd_sales*titles.price*royalty/100*royaltyper/100;

/** o) **/ 

SELECT titles.title, ytd_sales, ytd_sales*price AS facturacao, titles.ytd_sales*titles.price*royalty/100 AS auths_revenue, ytd_sales-titles.ytd_sales*titles.price*royalty/100 AS publisher_revenue
FROM titles

/** p) **/ 

SELECT titles.title, titles.ytd_sales, ytd_sales*price AS facturacao, authors.au_fname+' '+authors.au_lname AS author, titles.ytd_sales*titles.price*royalty/100*royaltyper/100 as auths_revenue, ytd_sales*price-titles.ytd_sales*titles.price*royalty/100 AS publisher_revenue
FROM  (titles INNER JOIN titleauthor ON titles.title_id=titleauthor.title_id) INNER JOIN authors ON titleauthor.au_id=authors.au_id

/** q) **/ 

SELECT stor_name, COUNT(title) AS num_titles
FROM ((stores INNER join sales ON stores.stor_id=sales.stor_id) INNER join titles ON sales.title_id=titles.title_id)
GROUP BY stor_name
HAVING COUNT(title)=(SELECT COUNT(title_id) FROM titles);

/** r) **/ 

SELECT stor_name, SUM(qty) AS Vendas
FROM stores INNER JOIN sales ON sales.stor_id=stores.stor_id
GROUP BY stor_name
HAVING SUM(qty)>((SELECT SUM(qty) from stores INNER JOIN sales ON sales.stor_id=stores.stor_id)/ (SELECT DISTINCT COUNT(stor_name) from stores));

/** s) **/ 

SELECT titles.title FROM titles
EXCEPT(SELECT titles.title from ((titles INNER JOIN sales ON titles.title_id=sales.title_id) INNER JOIN stores ON sales.stor_id=stores.stor_id) 
WHERE stor_name='Bookbeat');

/** t) **/ 

SELECT pub_name, stor_name
FROM publishers,stores
GROUP BY pub_name, stor_name
EXCEPT (SELECT pub_name, stor_name
FROM (((publishers INNER JOIN titles ON publishers.pub_id=titles.pub_id) INNER JOIN sales ON titles.title_id=sales.title_id) INNER JOIN stores ON sales.stor_id=stores.stor_id)
GROUP BY pub_name, stor_name)



