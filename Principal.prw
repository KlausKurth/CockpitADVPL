#include "protheus.ch"

/*
===============================================================================
ARQUIVO.....: Principal.prw
OBJETIVO....: Criar telas utilizando a classe Cockpit
===============================================================================
*/

User Function Principal()

    Local oCockpit
    Local oTelaA
    Local oTelaB
    Local oTelaC

    /*
    --------------------------------------------------------------------------
    Instancia o Cockpit
    --------------------------------------------------------------------------
    */
    oCockpit := Cockpit():New("Cockpit de Estudos ADVPL")

    /*
    --------------------------------------------------------------------------
    Define layout (SOMENTE percentuais)
    --------------------------------------------------------------------------
    */
    oCockpit:SetLinhas({50,50})
    oCockpit:SetColunas(1, {85,15})
    oCockpit:SetColunas(2, {100})

    /*
    --------------------------------------------------------------------------
    Cria as TELAS usando SetWin
    --------------------------------------------------------------------------
    */
    oTelaA := oCockpit:SetWin("Parâmetros", 1, 1)
    oTelaB := oCockpit:SetWin("Botões",     2, 1)
    oTelaC := oCockpit:SetWin("Resultado",  1, 2)

    /*
    --------------------------------------------------------------------------
    Injeta conteúdo
    --------------------------------------------------------------------------
    */
    TelaParametros(oTelaA)
    TelaBotoes(oTelaB, oTelaC)
    TelaGrid(oTelaC)

    /*
    --------------------------------------------------------------------------
    Ativa tela
    --------------------------------------------------------------------------
    */
    oCockpit:Activate()

Return
