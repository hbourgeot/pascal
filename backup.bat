@echo off

REM Configuración de variables principales
SET PG_DUMPALL="C:\Program Files\PostgreSQL\16\bin\pg_dumpall.exe"
SET PG_DUMP="C:\Program Files\PostgreSQL\16\bin\pg_dump.exe"
SET PG_HOST=localhost
SET PG_PORT=5432
SET PG_USER=postgres
SET PG_DATABASE=pascal
SET PG_PATH=C:\Users\G-FIVE\Documents\RESPALDO

REM Obtener la fecha y hora en formato YYYYMMDD-HHMMSS
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value | findstr ="') do set FECHAHORA=%%i
set FECHAHORA=%FECHAHORA:~0,8%-%FECHAHORA:~8,6%

REM Definir el nombre de los archivos de respaldo

REM Información de los usuarios
SET GLOBALS_FILENAME=%PG_PATH%\globals-%FECHAHORA%.sql

REM Información de la base de datos
SET DATABASE_FILENAME=%PG_PATH%\%PG_DATABASE%-%FECHAHORA%.sql

REM Crear el directorio de salida si no existe
if not exist "%PG_PATH%" mkdir "%PG_PATH%"

REM Respaldo de configuraciones globales (roles y privilegios)
%PG_DUMPALL% -h %PG_HOST% -p %PG_PORT% -U %PG_USER% --globals-only --file=%GLOBALS_FILENAME%

REM Respaldo de la base de datos con sentencias INSERT
%PG_DUMP% -h %PG_HOST% -p %PG_PORT% -U %PG_USER% --inserts --file=%DATABASE_FILENAME% %PG_DATABASE%

echo Respaldo completado:
echo - Configuraciones globales: %GLOBALS_FILENAME%
echo - Base de datos: %DATABASE_FILENAME%
