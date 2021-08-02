






















zenity --question \
--title="Gfortran" \
--text "Deseja instalar o gfortran agora?" \
--ok-label="Sim" \
--cancel-label="Não"



if [ $? = 0 ]; then
    sudo apt-get install gfortran
else
    echo "Ok. Não insalaremos o gfortran, mas não será possível continuar. Saíndo..."
fi