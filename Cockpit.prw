#include "protheus.ch"

CLASS Cockpit

    DATA oMain
    DATA oHeader
    DATA oBody
    DATA aWins

    DATA nHeaderPerc
    DATA aLinhas
    DATA aColunas

    METHOD New(cTitulo, nHeaderPerc, aLinhas, aColunas)
    METHOD BuildHeader(cTitulo)
    METHOD BuildBody()
    METHOD BuildWins()
    METHOD GetWin(nLinha, nCol)
    METHOD Activate()

ENDCLASS

/*----------------------------------------------------------------------------*/
METHOD New(cTitulo, nHeaderPerc, aLinhas, aColunas) CLASS Cockpit

    ::nHeaderPerc := nHeaderPerc
    ::aLinhas     := aLinhas
    ::aColunas    := aColunas
    ::aWins       := {}

    ::oMain := TDialog():New(0, 0, 600, 1000, cTitulo)

    ::BuildHeader(cTitulo)
    ::BuildBody()
    ::BuildWins()

RETURN Self

/*----------------------------------------------------------------------------*/
METHOD BuildHeader(cTitulo) CLASS Cockpit

    LOCAL nHeaderH := (::oMain:nClientHeight * ::nHeaderPerc) / 100

    ::oHeader := TPanel():New( ;
        0, ;                         // top
        "", ;                        // <<< TÍTULO (OBRIGATÓRIO)
        0, ;                         // left
        nHeaderH, ;                  // bottom
        ::oMain:nClientWidth, ;      // right
        ::oMain, ;                   // parent
        .T. )

    TStatic():New( ;
        10, ;
        10, ;
        cTitulo, ;
        ::oHeader )

RETURN







/*----------------------------------------------------------------------------*/
METHOD BuildBody() CLASS Cockpit

    LOCAL nHeaderH := (::oMain:nClientHeight * ::nHeaderPerc) / 100

    ::oBody := TPanel():New( ;
        nHeaderH, ;
        "", ;                        // <<< TÍTULO
        0, ;
        ::oMain:nClientHeight, ;
        ::oMain:nClientWidth, ;
        ::oMain, ;
        .T. )

RETURN




/*----------------------------------------------------------------------------*/
METHOD BuildWins() CLASS Cockpit

    LOCAL i, j
    LOCAL nTop := 0
    LOCAL nLeft
    LOCAL nH, nW

    FOR i := 1 TO Len(::aLinhas)

        nH := (::oBody:nClientHeight * ::aLinhas[i]) / 100
        nLeft := 0

        AAdd(::aWins, {})

        FOR j := 1 TO Len(::aColunas[i])

            nW := (::oBody:nClientWidth * ::aColunas[i][j]) / 100

            AAdd(::aWins[i], ;
                TPanel():New( ;
                    nTop, ;
                    "", ;            // <<< TÍTULO
                    nLeft, ;
                    nTop + nH, ;
                    nLeft + nW, ;
                    ::oBody, ;
                    .T. ) )

            nLeft += nW
        NEXT

        nTop += nH
    NEXT

RETURN




/*----------------------------------------------------------------------------*/
METHOD GetWin(nLinha, nCol) CLASS Cockpit
RETURN ::aWins[nLinha][nCol]

/*----------------------------------------------------------------------------*/
METHOD Activate() CLASS Cockpit
    ::oMain:Activate()
RETURN
