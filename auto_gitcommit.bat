@echo off
:: 获取当前日期和时间，格式化为: YYYY-MM-DD HH:MM:SS
set "commit_msg=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,8%"

echo 正在添加所有更改...
git add .

echo 正在提交更改，提交信息: %commit_msg%
git commit -m "%commit_msg%"

echo 正在推送到远程仓库...
git push

echo 操作完成！
pause