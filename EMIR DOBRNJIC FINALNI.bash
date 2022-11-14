#Online Bash Shell.
#Code, Compile, Run and Debug Bash script online.
#Write your code in this editor and press "Run" button to execute it.

declare -a PACIJENT_IME=()
declare -a PACIJENT_PREZIME=()
declare -a PACIJENT_ADRESA=()
declare -a PACIJENT_JMBG=()
declare -a PACIJENT_ANALIZA=()
    


declare -a ODJELI=()

declare -a ODJEL_1=()
declare -a ODJEL_2=()
declare -a ODJEL_3=()
declare -a ODJEL_4=()
declare -a ODJEL_5=()


Kreiraj_Pacijenta_Funkcija(){

    read -p "Unesite ime pacijenta: " TEMP_IME
    read -p "Unesite prezime pacijenta: " TEMP_PREZIME
    read -p "Unesite adresu pacijenta: " TEMP_ADRESA
    read -p "Unesite JMBG pacijenta: " TEMP_JMBG
    read -p "Unesite analizu pacijenta pacijenta: " TEMP_ANALIZA
    echo "Kreiranje pacijenta..."
    
    sleep 2
    
    echo "Uspjesno kreiran pacijent! "
    
    
    PACIJENT_IME+=($TEMP_IME)
    PACIJENT_PREZIME+=($TEMP_PREZIME)
    PACIJENT_ADRESA+=($TEMP_ADRESA)
    PACIJENT_JMBG+=($TEMP_JMBG)
    PACIJENT_ANALIZA+=($TEMP_ANALIZA)
}


