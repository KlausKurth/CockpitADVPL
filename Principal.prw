#include "protheus.ch"

/*
===============================================================================
ARQUIVO.....: Principal.prw
OBJETIVO....: Define layout e injeta conteúdo
===============================================================================
*/

User Function Principal()

    Local oCockpit
    Local oTelaA
    Local oTelaB
    Local oTelaC

    /*
    --------------------------------------------------------------------------
    Define layout AQUI (flexível)
    --------------------------------------------------------------------------
    */
    oCockpit := Cockpit():New( ;
        "Cockpit de Estudos ADVPL", ;
        10, ;                 // header %
        {50,50}, ;            // linhas
        { {85,15}, {100} }, ; // colunas por linha
        { CLR_HBLUE, CLR_WHITE, CLR_GRAY } )

    /*
    --------------------------------------------------------------------------
    Recupera áreas
    --------------------------------------------------------------------------
    */
    oTelaA := oCockpit:GetWin(1,1)
    oTelaB := oCockpit:GetWin(1,2)
    oTelaC := oCockpit:GetWin(2,1)

    /*
    --------------------------------------------------------------------------
    Conteúdo
    --------------------------------------------------------------------------
    */
    TelaParametros(oTelaA)
    TelaBotoes(oTelaB, oTelaC)
    TelaResultado(oTelaC)

    oCockpit:Activate()

Return
