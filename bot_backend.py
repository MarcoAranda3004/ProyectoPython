from flask import Flask, request, jsonify, send_from_directory
import mysql.connector

app = Flask(__name__)

# Ruta para servir el HTML
@app.route("/")
def home():
    return send_from_directory("", "index.html")

# Función para obtener platos por región desde MySQL
def get_platos_por_region(region):
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='mierda123',
        database='gastronomia_peru'
    )
    cursor = conn.cursor()
    query = '''
    SELECT p.nombre, p.descripcion 
    FROM platos_tipicos p
    JOIN regiones r ON p.region_id = r.id
    WHERE r.nombre = %s
    '''
    cursor.execute(query, (region,))
    resultados = cursor.fetchall()
    cursor.close()
    conn.close()
    return resultados

# Ruta del chatbot
@app.route("/chat", methods=["POST"])
def chat():
    user_msg = request.json.get("message", "").capitalize()
    platos = get_platos_por_region(user_msg)
    if platos:
        response = [f"{nombre}: {desc}" for nombre, desc in platos]
    else:
        response = [f"No encontré platos para la región: {user_msg}"]
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)
