import pyodbc
import xlrd 
import sys

loc = ("./dados.xlsx") 

# Abrir Workbook
wb = xlrd.open_workbook(loc) 


# Ligação à base de dados

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                    'Server=HUGOPAIVA450A;'  #FIXME Adicionar o nome do serviodr
                    'Database=Perfumaria;'
                    'Trusted_Connection=yes;')
cursor = conn.cursor()




# Funções de Inserção
def promocao(id, nome, desconto, datainicio, datafim):
    cursor.execute('INSERT INTO Perfumaria.dbo.promocao (nome, desconto, datainicio, datafim) VALUES (?,?,?,?)', (nome, desconto, datainicio, datafim))

def produto_tem_promocao(produtoid, promocaoid):
    cursor.execute('INSERT INTO Perfumaria.dbo.produto_tem_promocao VALUES (?,?)', (produtoid, promocaoid))

def produto(id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario, deleted):
    call = 'INSERT INTO Perfumaria.dbo.produto (preco, categoria, nome, marca, linha, imagem, stock, deleted'
    count = 0
    values = [preco, categoria, nome, marca, linha, imagem, stock, deleted]
    if familiaolfativa != '':
        call+=', familiaolfativa'
        values.append(familiaolfativa)
        count+=1
    if tamanho != '':
        call+=', tamanho'
        values.append(tamanho)
        count+=1
    if descricao != '':
        call+=', descricao'
        values.append(descricao)
        count+=1
    if destinatario != '':
        call+=', destinatario'
        values.append(destinatario)
        count+=1
    call+=') VALUES (?, ?, ?, ?, ?, ?, ?, ?'
    for x in range(0, count):
        call+=', ?'
    call+=')'
    cursor.execute(call, tuple(values))
    

def perfume(id):
    cursor.execute('INSERT INTO Perfumaria.dbo.perfume VALUES (?)', (id))

def cosmetica(id, tipo):
    cursor.execute('INSERT INTO Perfumaria.dbo.cosmetica VALUES (?, ?)', (id, tipo))

def clientefavorita(clienteemail, produtoid):
    cursor.execute('INSERT INTO Perfumaria.dbo.clientefavorita VALUES (?, ?)', (clienteemail, produtoid))

def cupao(id, datainicio, datafim, pontos_atribuidos):
    cursor.execute('INSERT INTO Perfumaria.dbo.cupao VALUES (?, ?, ?, ?)', (id, datainicio, datafim, pontos_atribuidos))

def cliente_usa_cupao(cliente_email, cupao_id):
    cursor.execute('INSERT INTO Perfumaria.dbo.cliente_usa_cupao VALUES (?, ?)', (cliente_email, cupao_id))

def cliente(email, pontos, newsletter, pagamento):
    call = 'INSERT INTO Perfumaria.dbo.cliente (email, pontos, newsletter'
    count = 0
    values = [email, pontos, newsletter]
    if pagamento != '':
        call+=', pagamento'
        values.append(pagamento)
        count+=1
    call+=') VALUES (?, ?, ?'
    for x in range(0, count):
        call+=', ?'
    call+=')'
    cursor.execute(call, tuple(values))

def utilizador(email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id, pontos, newsletter, pagamento, administrator, salario):
    if(pontos != ''):
        call = """\
        DECLARE @responseMessage VARCHAR(250);
        EXEC dbo.RegisterClient @responseMessage OUTPUT, @email=?, @contribuinte=?, @fname=?, @lname=?, @password=?, @sexo=?, @dataNasc=?, @foto=?, @pontos=?, @newsletter=?, @pagamento=?, @contacto_default_id=?;
        SELECT @responseMessage AS rm;
        """
        values = (email, contribuinte, fname, lname, pw, sexo, grade, dataNasc, foto, pontos, newsletter, pagamento, contacto_default_id)
        cursor.execute(call, values)
        rm = cursor.fetchval()
    elif(administrator != ''):
        call = """\
        DECLARE @responseMessage VARCHAR(250);
        EXEC dbo.RegisterFunc @responseMessage OUTPUT, @email=?, @contribuinte=?, @fname=?, @lname=?, @password=?, @sexo=?, @dataNasc=?, @foto=?, @administrator=?, @salario=?, @contacto_default_id=?;
        SELECT @responseMessage AS rm;
        """
        values = (email, contribuinte, fname, lname, pw, sexo, grade, dataNasc, foto, administrator, salario, contacto_default_id)
        cursor.execute(call, values)
        rm = cursor.fetchval()
    

def funcionario(email, administrator, salario):
    cursor.execute('INSERT INTO Perfumaria.dbo.funcionario VALUES (?, ?, ?)', (email, administrator, salario))

