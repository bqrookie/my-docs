@chcp 65001 >nul
@echo off
set "commit_msg=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,8%"

echo 正在添加所有更改...
git add .

:: 检查是否有待提交的更改
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo 没有检测到更改，跳过提交。
    pause
    exit /b
)

echo 正在提交更改，提交信息: %commit_msg%
git commit -m "%commit_msg%"

if %errorlevel% neq 0 (
    echo 提交失败，请检查仓库状态。
    pause
    exit /b
)

echo 正在推送到远程仓库...
git push

if %errorlevel% neq 0 (
    echo 推送失败，请检查网络连接或远程仓库权限。
    pause
    exit /b
)

echo 操作完成！
pause