# !/bin/bash
echo "成功调用: $0"
count=1  # 初始化计数器为1，因为参数从$1开始
for arg in "$@"
do
    echo "vscode/cmd传入的第$count个参数值为: $arg"
    ((count++))  # 使用算术表达式递增计数器
done


