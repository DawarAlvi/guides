@ECHO OFF

:: Config
SET SRC_NAME=Main.cpp
SET APP_NAME=App.exe
SET SRC_DIR=src
SET BUILD_DIR=bin
SET INTERMEDIATE_DIR=bin-int
SET INCLUDE_FLAG=/I include
::SET LIBPATH_FLAG=/LIBPATH:"path/to/lib" foo.lib bar.lib
SET CPP_VER=c++14

SET VCVARSALL_DIR="C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"

:: Setting up environment
IF NOT DEFINED VisualStudioVersion CALL %VCVARSALL_DIR% x86
IF NOT EXIST %SRC_DIR%\ (mkdir %SRC_DIR%)
SET SRC_EXISTS=0
IF EXIST %SRC_DIR%\%SRC_NAME% (SET SRC_EXISTS=1) else (copy /y NUL %SRC_DIR%\%SRC_NAME% >NUL )
IF NOT EXIST %INTERMEDIATE_DIR%\ (mkdir %INTERMEDIATE_DIR%)
IF NOT EXIST %BUILD_DIR%\ (mkdir %BUILD_DIR%)

IF %SRC_EXISTS%==1 (
    :: Build
    CALL cl %SRC_DIR%\%SRC_NAME% /Fe%BUILD_DIR%\%APP_NAME% /Fo%INTERMEDIATE_DIR%\ /std:%CPP_VER% /EHsc %INCLUDE_FLAG% /MD /link %LIBPATH_FLAG%
    :: Run
    IF %ERRORLEVEL% == 0 IF EXIST %BUILD_DIR%\%APP_NAME% (START "%APP_NAME%" %BUILD_DIR%\%APP_NAME%)
)

echo:
pause
