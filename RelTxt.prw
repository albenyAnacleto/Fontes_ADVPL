#INCLUDE 'protheus.ch'

user function RelTxt() //fun��o inicial

if MsgYesNo("Esta fun��o Gera Arquivo em TXT")
    GerArq()
else
MsgAlert("Cancelada pelo Usu�rio")        
endif 

return NIL

Static Function GerArq() //fun��o que gera arquivo txt

Local cDir := "C:\TOTVS12133\Relatorios\txt\"
Local cArq := "Arquivo1.txt"
Local nHandle := FCreate(cDir + cArq)
Local nlinha := 0

    if nHandle < 0
        MsgAlert("erro ao criar arquivo", "error")    
    else        
        for nlinha := 1 TO 200 step 1
        FWrite(nHandle,"Gravando a linha " + StrZero (nlinha,3)+ CRLF)
        NEXT nlinha
        FClose(nHandle)
    endif

    IF FILE("C:\TOTVS12133\Relatorios\txt\Arquivo1.txt")   
        MsgInfo("Arquivo criado com sucesso!")
    else
        MsgAlert("N�o foi poss�vel encontrar o arquivo", "Alerta")
    ENDIF
        
return
