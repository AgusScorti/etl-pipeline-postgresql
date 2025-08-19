import os  # Importa el módulo para interactuar con el sistema de archivos
import pandas as pd  # Importa pandas para manipulación de datos
import csv  # Importa csv para detección automática de delimitadores

# Obtiene la ruta absoluta de la carpeta donde está este script
base_dir = os.path.dirname(os.path.abspath(__file__))

# Construye la ruta a la carpeta 'import' (donde están los archivos csv)
carpeta = os.path.join(base_dir, '../import')

# Construye la ruta a la carpeta de salida 'output' (donde se guardarán los csv normalizados)
carpeta_salida = os.path.join(base_dir, '../import/output')

# Crea la carpeta de salida si no existe
os.makedirs(carpeta_salida, exist_ok=True)

# Itera sobre todos los archivos en la carpeta de entrada
for archivo in os.listdir(carpeta):
    # Procesa solo los archivos que terminan en .csv
    if archivo.endswith('.csv'):
        # Ruta completa del archivo de entrada
        ruta_csv = os.path.join(carpeta, archivo)
        # Ruta completa del archivo de salida
        ruta_salida_csv = os.path.join(carpeta_salida, archivo)
        # Abre el archivo para detectar el delimitador automáticamente
        with open(ruta_csv, 'r', encoding='utf-8') as f:
            dialect = csv.Sniffer().sniff(f.read(2048))  # Detecta el delimitador usando una muestra del archivo
            f.seek(0)  # Vuelve al inicio del archivo
            sep = dialect.delimiter  # Guarda el delimitador detectado
        # Lee el archivo CSV usando el delimitador detectado
        df = pd.read_csv(ruta_csv, sep=sep)
        # Guarda el DataFrame como CSV usando ; como nuevo delimitador
        df.to_csv(ruta_salida_csv, sep=';', index=False)
        # Imprime mensaje indicando que el archivo fue normalizado y muestra el delimitador original
        print(f'Normalizado: {archivo} (delimitador original: "{sep}")')