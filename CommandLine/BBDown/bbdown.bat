@echo off
setlocal EnableDelayedExpansion

:: 获取剪贴板数据
for /f "delims=" %%a in ('powershell -command "Get-Clipboard"') do set "clip=%%a"

:: 检查 clip 是否为空
if not defined clip (
    echo 剪贴板为空，无法执行操作
    goto :EOF
)

:: 最小化窗口
start /min powershell -command "bbdown !clip!"

:end
endlocal
