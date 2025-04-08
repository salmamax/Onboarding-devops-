#!/bin/bash

# Directorio a respaldar
directorio_a_respaldar="/home/salva/Documentos/Onboarding-devops-/CRON/"

# Directorio donde guardar los backups
directorio_backup="/home/salva/backups/"

# Asegurarse de que el directorio de backup exista
mkdir -p "$directorio_backup"

# Nombre base del archivo de backup
nombre_base="backup_cron_dir"

# Fecha para el nombre del archivo
fecha=$(date +%Y-%m-%d_%H:%M:%S)

# Nombre completo del archivo de backup
nombre_archivo="$directorio_backup/$nombre_base-$fecha.tar.gz"

# Realizar el backup y comprimir
tar -czvf "$nombre_archivo" "$directorio_a_respaldar"

# Registrar la acción en un archivo de logs
fecha_log=$(date +%Y-%m-%d_%H:%M:%S)
echo "[$fecha_log] Se creó un backup de $directorio_a_respaldar en $nombre_archivo." >> /var/log/backup_cron.log

exit 0
