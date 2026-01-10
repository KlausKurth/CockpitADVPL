#include "protheus.ch"

/*
===============================================================================
ARQUIVO.....: Principal.prw
OBJETIVO....: Criar telas utilizando a classe Cockpit
===============================================================================
*/

/*

Linha e coluna SÓ DEFINEM UMA ÁREA 
Quem cria a tela é o SetWin()


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
    oCockpit := Cockpit():New("Cockpit de Estudos ADVPL") /*objeto real na memória, baseado no molde Cockpit*/

    /*
    --------------------------------------------------------------------------
    Define layout (SOMENTE percentuais)
    --------------------------------------------------------------------------
    */
    oCockpit:SetLinhas({50,50}) /*passa um argumento em array com valor de [50.50]*/
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
