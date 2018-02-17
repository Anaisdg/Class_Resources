Sub alphabetical_testing_moderate()

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
          

    ' If the next ticker immediately following is the same..
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

ws.Range("N1").Value = "Percent Change"



' Transfer first start/open value to new column'
 
ws.Range("L2").Value = ws.Range("C2").Value


' Input yearly changes by subtracting the two columns
 
Dim lRowTwo As Long
' Find the last non-blank cell in column I(9), where the new data is stored
lRowTwo = ws.Cells(Rows.Count, 9).End(xlUp).Row

' Set variable for all remainging start values and closing values
Dim ss As Double
Dim cc As Double


     For i = 2 To lRowTwo
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
    Sheets(1).Range("C1").Value = "Close End Value"
    Sheets(1).Range("D1").Value = "Open Start Value"
    Sheets(1).Range("E1").Value = "Yearly Change"
    Sheets(1).Range("F1").Value = "Percent Change"


End Sub












