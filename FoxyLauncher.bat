@ECHO OFF
IF "%1" == "" (
    >NUL REG ADD HKCU\Console\GameEngine /v FaceName /t reg_sz /d "Lucida Console" /f
    START "GameEngine" "%~0" 1
    EXIT
) else ( >NUL REG DELETE HKCU\Console\GameEngine /f )

FoxSimulator.exe
EXIT
@ECHO ON