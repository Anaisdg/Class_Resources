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
  
  ' Set an initial variable for end value
  Dim closeend As Long

   ' Set an initial variable for start value
  Dim openstart As Long

  Dim  yrchange As Long

  
  ' Loop through all credit card purchases
  For i = 2 To lRow

    ' Check if we are still within the same ticker, if no...
    If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then

      ' Close out work for current ticker

      ' Set the ticker
      ticker = ws.Cells(i, 1).Value
      
      ' Set the end value
      closeend = ws.Cells(i, 6).Value

      ' Update total stock value
      TSV = TSV + ws.Cells(i, 7).Value

      ' Print the ticker
      ws.Range("I" & tracker).Value = ticker

      ' Print the total stock value
      ws.Range("J" & tracker).Value = TSV

      ' Print the end value for ticker
      ws.Range("K" & tracker).Value = closeend


      ' Start up work for next ticker
       
      ' Add one to the tracker

      tracker = tracker + 1
      ' Reset the total stock value

      TSV = 0
      openstart = ws.Cells(i + 1, 3).Value

      ' Print the open value for ticker'
      ws.Range("L" & tracker).Value = openstart

      'Calculate Yearly Change'

      yrchange=openstart-closeend

      'Print Yearly Change'

      ws.Range("M" & tracker).Value= yrchange



    ' If the cell immediately following a row is the same brand...
    Else
    
      ' Add to the total stock value
      TSV = TSV + ws.Cells(i, 7).Value


      End If



  Next i



' Add the headers'

ws.Range("I1").Value = "Ticker"

ws.Range("J1").Value = "Total Stock Value"

ws.Range("K1").Value = "Close End Value"

ws.Range("L1").Value = "Open Start Value"

ws.Range("M1").Value = "Yearly Cahnge"

' Hard set the first '

ws.Range("L2").Value= ws.Range("C2").Value-ws.Range("K1").Value



Next ws


End Sub


For i = 3 To lRow

ws.Cells(i, 13).Value = ws.Cells(i, 12).Value - ws.Cells(i, 11).Value

Next i


ws.Range("M2").Value = ws.Range("C2").Value - ws.Range("L1").Value