Lista_Pacijenata_Funkcija(){
    DUZINA=${#PACIJENT_IME[@]}
    echo "$DUZINA"
    
    for (( i = 0; i < ${DUZINA}; i++ ))
    do
    
        echo "Pacijent :" $(( $i+1 ))
        echo "Ime: "${PACIJENT_IME[i]}
        echo "Prezime: "${PACIJENT_PREZIME[i]}
        echo "Adresa: " ${PACIJENT_ADRESA[i]}
        echo "Maticni broj: "${PACIJENT_JMBG[i]}
        echo "Analiza "${PACIJENT_ANALIZA[i]}
        echo -e "\n"
    done
}



echo -e "\t\t\tDobro dosli u Kliniku Preporod, Izaberite zeljene opcije."
     
    

KORISNIK_SIFRA=1111


ADMIN_IME=emir
ADMIN_PASS=1234

select GLAVNI_MENI in STRUCNO_OSOBLJE KORISNICI EXIT
do 
  
  case $GLAVNI_MENI in
      STRUCNO_OSOBLJE)
         echo -e  "\t\t\tUslite ste u admin Mod"
         echo "Unesite vas username"
          read UNOS_ADMIN_IME
         echo "Unesite vas password"
          read UNOS_ADMIN_PASS
          if [ $UNOS_ADMIN_IME == $ADMIN_IME ] && [ $UNOS_ADMIN_PASS -eq $ADMIN_PASS ]  
          then
             echo -e "\t\t\tUspjesno ste usli u admin mod."
             
              select ADMIN_OPCIJE in KREIRANJE_PACIJENTA EDIT_PACIJENTA BRISANJE_PACIJENTA ISPIS_PACIJENATA KREIRANJE_ODJELA EXIT
              do 
                case $ADMIN_OPCIJE in
                     KREIRANJE_PACIJENTA)
                     
                     echo -e "\t\tKreiraj_Pacijenta"
                            Kreiraj_Pacijenta_Funkcija
                     
                      
                     
                      
                     ;; 
                     
                     EDIT_PACIJENTA)
                      echo -e "\t\t\tUredi_Pacijenta"
                            Lista_Pacijenata_Funkcija
                                read -p "Unesite redni broj pacijenta kako bi nastavili sa uredjivanjem: " INDEX
                                echo "Pacijent $INDEX"
                                INDEX=$INDEX-1
                                NADJEN=0
                                for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ )) 
                                do
                                            if [ ${PACIJENT_IME[i]} == ${PACIJENT_IME[INDEX]} ]
                                            then
                                                NADJEN=1
                                                echo "Ime: "${PACIJENT_IME[INDEX]}
                                                echo "Prezime: "${PACIJENT_PREZIME[INDEX]}
                                                echo "Adresa: "${PACIJENT_ADRESA[INDEX]}
                                                echo "JMBG: "${PACIJENT_JMBG[INDEX]}
                                                echo "Analiza: "${PACIJENT_ANALIZA[INDEX]}
                                                echo "Izaberite koju sekciju zelite urediti: "                          
                                                select EDIT in IME_NOVO PREZIME_NOVO ADRESA_NOVO JMBG_NOVO ANALIZA_NOVO EXIT
                                                do 
                            
                                                   case $EDIT in
                                                     IME_NOVO)
                               
                                                         echo -e "\t\tIme"
                                                         echo "Staro ime:" ${PACIJENT_IME[INDEX]}
                                                         read -p "Unesite novo ime pacijenta: " NOVO_IME
                                                         echo "Novo ime: " $NOVO_IME
                                                         PACIJENT_IME[INDEX]=$NOVO_IME
                                                         echo "Uspjesno ste redili pacijenta!!"
                                                         
                                
                            
                                                     ;;
                            
                                                     PREZIME_NOVO)
                            
                                                         echo -e "\t\tPrezime"
                                                         echo "Staro prezime:" ${PACIJENT_PREZIME[INDEX]}
                                                         read -p "Unesite novo prezime pacijenta: " NOVO_PREZIME
                                                         echo "Novo prezime: " $NOVO_PREZIME
                                                         PACIJENT_PREZIME[INDEX]=$NOVO_PREZIME
                                                         echo "Uspjesno ste redili pacijenta!!"
                                                         
                            
                            
                                                     ;;
                            
                                                     ADRESA_NOVO)
                                                         echo -e "\t\tAdresa"
                                                         echo "Stara adresa:" ${PACIJENT_ADRESA[INDEX]}
                                                         read -p "Unesite novu adresu pacijenta: " NOVA_ADRESA
                                                         echo "Nova adresa: " $NOVA_ADRESA
                                                         PACIJENT_ADRESA[INDEX]=$NOVA_ADRESA
                                                         echo "Uspjesno ste redili pacijenta!!"
                                                         
                            
                        
                                                     ;;
                            
                                                     JMBG_NOVO)
                                                         echo  -e"\t\tJMBG"
                                                         echo "Stari JMBG :" ${PACIJENT_JMBG[INDEX]}
                                                         read -p "Unesite novi JMBG pacijenta: " NOVI_JBMG
                                                         echo "Novi JMBG: " $NOVI_JBMG
                                                         PACIJENT_JMBG[INDEX]=$NOVI_JBMG
                                                         echo "Uspjesno ste redili pacijenta!!"
                                                         
                            
                                                     ;;
                            
                                                     ANALIZA_NOVO)
                                                         echo -e "\t\tAnaliza"
                                                         echo "Stara analiza :" ${PACIJENT_ANALIZA[INDEX]}
                                                         read -p "Unesite novu analizu pacijenta: " NOVA_ANALIZA
                                                         echo "Nova analiza: " $NOVA_ANALIZA
                                                         PACIJENT_ANALIZA[INDEX]=$NOVA_ANALIZA
                                                         echo "Uspjesno ste redili pacijenta!!"
                                                         
                            
                                                     ;;
                            
                                                     EXIT)
                                                         echo "Nazad"
                                                         
                            
                                                     ;;
                            
                                                     *)
                                                         echo "Greska!!"
                                                     ;;
                                                  esac
                                                done   
                                           fi
                                           if (( $NADJEN == "0" && $i == $((${#PACIJENT_IME[@]}-1)) ))
                                            then
                                                echo -e "\nPacijent sa tim rednim brojem se ne nalazi u nasoj bazi!\n"
                                                
                                            fi
                                done
                                
                      
                     ;;
                     
                     BRISANJE_PACIJENTA)
                      Lista_Pacijenata_Funkcija
                        echo -e "\n\t\t\tObrisi_Pacijenta\n"
                                    Lista_Pacijenata_Funkcija
                                    read -p "* Unesite redni broj pacijenta kako bi ga obrisali iz baze: " INDEX
                                    INDEX=$INDEX-1
                                    NADJEN=0
                                    echo -e "\nPretrazivanje..."
                                    sleep 2
                                    for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ )) 
                                    do
                                        if [ ${PACIJENT_IME[i]} == ${PACIJENT_IME[INDEX]} ]
                                        then
                                            NADJEN=1
                                            echo -e "\n** Pacijent "$(( $i+1 ))
                                            echo "Ime: "${PACIJENT_IME[INDEX]}
                                            echo "Prezime: "${PACIJENT_PREZIME[INDEX]}
                                            echo "Adresa: "${PACIJENT_ADRESA[INDEX]}
                                            echo "JMBG: "${PACIJENT_JMBG[INDEX]}
                                            echo "Analiza: "${PACIJENT_ANALIZA[INDEX]}
                                            unset PACIJENT_IME[INDEX]
                                            unset PACIJENT_PREZIME[INDEX]
                                            unset PACIJENT_ADRESA[INDEX]
                                            unset PACIJENT_JMBG[INDEX]
                                            unset PACIJENT_ANALIZA[INDEX]
                                            echo -e "\nBrisanje..."
                                            sleep 1
                                            echo -e "\nPacijent je uspjesno obrisan!\n"
                                            
                                        fi
                                        if (( $NADJEN == "0" && $i == $((${#PACIJENT_IME[@]}-1)) ))
                                        then
                                            echo -e "\nPacijent sa tim rednim brojem se ne nalazi u nasoj bazi!\n"
                                            
                                        fi
                                    done    
                      
                     ;;
                     
                     ISPIS_PACIJENATA)
                      echo -e "\n\t\t\tLista_Pacijenata\n"
                      echo -e "Izlistavanje...\n"
                      sleep 2
                      if (( ${#PACIJENT_IME[@]} == "0" ))
                      then
                         echo -e "\nTrenutno nema aktivnih pacijenata!\n"
                      else
                      Lista_Pacijenata_Funkcija
                      fi
                      
                      
                      
                     ;;
                     
                     KREIRANJE_ODJELA)
                      echo -e "\n\t\t\tKreiraj_Odjel\n"
                                    ODJEL_HELP=1
                                    read -p "* Unesite naziv odjela: " TEMP_ODJEL
                                    echo -e "\nKeiranje..."
                                    sleep 2
                                    if (( ${#ODJELI[@]} == "5" ))
                                    then
                                        echo -e "\nKreiranje novog odjela nije moguce, kapaciteti su popunjeni!\n"
                                        
                                    else
                                        for (( i = 0; i < ${#ODJELI[@]}; i++ ))
                                        do
                                            if [ ${ODJELI[i]} == $TEMP_ODJEL ]
                                            then
                                                echo -e "\nOdjel vec postoji!\n"
                                                ODJEL_HELP=0
                                                
                                            fi
                                        done
        
                                        if (( $ODJEL_HELP == "1" ))
                                        then
                                           ODJELI+=($TEMP_ODJEL)
                                           echo -e "\nNovi odjel je uspjesno kreiran!\n"
                                           
                                        fi
                                    fi
                      
                      
                      
                     ;;
                     
                     EXIT)
                      echo "Exiting.."
                      break
                     ;; 
                    esac 
                done     
          else
          
            echo "Unijeli ste pogresno podatke, pokusajte ponovo"
           fi
        
        
        ;;
        
      KORISNICI)
      
         echo -e "\t\t\tDobro dosli u Korisnicki Mod"
      
         echo "Unesite vas username."
          read UNOS_KORISNIK_IME
         echo "Unesite vas password."
          read UNOS_KORISNIK_PAS
          
           sleep 2
          
           
           
    
          for (( i = 0; i < ${#PACIJENT_IME[@]}; i++ ))
          do
    
            if [ $UNOS_KORISNIK_IME == ${PACIJENT_IME[i]} ]  && [ $UNOS_KORISNIK_PAS -eq $KORISNIK_SIFRA ]  
            then
            echo -e "\t\t\tUsli ste u KORISNICKI MOD."
            select IZBOR_MENIJA in ISPIS_KARTONA ZAHTJEV_ZA_PRIJEM TRENUTNI_KAPAC EXIT
            do
              case $IZBOR_MENIJA in
               ISPIS_KARTONA)
               
                echo -e "\t\t\tIspis Kartona. "
                echo "Pacijent :" $(( $i+1 ))
                echo "Ime: "${PACIJENT_IME[i]}
                echo "Prezime: "${PACIJENT_PREZIME[i]}
                echo "Adresa: " ${PACIJENT_ADRESA[i]}
                echo "Maticni broj: "${PACIJENT_JMBG[i]}
                echo "Analiza "${PACIJENT_ANALIZA[i]}
                
                ;;
                
                ZAHTJEV_ZA_PRIJEM)
                echo -e "\t\t\tZahtjev_za_prijem_na_odjel\n"
                                    if (( ${#ODJELI[@]} == "0" ))
                                    then
                                        echo "Nema dostupnih odjela"
                                    else
                                        for (( j = 0; j < ${#ODJELI[@]}; j++ ))
                                        do
                                            echo $(( $j+1 )) ") " ${ODJELI[j]}
                                        done
                                        
                                        read -p "Unesite redni broj odjela za koji zelite da predate zahtjev: " RBR_ODJELA
                                        echo "Molimo pricekajte, da provjerimo da li imamo slobodnih termina danas!"
                                        sleep 3
                                        IME_PREZIME_POMOC=""
                                        if (( $RBR_ODJELA < "1" || $RBR_ODJELA > "5" ))
                                        then
                                            echo
                                            echo "Unijeli ste nevazeci redni broj odjela"
                                        elif (( ${#ODJELI[@]} >= "1" && $RBR_ODJELA == "1" ))
                                        then
                                            
                                            if (( ${#ODJEL_1[@]} > "8" ))
                                            then
                                                
                                                echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo"
                                            else
                                                echo "Uspjesno ste rezervisali termin!"
                                                IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                IME_PREZIME_POMOC+=" "
                                                IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                
                                                ODJEL_1+=("$IME_PREZIME_POMOC")
                                                
                                            fi
                                            
                                        elif (( ${#ODJELI[@]} >= "2" && $RBR_ODJELA == "2" ))
                                        then
                                            
                                            
                                            if (( ${#ODJEL_2[@]} > "8" ))
                                            then
                                                echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo"
                                            else
                                                IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                IME_PREZIME_POMOC+=" "
                                                IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                
                                                ODJEL_2+=("$IME_PREZIME_POMOC")
                                                
                                            fi
                                            
                                        elif (( ${#ODJELI[@]} >= "3" && $RBR_ODJELA == "3" ))
                                        then
                                            
                                            
                                            if (( ${#ODJEL_3[@]} > "8" ))
                                            then
                                                echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo"
                                            else
                                                IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                IME_PREZIME_POMOC+=" "
                                                IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                
                                                ODJEL_3+=("$IME_PREZIME_POMOC")
                                                
                                            fi
                                            
                                        elif (( ${#ODJELI[@]} >= "4" && $RBR_ODJELA == "4" ))
                                        then
                                            
                                            
                                            if (( ${#ODJEL_4[@]} > "8" ))
                                            then
                                                echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo"
                                            else
                                                IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                IME_PREZIME_POMOC+=" "
                                                IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                
                                                ODJEL_4+=("$IME_PREZIME_POMOC")
                                                
                                            fi
                                            
                                        elif (( ${#ODJELI[@]} >= "5" && $RBR_ODJELA == "5" ))
                                        then
                                            
                                            
                                             if (( ${#ODJEL_5[@]} > "8" ))
                                            then
                                                echo ${ODJELI[RBR_ODJELA-1]} " nema slobodnih termina danas, pokusajte sutra ponovo"
                                            else
                                                
                                                IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                                IME_PREZIME_POMOC+=" "
                                                IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                                
                                                ODJEL_5+=("$IME_PREZIME_POMOC")
                                                
                                            fi
                                        fi
                                    fi
                ;;
                
                
                TRENUTNI_KAPAC)
                echo -e "\n\t\t\tPrikaz_trenutnih_kapaciteta_na_odjelima\n"
                                            
                                            IME_PREZIME_POMOC=""
                                            IME_PREZIME_POMOC+="${PACIJENT_IME[i]}"
                                            IME_PREZIME_POMOC+=" "
                                            IME_PREZIME_POMOC+="${PACIJENT_PREZIME[i]}"
                                            NADJEN=0
                                            if (( ${#ODJELI[@]} == "0"))
                                            then
                                                echo "Trenutno nemate ni jedan aktivan odjel!"
                                                
                                            else
                                                for (( j = 0; j < ${#ODJELI[@]}; j++ ))
                                                do
                                                    if  (( ${#ODJELI[@]} >= "1" && j == "0" ))
                                                    then
                                                        echo
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        for (( k = 0; k < ${#ODJEL_1[@]}; k++ ))
                                                        do  
                                                            if [ "${ODJEL_1[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                            echo -e "\n"
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                                if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_1[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC"\n"
                                                                NADJEN=0
                                                                
                                                            fi
                                                            
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "2" && j == "1" ))
                                                    then
                                                        echo -e "\n"
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        for (( k = 0; k < ${#ODJEL_2[@]}; k++ ))
                                                        do
                                                            if [ "${ODJEL_2[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                               if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_2[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC "\n"
                                                                NADJEN=0
                                                                
                                                            fi
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "3" && j == "2" ))
                                                    then
                                                        echo -e "\n"
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        for (( k = 0; k < ${#ODJEL_3[@]}; k++ ))
                                                        do
                                                            if [ "${ODJEL_3[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                            if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_3[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC "\n"
                                                                NADJEN=0
                                                                
                                                            fi
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "4" && j == "3" ))
                                                    then
                                                        for (( k = 0; k < ${#ODJEL_4[@]}; k++ ))
                                                        do
                                                            echo -e "\n"
                                                            echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                            if [ "${ODJEL_4[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                                if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_4[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC "\n"
                                                                NADJEN=0
                                                                
                                                            fi
                                                        done
                                                    fi
                                                    
                                                    if  (( ${#ODJELI[@]} >= "5" && j == "4" ))
                                                    then
                                                        echo -e "\n"
                                                        echo -n $(( $j+1 )) ") " ${ODJELI[j]} " "
                                                        for (( k = 0; k < ${#ODJEL_5[@]}; k++ ))
                                                        do
                                                            if [ "${ODJEL_5[k]}" == "$IME_PREZIME_POMOC" ]
                                                            then
                                                                NADJEN=1
                                                            else
                                                                echo -n "-"
                                                                if (( $k == $((${#ODJEL_1[@]}-1)) ))
                                                                then
                                                                    echo
                                                                    
                                                                fi
                                                            fi
                                                            
                                                            if (( $NADJEN == "1" && $k == $((${#ODJEL_5[@]}-1)) ))
                                                            then
                                                                echo -e " " $IME_PREZIME_POMOC "\n"
                                                                NADJEN=0
                                                                
                                                            fi 
                                                        done
                                                    fi
                                                    
                                                done
                                            fi
                ;;
                
                EXIT)
                
                echo -e "\nIzlaz..."
                break
                ;;
                
                  *)
                echo "Greska"
                
                ;;
                
                esac
                
            done    
               
            else
               echo "Unijeli ste pogresnu sifru pokusajte ponovo "
            fi
          done
      
       
      
     
      
      
        ;;
        
        EXIT)
        echo "Exiting..."
        
        break
        
        ;;
        
        
  esac
  
done  
  
  
  
  


