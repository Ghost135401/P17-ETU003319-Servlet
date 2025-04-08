@echo off
setlocal enabledelayedexpansion

:: Vérifier si le dossier "build" existe et le supprimer
echo Vérification du dossier "build"...
if exist build (
    echo Dossier "build" trouvé, suppression...
    rmdir /S /Q build
    if errorlevel 1 (
        echo Erreur dans la suppression du dossier "build".
        exit /b 1
    ) else (
        powershell -Command "Write-Host 'Dossier ''build'' supprimé avec succès.' -ForegroundColor Green"
    )
)

:: Créer le dossier "build"
echo Mise a jour du dossier "build"...
mkdir build
if errorlevel 1 (
    echo Erreur dans la creation du dossier "build".
    exit /b 1
) else (
    powershell -Command "Write-Host 'Dossier ''build'' cree avec succes.' -ForegroundColor Green"
)
echo Compilation des fichiers Java...

:: Compilation des fichiers Java

javac --release 17 -d src\webapp\WEB-INF\classes -sourcepath src\main\java\model -cp lib\mysql-connector-j-9.1.0.jar src\main\java\model\*.java

javac --release 17 -d src\webapp\WEB-INF\classes -sourcepath src\main\java\UtilDB -cp "lib\mysql-connector-j-9.1.0.jar;src\webapp\WEB-INF\classes" src\main\java\UtilDB\DAOaccess.java

javac --release 17 -d src\webapp\WEB-INF\classes -sourcepath src\main\java\dao -cp "lib\mysql-connector-j-9.1.0.jar;src\webapp\WEB-INF\classes" src\main\java\dao\*.java

javac --release 17 -d src\webapp\WEB-INF\classes -sourcepath src\main\java\controller -cp "lib\servlet-api.jar;lib\mysql-connector-j-9.1.0.jar;src\webapp\WEB-INF\classes" src\main\java\controller\*.java

if errorlevel 1 (
    echo Erreur dans la compilation des fichiers Java.
    exit /b 1
) else (
    powershell -Command "Write-Host 'Compilation des fichiers Java reussie.' -ForegroundColor Green"
)


:: Copier les fichiers web dans le dossier "build"
echo Copie des fichiers web dans "build"...
xcopy src\webapp\* build /E /I /Y
if errorlevel 1 (
    echo Erreur dans la copie des fichiers web.
    exit /b 1
) else (
    powershell -Command "Write-Host 'Fichiers web copiés dans ''build'' avec succes.' -ForegroundColor Green"
)


:: Création du fichier WAR
echo Création du fichier WAR "ETU003319.war"...
jar -cvf ETU003319.war -C build .
if errorlevel 1 (
    echo Erreur dans la création du fichier WAR.
    exit /b 1
) else (
    powershell -Command "Write-Host 'Fichier WAR ''ETU003319.war'' cree avec succes.' -ForegroundColor Green"
)

:: Supprimer les classes compilées
echo Mise a jour des fichiers classes...
rmdir /S /Q src\webapp\WEB-INF\classes
if errorlevel 1 (
    echo Erreur dans la suppression des fichiers classes.
    exit /b 1
) else (
    powershell -Command "Write-Host 'Fichiers classes mise a jour avec succes.' -ForegroundColor Green"
)

:: Copier le fichier WAR dans Tomcat
echo Copie de "ETU003319.war" dans le répertoire webapps de Tomcat...
xcopy ETU003319.war C:\apache-tomcat-10.1.28\webapps /Y
if errorlevel 1 (
    echo Erreur dans la copie du fichier WAR dans Tomcat.
    exit /b 1
) else (
    powershell -Command "Write-Host 'Fichier ''ETU003319.war'' copie dans Tomcat avec succes.' -ForegroundColor Green"
)

:: Supprimer le fichier WAR local
echo Suppression du fichier "ETU003319.war"...
del ETU003319.war
if errorlevel 1 (
    echo Erreur dans la suppression du fichier WAR.
    exit /b 1
) else (
    powershell -Command "Write-Host 'Fichier ''ETU003319.war'' mis a jour avec succès.' -ForegroundColor Green"
)

:: Message final de succès
echo.
powershell -Command "Write-Host 'Build success!' -ForegroundColor Green"

echo Demmarrage tomcat...
C:\apache-tomcat-10.1.28\bin\startup.bat
:: Fin du script
endlocal
