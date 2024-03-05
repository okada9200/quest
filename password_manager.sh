#!/bin/bash

menu() {
    echo "パスワードマネージャーにようこそ！"
    while true; do
        echo "次の選択肢から入力して下さい（Add Password/Get Password/Exit）:"
        read select
        if [ "$select" = "Add Password" ]; then
            add_password
        elif [ "$select" = "Get Password" ]; then
            get_password
        elif [ "$select" = "Exit" ]; then
            echo "Thank you!"
            break
        else
            echo "入力が間違えています。Add Password/Get Password/Exit から入力して下さい。"
        fi
    done
}
add_password() {
    echo "サービス名を入力して下さい："
    read service_name
    echo "ユーザー名を入力して下さい："
    read user_name
    echo "パスワードを入力して下さい："
    read password
    echo "$service_name:$user_name:$password" >> passfile
}

get_password() {
    echo "サービス名を入力してください："
    read service_name

    local result=$(grep "^$service_name:" "passfile")
    if [ -n "$result" ]; then
        local username=$(echo "$result" | cut -d ':' -f 2)
        local password=$(echo "$result" | cut -d ':' -f 3)
        echo "サービス名：$service_name"
        echo "ユーザー名：$username"
        echo "パスワード：$password"
    else
        echo "そのサービスは登録されていません。"
    fi
}

menu

