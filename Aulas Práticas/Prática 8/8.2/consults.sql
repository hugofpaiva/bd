-- listagem de todos os produtos  
SELECT *
FROM Perfumaria.dbo.produto

-- listagem de todos os produtos com promoção superior a 20%
SELECT *
FROM ((Perfumaria.dbo.produto JOIN Perfumaria.dbo.Produto_tem_promocao ON id=produto_id) JOIN Perfumaria.dbo.Produto ON promocaoID=id)
WHERE desconto > 20

-- lista de produtos favoritos de cada cliente
SELECT *
FROM (Perfumaria.dbo.cliente JOIN Perfumaria.dbo.clientefavorita ON email=clienteemail)
GROUP BY clienteemail

-- lista de perfumes de uma certa marca
SELECT marca, linha, tamanho, imagem
FROM Perfumaria.dbo.Perfume
WHERE marca = 'exemplo'

-- lista de contactos de um utilizador de um certo email
SELECT *
FROM (Perfumaria.dbo.utilizador JOIN Perfumaria.dbo.contacto ON email=utilizador_email)
WHERE email = 'exemplo'

-- marcações de cada cliente para uma certa data
SELECT *
FROM (Perfumaria.dbo.cliente JOIN Perfumaria.dbo.marcacao ON email=cliente_email)
WHERE data = 'exemplo'

-- compras feitas por um utilizador
SELECT *
FROM ((Perfumaria.dbo.cliente JOIN Perfumaria.dbo.compra ON email=clienteemail) JOIN Perfumaria.dbo.compra_tem_produto ON numero=compranumero)
WHERE email = 'exemplo'
GROUP BY compranumero