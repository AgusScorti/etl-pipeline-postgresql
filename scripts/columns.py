import os
import pandas as pd
import csv

base_dir = os.path.dirname(os.path.abspath(__file__))
carpeta = os.path.join(base_dir, '../import/output')
salida_txt = os.path.join(base_dir, 'columnas.txt')

with open(salida_txt, 'w', encoding='utf-8') as archivo_salida:
    for archivo in os.listdir(carpeta):
        if archivo.endswith('.csv'):
            ruta_csv = os.path.join(carpeta, archivo)
            with open(ruta_csv, 'r', encoding='utf-8') as f:
                primera_linea = f.readline().replace(';', '\n').strip()
                archivo_salida.write(f'Columnas de {archivo}:\n{primera_linea}\n\n')