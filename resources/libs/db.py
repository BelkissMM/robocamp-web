import psycopg2 # método em python para apagar produto no bd

def remove_product_by_name(name):
#  def para criar um método
#  uso _ snakecase, pq é padrão do python

    query = "delete from public.products where title = '{}';".format(name)

    conn = psycopg2.connect(
        host='pgdb',
        database='ninjapixel',
        user='postgres',
        password='qaninja'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()
# cursor faz todo execução sql, abre uma fase de execução que não vai aplicar até qndo terminar de executar

def outro_metodo():
    print('teste')

#remove_product_by_name('Donkey Kong')
#invoca esse método para executar, ele por si só não é auto executável. Só para teste.

# #classe que vai rodar um método
# class Database():
#     def execute(query)

#     uma biblioteca em python que conecta com o banco 'psycopg2'
#     instalar biblioteca 'pip install psycopg2'
#     https://pypi.org/project/psycopg2/