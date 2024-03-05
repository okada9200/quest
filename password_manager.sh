#!/bin/bash


    echo "サービス名を入力して下さい："
    read service_name
    echo "ユーザー名を入力して下さい："
    read user_name
    echo "パスワードを入力して下さい："
    read password
    echo "Thank you!"
    echo "$service_name:$user_name:$password" >> passfile

