Attribute VB_Name = "EncryptDecrypt"
Option Explicit

' ==========================================================================
'  Encrypt / Decrypt Data - reversible text masking for Excel
'  by CA Umang Mehta (@mehtaknowstech) - MIT License
'  https://github.com/imumehta/ca-toolkit
'
'  Encrypt_Data swaps A-Z and a-z in the selected cells for Greek letters
'  and symbols; Decrypt_Data swaps them back.
'
'  Masking, not security: anyone who has this macro can reverse it.
'  Numbers, dates, formulas, blanks and error values are never changed.
'  Save your workbook first - macro changes cannot be undone with Ctrl+Z.
' ==========================================================================

Public Sub Encrypt_Data()
    RunMasking True
End Sub


Public Sub Decrypt_Data()
    RunMasking False
End Sub


Private Sub RunMasking(ByVal encryptMode As Boolean)
    Dim title As String
    Dim prevCalc As XlCalculation
    Dim changed As Long
    Dim finished As Boolean

    title = IIf(encryptMode, "Encrypt_Data", "Decrypt_Data")

    If TypeName(Selection) <> "Range" Then
        MsgBox "Please select a range of cells first.", vbExclamation, "No Selection"
        Exit Sub
    End If

    If Selection.Worksheet.ProtectContents Then
        MsgBox "This sheet is protected. Unprotect it first.", vbExclamation, title
        Exit Sub
    End If

    prevCalc = Application.Calculation
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual
    Application.EnableEvents = False

    On Error GoTo ErrHandler
    changed = ProcessSelection(Selection, encryptMode)
    finished = True

CleanExit:
    Application.Calculation = prevCalc
    Application.ScreenUpdating = True
    Application.EnableEvents = True
    If finished Then
        MsgBox IIf(encryptMode, "Encryption", "Decryption") & " complete: " & changed & " cell(s) changed.", _
               vbInformation, title
    End If
    Exit Sub

ErrHandler:
    MsgBox "An error occurred during " & IIf(encryptMode, "encryption", "decryption") & ":" & vbCrLf & _
           Err.Description, vbCritical, title & " Error"
    Resume CleanExit
End Sub


Private Function ProcessSelection(ByVal target As Range, ByVal encryptMode As Boolean) As Long
    ' Only constant text cells are processed, and only cells whose text actually
    ' changes are written back - so formulas and other cells are left exactly as they were.
    Dim textCells As Range
    Dim cell As Range
    Dim oldText As String
    Dim newText As String
    Dim n As Long

    If target.Cells.CountLarge = 1 Then
        ' SpecialCells on a single cell would search the whole sheet
        If Not target.HasFormula And VarType(target.Value) = vbString Then Set textCells = target
    Else
        On Error Resume Next
        Set textCells = target.SpecialCells(xlCellTypeConstants, xlTextValues)
        On Error GoTo 0
    End If

    If textCells Is Nothing Then Exit Function

    For Each cell In textCells.Cells
        If VarType(cell.Value) = vbString Then
            oldText = cell.Value
            newText = ProcessText(oldText, encryptMode)
            If newText <> oldText Then
                ' Keep text as text: "Jan-25" or "1e5" must not turn into a date or number
                If IsNumeric(newText) Or IsDate(newText) Then newText = "'" & newText
                cell.Value = newText
                n = n + 1
            End If
        End If
    Next cell

    ProcessSelection = n
End Function


Private Function ProcessText(ByVal txt As String, ByVal encryptMode As Boolean) As String
    Dim i As Long
    Dim ch As String
    Dim result As String

    result = ""

    For i = 1 To Len(txt)
        ch = Mid(txt, i, 1)
        If encryptMode Then
            result = result & EncryptChar(ch)
        Else
            result = result & DecryptChar(ch)
        End If
    Next i

    ProcessText = result
End Function


Private Function MaskUpperCode(ByVal idx As Integer) As Integer
    Dim codes(1 To 26) As Integer
    codes(1) = 913:  codes(2) = 914:  codes(3) = 915:  codes(4) = 916
    codes(5) = 917:  codes(6) = 918:  codes(7) = 919:  codes(8) = 920
    codes(9) = 921:  codes(10) = 922: codes(11) = 923: codes(12) = 924
    codes(13) = 925: codes(14) = 926: codes(15) = 927: codes(16) = 928
    codes(17) = 929: codes(18) = 931: codes(19) = 932: codes(20) = 933
    codes(21) = 934: codes(22) = 935: codes(23) = 936: codes(24) = 937
    codes(25) = 8251
    codes(26) = 8225
    MaskUpperCode = codes(idx)
End Function


Private Function MaskLowerCode(ByVal idx As Integer) As Integer
    Dim codes(1 To 26) As Integer
    codes(1) = 945:  codes(2) = 946:  codes(3) = 947:  codes(4) = 948
    codes(5) = 949:  codes(6) = 950:  codes(7) = 951:  codes(8) = 952
    codes(9) = 953:  codes(10) = 954: codes(11) = 955: codes(12) = 956
    codes(13) = 957: codes(14) = 958: codes(15) = 959: codes(16) = 960
    codes(17) = 961: codes(18) = 963: codes(19) = 964: codes(20) = 965
    codes(21) = 966: codes(22) = 967: codes(23) = 968: codes(24) = 969
    codes(25) = 164
    codes(26) = 10022
    MaskLowerCode = codes(idx)
End Function


Private Function EncryptChar(ByVal ch As String) As String
    Dim code As Integer
    code = AscW(ch)

    If code >= 65 And code <= 90 Then
        EncryptChar = ChrW(MaskUpperCode(code - 64))
    ElseIf code >= 97 And code <= 122 Then
        EncryptChar = ChrW(MaskLowerCode(code - 96))
    Else
        EncryptChar = ch
    End If
End Function


Private Function DecryptChar(ByVal ch As String) As String
    Dim code As Long
    Dim i As Integer

    code = AscW(ch)
    If code < 0 Then code = code + 65536

    For i = 1 To 26
        If MaskUpperCode(i) = code Then
            DecryptChar = Chr(64 + i)
            Exit Function
        End If
        If MaskLowerCode(i) = code Then
            DecryptChar = Chr(96 + i)
            Exit Function
        End If
    Next i

    DecryptChar = ch
End Function