def contacto(id, utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade):
    cursor.execute('INSERT INTO Perfumaria.dbo.contacto (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)', (utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade))

def compra_tem_produto(compranumero, produtoid, unidades):
    cursor.execute('INSERT INTO Perfumaria.dbo.compra_tem_produto VALUES (?, ?, ?)', (compranumero, produtoid, unidades))

def compra(numero, contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados):
    call = 'INSERT INTO Perfumaria.dbo.compra (contribuinte, datacompra, pagamento, clienteemail'
    count = 0
    values = [contribuinte, datacompra, pagamento, clienteemail]
    if pontosgastos != '':
        call+=', pontosgastos'
        values.append(pontosgastos)
        count+=1
    if pontosacumulados != '':
        call+=', pontosacumulados'
        values.append(pontosacumulados)
        count+=1
    call+=') VALUES (?, ?, ?, ?'
    for x in range(0, count):
        call+=', ?'
    call+=')'
    cursor.execute(call, tuple(values))

def servico(id, tipo, preco):
    cursor.execute('INSERT INTO Perfumaria.dbo.servico (tipo, preco) VALUES (?, ?)', (tipo, preco))

def funcionario_faz_servico(funcionario_email, servico_id, duracao_media):
    cursor.execute('INSERT INTO Perfumaria.dbo.funcionario_faz_servico VALUES (?, ?, ?)', (funcionario_email, servico_id, duracao_media))

def compra_online(numero, rating, observacao, rastreamento, presente, contactoid):
    call = 'INSERT INTO Perfumaria.dbo.compra_online (numero, presente, contactoid'
    count = 0
    values = [numero, presente, contactoidl]
    if rating != '':
        call+=', rating'
        values.append(rating)
        count+=1
    if observacao != '':
        call+=', observacao'
        values.append(observacao)
        count+=1
    if rastreamento != '':
        call+=', rastreamento'
        values.append(rastreamento)
        count+=1
    call+=') VALUES (?, ?, ?'
    for x in range(0, count):
        call+=', ?'
    call+=')'
    cursor.execute(call, tuple(values))

def compra_presencial(numero, funcemail):
    cursor.execute('INSERT INTO Perfumaria.dbo.compra_presencial VALUES (?, ?)', (funcionario_email, servico_id, duracao_media))

def marcacao(id, cliente_email, servico_id, funcionario_email, dataMarc):
    cursor.execute('INSERT INTO Perfumaria.dbo.marcacao (cliente_email, servico_id, funcionario_email, dataMarc) VALUES (?, ?, ?, ?)', (cliente_email, servico_id, funcionario_email, dataMarc))


def choose(sheet, values):
    if sheet == "promocao":
        promocao(values[0], values[1], values[2], values[3], values[4])
    elif sheet == "produto_tem_promocao":
        produto_tem_promocao(values[0], values[1])
    elif sheet == "produto":
        produto(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11], values[12])
    elif sheet == "perfume":
        perfume(values[0])
    elif sheet == "cosmetica":
        cosmetica(values[0], values[1])
    elif sheet == "clientefavorita":
        clientefavorita(values[0], values[1])
    elif sheet == "cupao":
        cupao(values[0], values[1], values[2], values[3])
    elif sheet == "cliente_usa_cupao":
        cliente_usa_cupao(values[0], values[1])
    elif sheet == "cliente":
        cliente(values[0], values[1], values[2], values[3])
    elif sheet == "utilizador":
        utilizador(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11], values[12], values[13])
    elif sheet == "funcionario":
        funcionario(values[0], values[1], values[2])
    elif sheet == "contacto":
        contacto(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8])
    elif sheet == "compra_tem_produto":
        compra_tem_produto(values[0], values[1], values[2])
    elif sheet == "compra":
        compra(values[0], values[1], values[2], values[3], values[4], values[5], values[6])
    elif sheet == "servico":
        servico(values[0], values[1], values[2])
    elif sheet == "funcionario_faz_servico":
        funcionario_faz_servico(values[0], values[1], values[2])
    elif sheet == "compra_online":
        compra_online(values[0], values[1], values[2], values[3], values[4], values[5])
    elif sheet == "compra_presencial":
        compra_presencial(values[0], values[1])
    elif sheet == "marcacao":
        marcacao(values[0], values[1], values[2], values[3], values[4])


# Percorrer as sheets todas
pointSheets = wb.sheet_names()
counter=0
for sheet_name in pointSheets:
    sheet = wb.sheet_by_index(counter)
    for row in range(1,sheet.nrows):
        call = [sheet.cell_value(row, column) for column in range(0, sheet.ncols)]
        choose(sheet_name, call)
    counter+=1
