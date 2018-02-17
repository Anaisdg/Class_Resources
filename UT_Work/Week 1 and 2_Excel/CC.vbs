Sub CC()


Dim lRow As Long

    'Find the last non-blank cell in column A(1)
    lRow = Cells(Rows.Count, 1).End(xlUp).Row
   
    'Test to find last row
    'MsgBox "Last Row: " & lRow

'set a total for the sum

Dim total as Long

total=0

'set variable for the brand name'

Dim Brandname as String

'keep track of location'
Dim tracker as Long
tracker=2

    For i=2 to 101
    	if cells(i+1,1).value <> cells(i,1).value then 
    	Brandname=cells(i,1).value
    	total=total+ cells(i,3).value
    	Range("G" & tracker).Value=Brandname
    	Range("H" & tracker).Value=total
    	tracker=tracker + 1
    	total=0

    	Else

    	total=total+cells(i,3).value

    	End If

    Next i

  
End Sub
