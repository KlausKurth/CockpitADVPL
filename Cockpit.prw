#include "protheus.ch"
#Include "windows.ch"

/*
===============================================================================
ARQUIVO.....: Cockpit.prw
OBJETIVO....: Classe base de layout (framework)
               - Janela principal
               - Header fixo
               - Body
               - Divisão em linhas e colunas (%)
               - Criação de telas via SetWin()
               - Centralização de cores e fontes
===============================================================================
*/


/*
===============================================================================
CONCEITOS:

DATA          :       variavéis que vão ser acessadas por Métodos dentro da propria classe Cockpit
METHOD        :       acesse um DATA da PRÓPRIA classe
oObj:Metodo() :       chama método do objeto
oObj:Data     :       acessa dado do objeto
::Data        :       acessa dado da própria classe
::Metodo()    :       chama método da própria classe


RESUMO CONCEITUAL:

Classe = estrutura
DATA   = memória do objeto
METHOD = comportamento do objeto
Objeto = classe + dados + ações

===============================================================================
*/

CLASS Cockpit

    // Janela principal    
    DATA oMain

    // Containers principais
    DATA oHeader
    DATA oBody

    // Configurações visuais
    DATA oFontHeader
    DATA oFontBody
    DATA aColors

    // Layout
    DATA aLinhas
    DATA aColunas
    DATA nHeaderPerc   // altura do header em %

    // Métodos públicos
    METHOD New(cTitulo)
    METHOD SetLinhas(aPerc)
    METHOD SetColunas(nLinha, aPerc)
    METHOD SetWin(cTitulo, nCol, nLinha)
    METHOD Activate()

ENDCLASS

/*
------------------------------------------------------------------------------
CONSTRUTOR
Cria janela, header e body
------------------------------------------------------------------------------
*/
METHOD New(cTitulo) CLASS Cockpit

    /*
    --------------------------------------------------------------------------
    DEFINIÇÕES VISUAIS CENTRALIZADAS
    --------------------------------------------------------------------------
    */

    /* 
    1 - fundo header
    2 - texto header
    3 - fundo body
    */
    ::aColors := { ;
        RGB(30,60,110), ;
        CLR_WHITE, ;
        RGB(245,245,245)
    }

    ::oFontHeader := TFont():New("Arial", 0, -18, .T.)
    ::oFontBody   := TFont():New("Arial", 0, -12)

    // Header ocupa 10% da tela
    ::nHeaderPerc := 10

    // Inicializa estruturas
    ::aLinhas  := {}
    ::aColunas := {}

    /*
    --------------------------------------------------------------------------
    JANELA PRINCIPAL
    OBS: tamanho TOTAL é responsabilidade EXCLUSIVA do Cockpit
    --------------------------------------------------------------------------
    */
    DEFINE WINDOW ::oMain ;
        TITLE "Cockpit Framework" ;
        FROM 0,0 TO 100,100 ;
        PIXEL

    /*
    --------------------------------------------------------------------------
    HEADER FIXO (10%)
    --------------------------------------------------------------------------
    */
    @ 0,0 TO ::nHeaderPerc,100 ;
        PANEL ::oHeader OF ::oMain ; /* PANEL É um container Tudo que você criar depois fica dentro dele GET, BUTTON, BROWSE, etc*/
        COLOR ::aColors[2], ::aColors[1]

    @ 3,2 SAY cTitulo ;
        OF ::oHeader ;
        FONT ::oFontHeader ;
        COLOR ::aColors[2]

    /*
    --------------------------------------------------------------------------
    BODY (90%)
    --------------------------------------------------------------------------
    */
    @ ::nHeaderPerc,0 TO 100,100 ;
        PANEL ::oBody OF ::oMain ;
        COLOR CLR_BLACK, ::aColors[3]

Return Self

/*
------------------------------------------------------------------------------
Define as LINHAS do body em porcentagem
Exemplo: {50,50}
------------------------------------------------------------------------------
*/
METHOD SetLinhas(aPerc) CLASS Cockpit
    ::aLinhas := aPerc
Return

/*
------------------------------------------------------------------------------
Define as COLUNAS de uma linha em porcentagem
Exemplo: linha 1 -> {85,15}
------------------------------------------------------------------------------
*/
METHOD SetColunas(nLinha, aPerc) CLASS Cockpit
    ::aColunas[nLinha] := aPerc
Return

/*
------------------------------------------------------------------------------
SetWin
Cria uma TELA (PANEL) baseada em LINHA e COLUNA
------------------------------------------------------------------------------
*/
METHOD SetWin(cTitulo, nCol, nLinha) CLASS Cockpit

    Local nTop := 0
    Local nLeft := 0
    Local nBottom := 0
    Local nRight := 0
    Local i

    /*
    --------------------------------------------------------------------------
    Área útil do BODY (sempre em %)
    --------------------------------------------------------------------------
    */
    Local nBodyH := 100 - ::nHeaderPerc
    Local nBodyW := 100

    /*
    --------------------------------------------------------------------------
    Calcula TOPO da linha
    --------------------------------------------------------------------------
    */
    For i := 1 To nLinha - 1
        nTop += ( nBodyH * ::aLinhas[i] ) / 100
    Next

    nBottom := nTop + ( nBodyH * ::aLinhas[nLinha] ) / 100

    /*
    --------------------------------------------------------------------------
    Calcula COLUNA
    --------------------------------------------------------------------------
    */
    For i := 1 To nCol - 1
        nLeft += ( nBodyW * ::aColunas[nLinha][i] ) / 100
    Next

    nRight := nLeft + ( nBodyW * ::aColunas[nLinha][nCol] ) / 100

    /*
    --------------------------------------------------------------------------
    Cria a TELA (PANEL)
    --------------------------------------------------------------------------
    */
    Local oWin
    @ nTop, nLeft TO nBottom, nRight ;
        PANEL oWin OF ::oBody ;
        BORDER ;
        FONT ::oFontBody ;
        CAPTION cTitulo

Return oWin

/*
------------------------------------------------------------------------------
Ativa a janela
------------------------------------------------------------------------------
*/
METHOD Activate() CLASS Cockpit
    ::oMain:Activate()
Return
