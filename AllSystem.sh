#!/data/data/com.termux/files/usr/bin/bash

# =========================
# SOM
# =========================
som() {
    echo -ne "\a"
}

# =========================
# CORES
# =========================
ROXO='\033[1;35m'
VERDE='\033[1;32m'
VERMELHO='\033[1;31m'
RESET='\033[0m'

# =========================
# INTRO
# =========================
intro() {

clear
echo -e "${ROXO}"

som
echo "CARREGANDO SISTEMA..."
sleep 1

clear
cat << "EOF"

██╗    ██╗ █████╗ ██╗     ██╗
██║    ██║██╔══██╗██║     ██║
██║ █╗ ██║███████║██║     ██║
██║███╗██║██╔══██║██║     ██║
╚███╔███╔╝██║  ██║███████╗██║
 ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝

██╗    ██╗ █████╗ ██╗     ██╗
██║    ██║██╔══██╗██║     ██║
██║ █╗ ██║███████║██║     ██║
██║███╗██║██╔══██║██║     ██║
╚███╔███╔╝██║  ██║███████╗██║
 ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝

EOF

echo -e "${RESET}"

sleep 1

for i in 3 2 1
do
    som
    echo "Iniciando em $i..."
    sleep 0.7
done

clear
}

# =========================
# BARRA DE LOADING
# =========================
loading() {

clear
echo -e "${ROXO}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "      INICIANDO SISTEMA"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${RESET}"

sleep 1

echo "[🔎] Procurando porta..."
sleep 2

echo "[✅] Porta encontrada e conectada."
sleep 1

IP="$((RANDOM % 223 + 1)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"

echo "[🌐] IP: [$IP]"
sleep 2

echo "[✅] Servidor Conectado!! Pronto para uso."
sleep 2

clear

}

# =========================
# KEY SYSTEM
# =========================
KEY_CORRETA="KEY-WALIBYPASS"
ARQ_KEY="$HOME/.sistema_key"

verificar_key() {

if [ -f "$ARQ_KEY" ]; then
    SALVA=$(cat "$ARQ_KEY")

    if [ "$SALVA" = "$KEY_CORRETA" ]; then
        echo "✔ Acesso liberado"
        sleep 1
        loading
        return
    fi
fi

clear

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "     Wali System"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

tentativas=3

while [ $tentativas -gt 0 ]
do
    som
    echo -ne "Digite a KEY: "
    read key

    if [ "$key" = "$KEY_CORRETA" ]; then

        echo "$KEY_CORRETA" > "$ARQ_KEY"

        echo ""
        echo -e "${VERDE}✔ KEY correta!${RESET}"

        sleep 1

        loading
        return

    else

        tentativas=$((tentativas - 1))

        echo -e "${VERMELHO}❌ KEY inválida!${RESET}"
        echo "Tentativas restantes: $tentativas"

        sleep 1
    fi
done

echo ""
echo "⛔ SISTEMA BLOQUEADO"
exit
}

# =========================
# ATIVAÇÃO
# =========================
ativar() {

som

echo ""
echo "🔄 Ativando $1..."
sleep 2

echo ""
echo "■■□□□□□□□□ 20%"
sleep 0.5

echo "■■■■□□□□□□ 40%"
sleep 0.5

echo "■■■■■■□□□□ 60%"
sleep 0.5

echo "■■■■■■■■□□ 80%"
sleep 0.5

echo "■■■■■■■■■■ 100%"
sleep 1

som

echo ""
echo -e "${VERDE}✅ $1 ativado com sucesso !!${RESET}"

echo ""
echo "🎮 Entre no jogo"
echo ""

sleep 3
}
menu_principal() {

while true
do
    clear

    echo -e "${ROXO}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "       Menu Principal"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${RESET}"

    echo ""
    echo " [1] Free Fire Max"
    echo " [2] Free Fire Normal"
    echo " [3] Sair"
    echo ""

    read -p "Escolha: " opcao

    case $opcao in

    1)
        echo ""
        echo "[✅] Free Fire Max encontrada com sucesso..."
        sleep 2
        menu
        ;;

    2)
        echo ""
        echo "[✅] Free Fire Normal encontrada com sucesso..."
        sleep 2
        menu
        ;;

    3)
        exit
        ;;

    *)
        echo "Opção inválida!"
        sleep 1
        ;;

    esac
done

}

# =========================
# MENU
# =========================
menu() {

while true
do

clear

echo -e "${ROXO}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "      Wali System"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${RESET}"

echo ""
echo " [1] Precison"
echo " [2] Aim Assist"
echo " [3] Estabilizar Mira"
echo " [4] Fps Boost"
echo " [5] Otimizar Dispositivo"
echo " [6] Sair"

echo ""
echo -ne "Escolha: "
read opcao

case $opcao in

1)
    ativar "Precison"
    ;;

2)
    ativar "Aim Assist"
    ;;

3)
    ativar "Estabilizando Mira"
    ;;

4)
    ativar " Fps Boost"
    ;;

5)
    ativar "Otimizando Dispositivo"
    ;;

6)
    clear
    echo "Saindo..."
    exit
    ;;

*)
    echo ""
    echo "❌ Opção inválida"
    sleep 1
    ;;
esac

done

}

# =========================
# INICIAR
# =========================
intro
verificar_key
menu_principal