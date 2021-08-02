verde="\033[1;32m"
vermelho="\033[1;31m"
limpar="\033[0m"





if ! command -v xmakemol &> /dev/null; then
    printf "[${vermelho}Erro${limpar}] xmakemol não está instalado \n"
    DEP_XMAKEMOL=FALSE                      # Muda a flag para indicar que a dependência xmakemol não está satisfeita
else
	printf "[ ${verde}OK${limpar} ] xmakemol encontrado em "
	command -v gfortran
fi

echo "--------------------------"


if [ $DEP_XMAKEMOL = FALSE ]; then
    zenity --question  \
    --title="xmakemol" \
    --text "Deseja instalar o xmakemol agora?" \
    --ok-label="Sim" \
    --cancel-label="Não"

    if [ $? = 0 ]; then
        sudo apt-get install xmakemol
    else
        echo "Ok. Não insalaremos o xmakemol, mas não será possível continuar. Saíndo..."
        exit 1
    fi
fi
# =================================================================================