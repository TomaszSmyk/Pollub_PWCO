1. program jest w repozytorium, ma nazwę program.sh, do jego użycia instaluję: apache2, curl i jq
2. Dockerfile też jest w repo, ma nazwę Dockerfile
używam tam ubuntu, instaluję: apache2, curl i jq, kopiuję program.sh a następnie go uruchamiam. Dodatkowo wykonuję konfigurację, niezbędną do działania apache
3.
  a) docker build -t sprawozdanie .
  b) docker run -d sprawozdanie
  c) docker run -it sprawozdanie sh
     cat log.txt
  d) docker hstory sprawozdanie
