DROP INDEX idx_produto on Perfumaria.perf.produto;
GO

CREATE INDEX idx_produto
ON Perfumaria.perf.produto (preco, marca, nome, categoria);
GO