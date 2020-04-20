@echo off

SET EXPLORER="explorer.exe"

REM ECHO "bat dir path: " %~dp0
CD /d %~dp0
REM DIR

FOR %%F in (*) do (
  ECHO %%F
  ECHO %%F | FIND ".lnk" > NUL
  IF NOT ERRORLEVEL 1 (
    ECHO %%F | FINDSTR "no_run.*\.lnk" > NUL
    IF NOT ERRORLEVEL 1 (
      REM ECHO "not run %%F"
    ) ELSE (
      ECHO %%F | FINDSTR "wait_start.*\.lnk" > NUL
      IF NOT ERRORLEVEL 1 (
        REM ECHO "not run %%F"
      ) ELSE (
        REM ECHO "run %%F"
        start "%EXPLORER%" "%%F"
      )
    )
  ) ELSE (
    REM ECHO "not run %%F"
  )
)

call 0.waitRun.bat

PAUSE
