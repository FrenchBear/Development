Attribute VB_Name = "Module1"
Option Explicit
Public x As New XArrayDB
Public xd As New XArrayDB

Sub LoadX()
    x.ReDim 0, 12, 0, 8
    xd.ReDim 0, 4, 0, 0
    
    ' Supplier country
    x(0, 0) = "CANADA"
    x(1, 0) = "CANADA"
    x(2, 0) = "CANADA"
    x(3, 0) = "ENGLAND"
    x(4, 0) = "ENGLAND"
    x(5, 0) = "GERMANY"
    x(6, 0) = "GERMANY"
    x(7, 0) = "GERMANY"
    x(8, 0) = "NETHERLANDS"
    x(9, 0) = "NETHERLANDS"
    x(10, 0) = "USA"
    x(11, 0) = "USA"
    x(12, 0) = "USA"
    
    ' Product line
    x(0, 1) = "Audio/Video"
    x(1, 1) = "Dining Room"
    x(2, 1) = "Home/Office"
    x(3, 1) = "Audio/Video"
    x(4, 1) = "Home/Office"
    x(5, 1) = "Audio/Video"
    x(6, 1) = "Bar/Grill"
    x(7, 1) = "Dining Room"
    x(8, 1) = "Home/Office"
    x(9, 1) = "Audio/Video"
    x(10, 1) = "Dining Room"
    x(11, 1) = "Home/Office"
    x(12, 1) = "Bar/Grill"

    ' On sale
    x(0, 2) = 0
    x(1, 2) = 1
    x(2, 2) = 1
    x(3, 2) = 0
    x(4, 2) = 1
    x(5, 2) = 0
    x(6, 2) = 1
    x(7, 2) = 0
    x(8, 2) = 1
    x(9, 2) = 1
    x(10, 2) = 0
    x(11, 2) = 1
    x(12, 2) = 1

    ' Product Number
    x(0, 3) = "10010"
    x(1, 3) = "10020"
    x(2, 3) = "29292"
    x(3, 3) = "93847"
    x(4, 3) = "10010"
    x(5, 3) = "83833"
    x(6, 3) = "29992"
    x(7, 3) = "82264"
    x(8, 3) = "27740"
    x(9, 3) = "20038"
    x(10, 3) = "67772"
    x(11, 3) = "88209"
    x(12, 3) = "17171"
    
    ' Description
    x(0, 4) = "Stand, small (1 shelf, 3 legs)"
    x(1, 4) = "Bookcase (2 shelves)"
    x(2, 4) = "Desk, chair no arms or rollers"
    x(3, 4) = "Chair, dining (no arms)"
    x(4, 4) = "Stand, small (1 shelf, 3 legs"
    x(5, 4) = "Lazyboy"
    x(6, 4) = "Futon (no mattress)"
    x(7, 4) = "Rocking chair"
    x(8, 4) = "Desk (6 legs)"
    x(9, 4) = "Bookcase (1 shelf)"
    x(10, 4) = "Halogen Lamp"
    x(11, 4) = "White board"
    x(12, 4) = "Printer stand (rollers)"
    
    ' Price
    x(0, 5) = 25
    x(1, 5) = 150
    x(2, 5) = 400
    x(3, 5) = 125
    x(4, 5) = 25
    x(5, 5) = 600
    x(6, 5) = 300
    x(7, 5) = 99.99
    x(8, 5) = 45.67
    x(9, 5) = 129
    x(10, 5) = 75
    x(11, 5) = 128
    x(12, 5) = 230
   
    ' On hand
    x(0, 6) = 4
    x(1, 6) = 57
    x(2, 6) = 40
    x(3, 6) = 7
    x(4, 6) = 0
    x(5, 6) = 2
    x(6, 6) = 9
    x(7, 6) = 23
    x(8, 6) = 1
    x(9, 6) = 5
    x(10, 6) = 11
    x(11, 6) = 28
    x(12, 6) = 3
    
    ' Reorder
    x(0, 7) = 3
    x(1, 7) = 60
    x(2, 7) = 20
    x(3, 7) = 3
    x(4, 7) = 2
    x(5, 7) = 1
    x(6, 7) = 5
    x(7, 7) = 15
    x(8, 7) = 1
    x(9, 7) = 2
    x(10, 7) = 5
    x(11, 7) = 10
    x(12, 7) = 2
    
    ' Reorder level
    x(0, 8) = 15
    x(1, 8) = 5
    x(2, 8) = 10
    x(3, 8) = 15
    x(4, 8) = 10
    x(5, 8) = 5
    x(6, 8) = 10
    x(7, 8) = 15
    x(8, 8) = 5
    x(9, 8) = 10
    x(10, 8) = 15
    x(11, 8) = 5
    x(12, 8) = 10
    
    ' Dropdown
    xd(0, 0) = "Home/Office"
    xd(1, 0) = "Dining Room"
    xd(2, 0) = "Family/Living Room"
    xd(3, 0) = "Audio/Video"
    xd(4, 0) = "Bar/Grill"

End Sub
