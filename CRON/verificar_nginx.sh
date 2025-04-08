#!/bin/bash

# Nombre del servicio a verificar
servicio="nginx"

# Verificar si el servicio está activo
if ! systemctl is-active --quiet "$servicio"; then
  echo "El servicio $servicio no está activo. Intentando reiniciar..."
  sudo systemctl restart "$servicio"
  if [[ $? -eq 0 ]]; then
    echo "Servicio $servicio reiniciado exitosamente."
    fecha_log=$(date +%Y-%m-%d_%H:%M:%S)
    echo "[$fecha_log] El servicio $servicio fue reiniciado por el script." >> /var/log/reinicio_nginx.log
  else
    echo "Error al reiniciar el servicio $servicio."
    fecha_log=$(date +%Y-%m-%d_%H:%M:%S)
    echo "[$fecha_log] Error al intentar reiniciar el servicio $servicio." >> /var/log/reinicio_nginx.log
  fi
else
  echo "El servicio $servicio está activo."
fi

exit 0
