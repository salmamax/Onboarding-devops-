#!/bin/bash

nombre_contenedor="mi_nginx"
log_file="/var/log/monitoreo_nginx.log"
fecha=$(date +%Y-%m-%d_%H:%M:%S)

# Verificar si el contenedor está en ejecución
if docker ps -q --filter "name=$nombre_contenedor" | grep -q .; then
  echo "[$fecha] El contenedor $nombre_contenedor está en ejecución." >> "$log_file"
else
  echo "[$fecha] El contenedor $nombre_contenedor NO está en ejecución. Intentando reiniciarlo..." >> "$log_file"
  docker start "$nombre_contenedor"
  if [[ $? -eq 0 ]]; then
    echo "[$fecha] El contenedor $nombre_contenedor ha sido reiniciado exitosamente." >> "$log_file"
  else
    echo "[$fecha] Error al intentar reiniciar el contenedor $nombre_contenedor." >> "$log_file"
  fi
fi

exit 0
