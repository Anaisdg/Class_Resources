Sub WellsFargo_PtI()

    'Go through each worksheet in workbook'
    For Each ws In Worksheets

        Dim name As String
        
        'QUESTION: why wont the code work if I: Dim state as array'
        'Get the name of each worksheet'

        name = ws.name

        'MsgBox(name)
        'Get the state of each worksheet'

        state = Split(name, "_")

        'Test to see if split was successful'
        'MsgBox state(0)

        'Test to place somewhere whithin worksheet'
        'ws.Range("L1") = state(0)

        ws.Range("A1").EntireColumn.Insert

        'input years'

    	yr1=split(ws.Range("C1"), " ")
    	yr2=split(ws.Range("D1"), " ")
    	yr3=split(ws.Range("E1"), " ")
    	yr4=split(ws.Range("F1"), " ")
    	yr5=split(ws.Range("G1"), " ")

    	ws.Range("C1")=yr1(3)
    	ws.Range("D1")=yr2(3)
    	ws.Range("E1")=yr3(3)
    	ws.Range("F1")=yr4(3)
    	ws.Range("G1")=yr5(3)

        'find last row'
        Dim lRow as Long
        lRow=Cells(Rows.Count,2).End(xlup).Row
        'test'
        MsgBox(lRow)

        'fill Col A with correct state'

        For i = 1 to lRow
        ws.Cells(i,1)=state(0)
        Next i

        '********** HELP PLEASE SEE MSGBOX ************'

    Next ws


    'Combine worksheets'


    Dim J As Integer
    On Error Resume Next

    'add a new worksheet'

    Sheets(1).Select
    Worksheets.Add
    Sheets(1).Name = "Combined"

    'Prep Sheet(1) for Combination: Select row A from sheet 2/Alabama and copy it to "Combined" sheet'
    Sheets(2).Activate
    Range("A1").EntireRow.Select
    Selection.Copy Destination:=Sheets(1).Range("A1")

    'Create for loop to concatenat all worksheets'
    For J = 2 To Sheets.Count
    Sheets(J).Activate
    Range("A1").Select
    Selection.CurrentRegion.Select

    'amend so that it doesn't contain the headers'
    Selection.Offset(1, 0).Resize(Selection.Rows.Count - 1).Select

    'Create copy destination by seeking last row in excel, going up to the bottom of it which has...'
    '...position=1 and offsetting by 2; Offset 1--final row in Sheet(1)--and an ...'
    '...additional 1--the first row in copied material from Sheet(2)'
    Selection.Copy Destination:=Sheets(1).Range("A65536").End(xlUp)(2)

    Next J

End Sub

