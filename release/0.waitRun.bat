@echo off

SET EXPLORER="explorer.exe"

SET WAIT_TIME=10
REM SET WAIT_TIME=3 REM test

REM ECHO "bat dir path: " %~dp0
CD /d %~dp0
REM DIR

TIMEOUT /t %WAIT_TIME% /nobreak > NUL

FOR %%F in (*) do (
  REM ECHO %%F
  ECHO %%F | FINDSTR "wait_start.*\.lnk" > NUL
  IF NOT ERRORLEVEL 1 (
    REM ECHO "run %%F"
    start "%EXPLORER%" "%%F"
  ) ELSE (
    REM ECHO "not run %%F"
  )
)

PAUSE
