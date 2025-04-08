#!/bin/bash

# Define el directorio a limpiar
directorio="/tmp"

# Define la antigüedad en días
antiguedad=7

# Encuentra y elimina los archivos con la antigüedad especificada
find "$directorio" -type f -mtime +"$antiguedad" -delete

# Registra la acción en un archivo de logs
fecha=$(date +%Y-%m-%d_%H:%M:%S)
echo "[$fecha] Se eliminaron archivos temporales con más de $antiguedad días en $directorio." >> /var/log/limpieza_tmp.log

exit 0
