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
  Dim closeend As String

  ' Set an initial variable for start value
  Dim openstart As String
   
  ' Loop through all tickers

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

      ' Print the end value for test
      ws.Range("K" & tracker).Value = closeend


      ' Start up work for next ticker
       
      ' Add one to the tracker

      tracker = tracker + 1
      ' Reset the total stock value

      TSV = 0
      openstart = ws.Cells(i + 1, 3).Value
      ws.Range("L" & tracker).Value = openstart
          

    ' If the cell immediately following a row is the same brand...
    Else


    
      ' Add to the total stock value
      TSV = TSV + ws.Cells(i, 7).Value

         
            
               ' Set the start value
    
                ' Print the start value to test


               ' Exit if when true
           

      End If



  Next i

' Set Headers

ws.Range("I1").Value = "Ticker"

ws.Range("J1").Value = "Total Stock Value"

ws.Range("K1").Value = "Close End Value"

ws.Range("L1").Value = "Open Start Value"

ws.Range("M1").Value = "Yearly Change"

ws.Range("N2").Value = "Percent Change"



' Trans'

' Set variable for first start and close value in Row 2
Dim s As Double
Dim c As Double

 
s = ws.Range("C2").Value
c = ws.Range("K2").Value


ws.Range("M2").Value = c - s

' Hard coding color format for first yearly change

If ws.Range("M2") > 0 Then
   ws.Range("M2").Interior.ColorIndex = 4
ElseIf ws.Range("M2") < 0 Then
    ws.Range("M2").Interior.ColorIndex = 3
End If


' Input yearly changes by subtracting the two columns
 
Dim lRowTwo As Long
' Find the last non-blank cell in column I(9), where the new data is stored
lRowTwo = ws.Cells(Rows.Count, 9).End(xlUp).Row

' Set variable for all remainging start values and closing values
Dim ss As Double
Dim cc As Double


     For i = 3 To lRowTwo
         ss = ws.Cells(i, 12).Value
         cc = ws.Cells(i, 11).Value
         ws.Cells(i, 13).Value = cc - ss
 
      ' Color formating
 
          If ws.Cells(i, 13).Value > 0 Then
             ws.Cells(i, 13).Interior.ColorIndex = 4
          ElseIf ws.Cells(i, 13).Value < 0 Then
             ws.Cells(i, 13).Interior.ColorIndex = 3

          End If

      Next i

' Create Percent Change in Column N(14)
 
 


Dim yrchange As Double

For i = 2 To lRowTwo
    yrchange = ws.Cells(i, 13).Value
    ss = ws.Cells(i, 12).Value
        If ss <> 0 Then
        ws.Cells(i, 14) = FormatPercent(yrchange / ss)
        End If
Next i


      
Next ws


End Sub








