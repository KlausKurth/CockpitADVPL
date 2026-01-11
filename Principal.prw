User Function Principal()

    LOCAL oCockpit
    LOCAL oA, oB, oC

    oCockpit := Cockpit():New( ;
        "Cockpit ADVPL Funcional", ;
        10, ;
        {50, 50}, ;
        { {70, 30}, {100} } )

    oA := oCockpit:GetWin(1,1)
    oB := oCockpit:GetWin(1,2)
    oC := oCockpit:GetWin(2,1)

    TStatic():New(10, 10, "Tela A", oA)
    TStatic():New(10, 10, "Tela B", oB)
    TStatic():New(10, 10, "Tela C", oC)


    oCockpit:Activate()

RETURN
