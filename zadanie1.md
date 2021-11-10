# 1.
program jest w repozytorium, ma nazwę program.sh, do jego użycia instaluję: apache2, curl i jq
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

