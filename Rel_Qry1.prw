#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

//função inicial
User Function Rel_Qry1() 

if MsgYesNo("Esta função Gera Arquivo em TXT")
    
    Processa({||MntQry() },,"Processando...")
    MsAguarde({|| GerArq()},,"O arquivo TXT esta sendo gerado...")
else
    MsgAlert("Operação Cancelada pelo Usuário")        
endif 

return Nil

// função p/ montar query
Static Function MntQry() 

Local cQuery := ""

cQuery := " SELECT B1_FILIAL AS FILIAL, B1_COD AS CODIGO, "
cQuery += " B1_DESC AS DESCRICAO "
cQuery += " FROM SB1990 WHERE D_E_L_E_T_ = ''"

cQuery := ChangeQuery(cQuery)
DBUseArea(.T.,"TOPCONN", TCGenQry(,,cQuery), 'TMP',.F.,.T.)

return NIL

//função que gera arquivo txt
Static Function GerArq() 

Local cDir := "C:\TOTVS12133\Relatorios\txt\"
Local cArq := "Relatorio2.txt"
Local nHandle := FCreate(cDir + cArq)

    if nHandle < 0
        MsgAlert("Erro ao criar arquivo", "ERROR")    
    else        
        while TMP->(!EOF())
            FWrite(nHandle, TMP->(FILIAL)+ " | " + TMP->(CODIGO)+ " | " + TMP->(DESCRICAO) + CRLF)
            TMP->(dbSkip() )
        enddo
        FClose(nHandle)
    endif

    IF FILE("C:\TOTVS12133\Relatorios\txt\Relatorio2.txt")   
        MsgInfo("Arquivo criado com sucesso!")
    else
        MsgAlert("Não foi possível encontrar o arquivo", "Alerta")
    ENDIF
        
return
