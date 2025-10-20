#!/bin/bash

# 10초마다 도커 컨테이너의 '시간(초), 컨테이너이름, CPU %'를 출력하는 스크립트

echo "실행 중... (10초마다 로그 출력). 중지하려면 Ctrl+C를 누르세요."
echo "---------------------------------------------------------"

while true; do
    # 현재 시간을 Epoch 시간(초)으로 가져옵니다.
    TIMESTAMP=$(date +%s)

    # docker stats를 실행하여 NAME과 CPU %를 가져오고, 각 줄 앞에 현재 초를 추가하여 출력합니다.
    # sudo 권한이 필요할 경우 'docker stats' 대신 'sudo docker stats'를 사용하세요.
    sudo docker stats --no-stream --format '{{.Name}},{{.CPUPerc}}' | sed "s/^/$TIMESTAMP,/"

    # 다음 실행까지 10초 대기
    sleep 10
done
