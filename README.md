# TP Integrador - Computación Aplicada
## Universidad de Palermo

## Integrantes
- Nehuen Mesias
- Lucas Ivan Martino
- Luna Mahfouz
- Pablo Matias Aguilera
- Tobias Alvarez Colodrero

## Descripción
Trabajo Práctico Integrador de la materia Computación Aplicada. 
Configuración y administración de un servidor GNU/Linux Debian 12.

## Contenido del repositorio

- `root.tar.gz` — Directorio /root con archivos de configuración y material adicional
- `etc.tar.gz` — Directorio /etc con configuraciones del sistema (red, SSH, Apache, crontab)
- `opt.tar.gz` — Directorio /opt con el script de backup (backup_full.sh) y archivo de particiones
- `www_dir.tar.gz` — Directorio /www_dir con index.php y logo.png servidos por Apache
- `backup_dir.tar.gz` — Directorio /backup_dir con los backups generados
- `var_part_aa` / `var_part_ab` — Directorio /var spliteado en partes de 50MB

## Configuración implementada

### 1. Entorno
- Hostname configurado como TPServer
- Contraseña de root cambiada a "palermo"

### 2. Servicios
- **SO:** Actualizado de Debian 11 (Bullseye) a Debian 12 (Bookworm)
- **SSH:** Instalado y configurado con autenticación por clave pública/privada
- **Apache + PHP:** Servidor web sirviendo index.php y logo.png desde /www_dir
- **MariaDB:** Instalada y cargada con base de datos "ingenieria" desde db.sql

### 3. Red
- Interfaz enp0s3 configurada con IP estática 192.168.1.50
- Máscara de red: 255.255.255.0
- Gateway: 192.168.1.1

### 4. Almacenamiento
- Disco adicional de 10GB agregado a la VM
- Partición /dev/sdb1 (3GB) montada en /www_dir
- Partición /dev/sdb2 (6GB) montada en /backup_dir
- Ambas particiones configuradas en /etc/fstab para montaje automático
- Contenido de /proc/partitions guardado en /opt/particion

### 5. Backup
- Script backup_full.sh ubicado en /opt/scripts
- Acepta argumentos de origen y destino
- Incluye opción -help
- Valida disponibilidad de origen y destino antes de ejecutar
- Crontab configurado:
  - Todos los días a las 00:00 → backup de /var/log
  - Lunes, Miércoles y Viernes a las 23:00 → backup de /www_dir
