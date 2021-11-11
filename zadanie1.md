# 1.
program jest w repozytorium, ma nazwę program.sh, do jego użycia instaluję: apache2, curl i jq

Działanie programu:

1. Tworzę plik log.txt, do którego wrzucam wymagane logi
2. Przechodzę do /var/www/html/, jest to folder apache, w którym znajduje się plik index.html
3. usuwam index.html i tworzę plik o takiej samej nazwie
4. poleceniami `echo` wrdzucam do pliku index.html niezbędene informacje z zadanie. 
5. Do adresu ip używam API (ipinfo.io), atomiast do daty używam konstruktora klasy Date (JavaScript)
6. Odpalam program poleceniem `./program.sh` (do działania programu może być niezbędne nadanie uprawnień plikowi program.sh: `chmod +x program.sh`)

Wynik działania programu w przeglądarce:
![obraz](https://user-images.githubusercontent.com/53970326/141271011-66c73195-6b96-4b25-a647-80785a9dfbb3.png)


Działanie programu jest następujące: 
# 2. 
Dockerfile też jest w repo, ma nazwę Dockerfile
używam tam ubuntu, instaluję: apache2, curl i jq, kopiuję program.sh a następnie go uruchamiam. Dodatkowo wykonuję konfigurację, niezbędną do działania apache
# 3.
  a) docker build -t sprawozdanie .
  
  b) docker run -d sprawozdanie
  
  c) docker run -it sprawozdanie sh
     cat log.txt
     
  d) docker hstory sprawozdanie
  
# 4.
Dodałem workflow do githuba, zdefiniowałem secrety i teraz za każdym razem jak spushuję na remote to obraz się zbuduje do repo DockerHub
![obraz](https://user-images.githubusercontent.com/53970326/141201195-445f6e7d-bb99-469c-96f0-6602169e7651.png)
![obraz](https://user-images.githubusercontent.com/53970326/141201284-e1f9f2e0-83af-4af4-ae82-8f1598209c3f.png)

