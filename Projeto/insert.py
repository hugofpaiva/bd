import pyodbc
import xlrd 

loc = ("./dados.xlsx") 

# Abrir Workbook
wb = xlrd.open_workbook(loc) 

'''
# Ligação à base de dados
try:
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=;'  #FIXME Adicionar o nome do serviodr
                        'Database=Perfumaria;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

except:
    print("Erro ao ligar à base de dados!")
    sys.exit()
'''

# Funções de Inserção


def promocao(id, nome, desconto, datainicio, datafim):
    print("Promocao")

def produto_tem_promocao(produtoid, promocaoid):
    print("Produtotem")

def produto(id, preco, familiaolfativa, categoria, nome, marca, linha, tamanho, descricao, imagem, stock, destinatario):
    print("Produto")

def perfume(id):
    print("Perfume")

def cosmetica(id, tipo):
    print("Cosmetica")

def clientefavorita(clienteemail, produtoid):
    print("Favorita")

def cupao(id, datainicio, datafim, pontos_atribuidos):
    print("CUPAO")

def cliente_usa_cupao(cliente_email, cupao_id):
    print("usacupa")

def cliente(email, pontos, newsletter, pagamento):
    print("clien")

def utilizador(email, contribuinte, fname, lname, pw, sexo, dataNasc, foto, contacto_default_id):
    print("utilizado")

def funcionario(email, administrator, salario):
    print("funcionario")

def contacto(id, utilizador_email, telemovel, visibilidade, codigo_postal, pais, endereco, apartamento, localidade):
    print("contacto")

def compra_tem_produto(compranumero, produtoid, unidades):
    print("compra_tem_produto")

def compra(numero, contribuinte, datacompra, pagamento, clienteemail, pontosgastos, pontosacumulados):
    print("Compra")

def servico(id, tipo, preco):
    print("servico")

def funcionario_faz_servico(funcionario_email, servico_id, duracao_media):
    print("funcionariofaz")

def compra_online(numero, rating, observacao, rastreamento, presente, contactoid):
    print("compra_online")

def compra_presencial(numero, funcemail):
    print("compra_presencial")

def marcacao(id, cliente_email, servico_id, funcionario_email, dataMarc):
    print("marcacao")


def choose(sheet, values):
    if sheet == "promocao":
        promocao(values[0], values[1], values[2], values[3], values[4])
    elif sheet == "produto_tem_promocao":
        produto_tem_promocao(values[0], values[1])
    elif sheet == "produto":
        produto(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9], values[10], values[11])
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
        utilizador(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8])
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













'''
cursor.execute('SELECT * FROM TestDB.dbo.Person')
 
for row in cursor:
    print(row)

# Do this instead
t = ('RHAT',)
c.execute('SELECT * FROM stocks WHERE symbol=?', t)
print c.fetchone()

# Larger example that inserts many records at a time
purchases = [('2006-03-28', 'BUY', 'IBM', 1000, 45.00),
             ('2006-04-05', 'BUY', 'MSFT', 1000, 72.00),
             ('2006-04-06', 'SELL', 'IBM', 500, 53.00),
            ]
c.executemany('INSERT INTO stocks VALUES (?,?,?,?,?)', purchases)

# Multiple values single statement/execution
c.execute('SELECT * FROM stocks WHERE symbol=? OR symbol=?', ('RHAT', 'MSO'))
print c.fetchall()
c.execute('SELECT * FROM stocks WHERE symbol IN (?, ?)', ('RHAT', 'MSO'))
print c.fetchall()
# This also works, though ones above are better as a habit as it's inline with syntax of executemany().. but your choice.
c.execute('SELECT * FROM stocks WHERE symbol=? OR symbol=?', 'RHAT', 'MSO')
print c.fetchall()
# Insert a single item
c.execute('INSERT INTO stocks VALUES (?,?,?,?,?)', ('2006-03-28', 'BUY', 'IBM', 1000, 45.00))
'''
