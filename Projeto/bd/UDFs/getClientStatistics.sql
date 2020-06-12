

SELECT SUM(unidades*preco) FROM (Perfumaria.perf.compra_tem_produto JOIN Perfumaria.perf.compra ON compranumero=numero) JOIN Perfumaria.perf.produto ON produtoid=produto.id WHERE clienteemail = @email;

SELECT SUM(preco) FROM (Perfumaria.perf.marcacao JOIN Perfumaria.perf.servico ON servico_id=servico.id) WHERE cliente_email = @email;

