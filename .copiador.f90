        PROGRAM Copiador
            IMPLICIT NONE

            ! ----------------------------------------------
            !   Vetores com os simbolos e coordenadas    
            ! ----------------------------------------------
                CHARACTER(len=2), DIMENSION(140) :: simbolos
                CHARACTER(len=2), DIMENSION(140) :: simbolos_cortados
                REAL, DIMENSION(140) :: x
                REAL, DIMENSION(140) :: y
                REAL, DIMENSION(140) :: z
            ! ----------------------------------------------

            ! ----------------------------------------------
            !   Variáveis para loops
            ! ----------------------------------------------
                INTEGER :: i
            ! ----------------------------------------------

                ! ----------------------------------------------
                !           UNIDADES DE ARQUIVOS ABERTOS
                ! ----------------------------------------------
                !   5 - ChemicalSpeciesLabel_cortado.txt
                !  10 - AtomicCoordinatesAndAtomicSpecies.txt
                !  12 - AtomicCoordinatesAndAtomicSpecies_trocado.txt
                !  
                ! ----------------------------------------------

                ! Abrindo arquivo ChemicalSpeciesLabel
                OPEN(UNIT=5, FILE='ChemicalSpeciesLabel_cortado.txt', status='OLD')

                    DO i=1, 6

                        READ(5,*) simbolos_cortados(i)

                    END DO

                CLOSE(5)    ! Fechando ChemicalSpeciesLabel_cortado.txt

                ! Abrindo 
                OPEN(UNIT=10, FILE='AtomicCoordinatesAndAtomicSpecies.txt', status='OLD')
                OPEN(UNIT=12, FILE='AtomicCoordinatesAndAtomicSpecies_trocado.txt', ACTION='WRITE')

                    DO i=1, 140

                        READ(10,*) simbolos(i), x(i), y(i), z(i)    ! Lendo coordenadas linha a linha de [ 10 ]
                        WRITE(12,100) x(i), y(i), z(i), simbolos(i) ! Gravando matriz com coluna trocada em arquivo texto em [ 12 ]
                            100 FORMAT (3F17.6  A10)              
                    END DO

                CLOSE(10)   ! fechando AtomicCoordinatesAndAtomicSpecies
                CLOSE(12)   ! fechando AtomicCoordinatesAndAtomicSpecies_trocado


            END PROGRAM Copiador
