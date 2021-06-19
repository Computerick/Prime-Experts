****Settings ***
Documentation           Aqui estarão presentes todos os testes mobile do curso.

Library                 AppiumLibrary

Test Setup              Abrir o aplicativo           
Test Teardown           Fechar o aplicativo

*** Test Case ***
Cenário: Abrindo o youtube
    Dado que eu esteja na tela home
    E pesquisa um vídeo do robot
    Então será apresentando vídeos com robotframework

*** Keywords ***
Abrir o aplicativo
    Open Application                http://localhost:4723/wd/hub
    ...                             automationName=UiAutomator2
    ...                             platformName=Android
    ...                             deviceName=emulator-5554
    ...                             autoGrantPermissions=true
    ...                             appPackage=com.google.android.youtube
    ...                             appActivity=com.google.android.youtube.HomeActivity

Fechar o aplicativo
    Capture Page Screenshot
    Close Application

Dado que eu esteja na tela home
    Wait Until Element Is Visible   accessibility_id=YouTube
    
E pesquisa um vídeo do robot
    Click Element           accessibility_id=Pesquisar
    Input Text              id=com.google.android.youtube:id/search_edit_text       robotframework
    Press Keycode           66

Então será apresentando vídeos com robotframework
    Wait Until Element Is Visible           xpath=//android.view.ViewGroup[@content-desc="QArentena 66: Robot Framework, por Mayara R. Fernandes - 2 horas e 49 minutos - Ir ao canal - Iterasys - 3,5 mil visualizações - Transmitido há 6 meses - assistir o vídeo"]/android.widget.ImageView[1]