@echo off
set PORT=8888

echo 查找占用端口 %PORT% 的进程...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :%PORT%') do (
    echo 发现 PID: %%a
    echo 正在尝试关闭进程 %%a ...
    taskkill /F /PID %%a
)

echo 操作完成！
pause
