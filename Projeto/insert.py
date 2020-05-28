import pyodbc
import xlrd 

loc = ("./dados.xlsx") 

# Abrir Workbook
wb = xlrd.open_workbook(loc) 


# Percorrer as sheets todas
pointSheets = wb.sheet_names()
counter=0
for sheet in pointSheets:
    print(sheet)
    sheet = wb.sheet_by_index(counter)
    for row in range(1,sheet.nrows):
        for column in range(0, sheet.ncols):
            print(sheet.cell_value(row, column))
    counter+=1

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
