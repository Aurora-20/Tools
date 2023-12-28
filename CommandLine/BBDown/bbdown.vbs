Set WshShell = CreateObject("WScript.Shell")

' 获取剪贴板数据
clip = WshShell.Exec("powershell -command ""Get-Clipboard""").StdOut.ReadAll

' 检查 clip 是否为空
If Len(clip) = 0 Then
    MsgBox "剪贴板为空，无法执行操作", vbExclamation, "提示"
    WScript.Quit
End If

' 调用PowerShell运行命令并最小化窗口
command = "powershell -command ""bbdown """ & clip & """"
errCode = WshShell.Run(command, 2, True)

' 检查命令执行是否成功
If errCode <> 0 Then
    MsgBox "Something Wrong " & errCode, vbCritical
End If

WScript.Quit
