@echo off
setlocal
title Pizza Rush - iniciar jogo V32
cd /d "%~dp0"
where py >nul 2>&1
if not errorlevel 1 goto launch_py
where python >nul 2>&1
if not errorlevel 1 goto launch_python
echo Python nao encontrado. Abra index.html pelo Live Server do VS Code.
pause
exit /b 1
:launch_py
start "Pizza Rush servidor" /min py -u "%~dp0servidor.py"
goto finish
:launch_python
start "Pizza Rush servidor" /min python -u "%~dp0servidor.py"
:finish
echo Servidor local iniciado. Aguarde o navegador abrir.
echo Deixe a janela do servidor aberta enquanto jogar.
timeout /t 4 /nobreak >nul
exit /b 0
