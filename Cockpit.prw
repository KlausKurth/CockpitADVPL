#include "protheus.ch"

/*
===============================================================================
CLASSE....: Cockpit
OBJETIVO..: Framework de layout OO (SEM @)
            Layout percentual configurado externamente
===============================================================================
*/

CLASS Cockpit

    // Containers
    DATA oMain
    DATA oHeader
    DATA oBody
    DATA aWins     // áreas criadas dinamicamente

    // Configuração
    DATA nHeaderPerc
    DATA aLinhas
    DATA aColunas
    DATA aColors
    DATA oFontHeader
    DATA oFontBody

    // Métodos
    METHOD New(cTitulo, nHeaderPerc, aLinhas, aColunas, aColors)
    METHOD BuildHeader(cTitulo)
    METHOD BuildBody()
    METHOD BuildWins()
    METHOD GetWin(nLinha, nCol)
    METHOD Activate()

ENDCLASS

/*----------------------------------------------------------------------------*/
METHOD New(cTitulo, nHeaderPerc, aLinhas, aColunas, aColors) CLASS Cockpit

    ::nHeaderPerc := nHeaderPerc
    ::aLinhas     := aLinhas
    ::aColunas    := aColunas
    ::aColors     := aColors
    ::aWins       := {}

    ::oFontHeader := TFont():New("Arial", 14, 700)
    ::oFontBody   := TFont():New("Arial", 10, 400)

    ::oMain := TDialog():New( ;
        0, 0, 100, 100, ;
        cTitulo, , , , , .T. )

    ::BuildHeader(cTitulo)
    ::BuildBody()
    ::BuildWins()

Return Self

/*----------------------------------------------------------------------------*/
METHOD BuildHeader(cTitulo) CLASS Cockpit

    ::oHeader := TPanel():New( ;
        0, 0, ;
        ::nHeaderPerc, 100, ;
        ::oMain )

    ::oHeader:SetColor(::aColors[2], ::aColors[1])

    TStatic():New( ;
        2, 2, ;
        cTitulo, ;
        ::oHeader, ;
        , ;
        ::oFontHeader )

Return

/*----------------------------------------------------------------------------*/
METHOD BuildBody() CLASS Cockpit

    ::oBody := TPanel():New( ;
        ::nHeaderPerc, 0, ;
        100, 100, ;
        ::oMain )

    ::oBody:SetColor(CLR_BLACK, ::aColors[3])

Return

/*----------------------------------------------------------------------------*/
METHOD BuildWins() CLASS Cockpit

    Local nTop := 0
    Local nLeft
    Local nH
    Local nW
    Local i, j

    For i := 1 To Len(::aLinhas)

        nH := ::aLinhas[i]

        nLeft := 0
        ::aWins[i] := {}

        For j := 1 To Len(::aColunas[i])

            nW := ::aColunas[i][j]

            AAdd(::aWins[i], ;
                TPanel():New( ;
                    ::nHeaderPerc + nTop, ;
                    nLeft, ;
                    ::nHeaderPerc + nTop + nH, ;
                    nLeft + nW, ;
                    ::oBody ))

            nLeft += nW
        Next

        nTop += nH
    Next

Return

/*----------------------------------------------------------------------------*/
METHOD GetWin(nLinha, nCol) CLASS Cockpit
Return ::aWins[nLinha][nCol]

/*----------------------------------------------------------------------------*/
METHOD Activate() CLASS Cockpit
    ::oMain:Activate()
Return
