import os
import pandas as pd

# Carpeta donde están los archivos .xlsx
base_dir = os.path.dirname(os.path.abspath(__file__))
carpeta = os.path.join(base_dir, '../import')

for archivo in os.listdir(carpeta):
    if archivo.endswith('.xlsx'):
        ruta_xlsx = os.path.join(carpeta, archivo)
        nombre_csv = archivo.replace('.xlsx', '.csv')
        ruta_csv = os.path.join(carpeta, nombre_csv)
        
        # Leer el archivo xlsx
        df = pd.read_excel(ruta_xlsx)
        # Guardar como csv
        df.to_csv(ruta_csv, index=False)
        print(f'Convertido: {archivo} -> {nombre_csv}')