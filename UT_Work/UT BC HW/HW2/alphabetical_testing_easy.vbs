Sub alphabetical_testing_easy()

For Each ws In Worksheets

  Dim lRow As Long
  'Find the last non-blank cell in column A(1)
  lRow = ws.Cells(Rows.Count, 1).End(xlUp).Row

  ' Set an initial variable for holding the ticker
  Dim ticker As String

  ' Set an initial variable for holding the total per credit card brand
  Dim TSV As Double
  TSV = 0

  ' Keep track of the location for each credit card brand in the summary table
  Dim tracker As Integer
  tracker = 2

  ' Loop through all credit card purchases
  For i = 2 To lRow

    ' Check if we are still within the same ticker, if no...
    If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then

      ' Set the ticker
      ticker = ws.Cells(i, 1).Value

      ' Update total stock value
      TSV = TSV + ws.Cells(i, 7).Value

      ' Print the ticker
      ws.Range("I" & tracker).Value = ticker

      ' Print the total stock value
      ws.Range("J" & tracker).Value = TSV

      ' Add one to the tracker
      tracker = tracker + 1
      
      ' Reset the total stock value
      TSV = 0

    ' If the net ticker immediately following is the same...
    Else

      ' Add to the total stock value
      TSV = TSV + ws.Cells(i, 7).Value

    End If

  Next i

ws.Range("I1").Value = "Ticker"

ws.Range("J1").Value = "Total Stock Value"



Next ws

   ' Combine worksheets section


    Dim J As Integer
    On Error Resume Next

    ' Add a new worksheet

    Sheets(1).Select
    Worksheets.Add
    Sheets(1).Name = "Combined"

    ' Prep Sheet(1) for Combination: Select row A from sheet 2/Alabama and copy it to "Combined" sheet 
    Sheets(2).Activate
    Range("I1").EntireRow.Select
    Selection.Copy Destination:=Sheets(1).Range("A1")

    ' Create for loop to concatenat all worksheets
    For J = 2 To Sheets.Count
    Sheets(J).Activate
    Range("I1").Select
    Selection.CurrentRegion.Select

    ' Amend so that it doesn't contain the headers 
    Selection.Offset(1, 0).Resize(Selection.Rows.Count - 1).Select

    ' Create copy destination by seeking last row in excel, going up to the bottom of it which has position=1 and offsetting by 2; Offset 1--final row in Sheet(1)--and an additional 1--the first row in copied material from Sheet(2)'

    Selection.Copy Destination:=Sheets(1).Range("A65536").End(xlUp)(2)

    Next J

    Sheets(1).Range("A1").Value = "Ticker"
    Sheets(1).Range("B1").Value = "Total Stock Volume"
    Sheets(1).Range("C1,D1,E1,F1,G1").Value = " "

End Sub
