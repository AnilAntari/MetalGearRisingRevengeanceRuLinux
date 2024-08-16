#!/usr/bin/env bash

echo '
------------------------------------------
|                                        |
|                                        |
| Metal Gear Rising Revengeance Ru Linux |
|                                        |
|                                        |
------------------------------------------
'

VER="1.0"

LINK="https://github.com/AnilAntari/MetalGearRisingRevengeanceRuLinux/releases/download/$VER/generic.tar.zst"
GAMEPATH="$HOME/.local/share/Steam/steamapps/common/METAL GEAR RISING REVENGEANCE"

if ! command -v zstd &> /dev/null; then
    echo "zstd не установлен. Пожалуйста, установите zstd и повторите попытку."
    exit 1
fi

[ -d "$GAMEPATH" ] && {
	echo "Игра была найдена в ${GAMEPATH}"
} || {
	read -rp "Игра не была найдена в $GAMEPATH, укажите путь к игре: " GAMEPATH
	[ -d "$GAMEPATH" ] || { echo "Игра не была найдена в $GAMEPATH, выход " ; exit 1 ; }
}

echo "Загрузка"
wget "$LINK"

tar -I zstd -xvf generic.tar.zst && mv data000.cpk "${GAMEPATH}/GameData"

rm generic.tar.zst

echo "Готово"
