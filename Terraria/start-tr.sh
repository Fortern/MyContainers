#!/bin/bash

mkdir /Terraria
mkdir -p ~/.local/share/
ln -s /Terraria ~/.local/share/
cd ~/.local/share/Terraria

# create banlist.txt
if [ ! -f "banlist.txt" ];then
    touch banlist.txt
fi

TR_CONFIG_PATH="tr.conf"
if [ ! -f $TR_CONFIG_PATH ];then
    echo "conf exists."

    if [ -z "$AUTOCREATE" ]; then
        AUTOCREATE=3
    fi
    echo "autocreate=$AUTOCREATE" >> "$TR_CONFIG_PATH"

    if [ -n "$SEED" ]; then
        echo "seed=$SEED" >> "$TR_CONFIG_PATH"
    fi
    
    if [ -n "$PLAYERS" ]; then
        echo "maxplayers=$PLAYERS" >> "$TR_CONFIG_PATH"
    fi

    if [ -n "$PASSWORD" ]; then
        echo "password=$PASSWORD" >> "$TR_CONFIG_PATH"
    fi

    if [ -n "$SECURE" ]; then
        echo "secure=$SECURE" >> "$TR_CONFIG_PATH"
    fi

    if [ -n "$MOTD" ]; then
        echo "motd=$MOTD" >> "$TR_CONFIG_PATH"
    fi

    if [ -n "$DIFFICULTY" ]; then
        echo "difficulty=$DIFFICULTY" >> "$TR_CONFIG_PATH"
    fi

    if [ -n "$LANG" ]; then
        echo "language=$LANG" >> "$TR_CONFIG_PATH"
    fi
    
    if [ -n "$NPCSTREAM" ]; then
        echo "npcstream=$NPCSTREAM" >> "$TR_CONFIG_PATH"
    fi
fi

chmod +x /opt/terraria/TerrariaServer*

echo "starting terraria..."
echo "如果长时间没有进一步输出，请检查配置文件中有无autocreate配置项，然后重试"

exec /opt/terraria/TerrariaServer.bin.x86_64 -config /Terraria/tr.conf -banlist /Terraria/banlist.txt -port 7777 -world /Terraria/worlds/world.wld -worldname world

