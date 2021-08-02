echo " Verificando dependências"	# log terminal


DEP_GFORTRAN=FALSE






exibir_status_dependencia() {
if [ $1 = FALSE ]; then
    printf "[ ${verde}OK${limpar} ] $2 encontrado em \n"
else
    printf "[${vermelho}ERRO${limpar}] $2 não encontrado \n"
fi
}



exibir_status_dependencia  "$DEP_GFORTRAN" "FORTRAN"