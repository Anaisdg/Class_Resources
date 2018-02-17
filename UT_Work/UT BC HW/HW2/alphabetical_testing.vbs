Sub alphebetical_testing()

 For Each ws In Worksheets
     Dim lRow As Long

      'Find the last non-blank cell in column A(1)
        lRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
       'test to see if lRow is working
        'MsgBox


  ' Set an initial variable for holding the brand name
  Dim ticker As String

  ' Set an initial variable for holding the total per credit card brand
  Dim totalvolume As Long
  totalvolume = 0

  ' Keep track of the location for each credit card brand in the summary table
  Dim track As Long
  track = 2

  ' Loop through all credit card purchases
  For i = 2 To lRow

    ' Check if we are still within the same credit card brand, if it is not...
    If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then

      ' Set the Brand name
      ticker = ws.Cells(i, 1).Value

      ' Add to the Brand Total
      totalvolume = totalvolume + ws.Cells(i, 7).Value

      ' Print the Credit Card Brand in the Summary Table
      ws.Range("I" & track).Value = ticker

      ' Print the Brand Amount to the Summary Table
      ws.Range("J" & track).Value = totalvolume

      ' Add one to the summary table row
      track = track + 1
      
      ' Reset the Brand Total
      totalvolume = 0

    ' If the cell immediately following a row is the same brand...
    Else

      ' Add to the Brand Total
      totalvolume = totalvolume + ws.Cells(i, 7).Value

    End If

  Next i


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
    Range("I1").EntireRow.Select
    Selection.Copy Destination:=Sheets(1).Range("A1")

    'Create for loop to concatenat all worksheets'
    For J = 2 To Sheets.Count
    Sheets(J).Activate
    Range("I1").Select
    Selection.CurrentRegion.Select

    'amend so that it doesn't contain the headers'
    Selection.Offset(1, 0).Resize(Selection.Rows.Count - 1).Select

    'Create copy destination by seeking last row in excel, going up to the bottom of it which has...'
    '...position=1 and offsetting by 2; Offset 1--final row in Sheet(1)--and an ...'
    '...additional 1--the first row in copied material from Sheet(2)'
    Selection.Copy Destination:=Sheets(1).Range("A65536").End(xlUp)(2)

    Next J

End Sub

