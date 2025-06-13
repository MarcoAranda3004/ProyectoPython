
import mysql.connector

# Conexión a la base de datos
conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='mierda123',
    database='gastronomia_peru'
)

cursor = conn.cursor()

# Consulta de platos según región
region = input("¿De qué región quieres ver platos? (Costa, Sierra o Selva): ")

query = '''
SELECT p.nombre, p.descripcion 
FROM platos_tipicos p
JOIN regiones r ON p.region_id = r.id
WHERE r.nombre = %s
'''

cursor.execute(query, (region,))
resultados = cursor.fetchall()

if resultados:
    print(f"Platos típicos de la región {region}:")
    for nombre, descripcion in resultados:
        print(f"🍽️ {nombre}: {descripcion}")
else:
    print(f"No se encontraron platos para la región: {region}")

cursor.close()
conn.close()
