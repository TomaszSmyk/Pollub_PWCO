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


# 2. 
Dockerfile też jest w repo, ma nazwę Dockerfile
używam tam ubuntu, instaluję: apache2, curl i jq, kopiuję program.sh a następnie go uruchamiam. Dodatkowo wykonuję konfigurację, niezbędną do działania apache.
# 3.
  a) docker build -t sprawozdanie .  (tutaj akurat jest z cache, ale nie dużo miejsca cały log zajmuje jakby zbudować od nowa, a robi się to flagą --no-cache)
  
  ![obraz](https://user-images.githubusercontent.com/53970326/141271209-bdd855a6-1de5-4447-b4fc-6c038bf7c478.png)

  b) docker run -d sprawozdanie
  
  ![obraz](https://user-images.githubusercontent.com/53970326/141271397-bd9492e0-4b85-49de-9a6c-43e3f3dcdb38.png)

  c) docker run -it sprawozdanie sh
     cat log.txt
     
   ![obraz](https://user-images.githubusercontent.com/53970326/141272062-893896c6-f395-4f08-8545-58ce75c2839b.png)
     
  d) docker hstory sprawozdanie
  
  ![obraz](https://user-images.githubusercontent.com/53970326/141272191-ddfacc55-b30b-4bc9-af97-5f9633f940ab.png)

  Lub też można użyć polecenia docker image inspect sprawozdanie | jq -r '.[].RootFS'
  
  ![obraz](https://user-images.githubusercontent.com/53970326/141272806-e2219673-c57c-4fd6-b18f-9c2443700bf6.png)

  
# 4.
Dodałem workflow do githuba, zdefiniowałem secrety i teraz za każdym razem jak spushuję na remote to obraz się zbuduje do repo DockerHub
![obraz](https://user-images.githubusercontent.com/53970326/141201195-445f6e7d-bb99-469c-96f0-6602169e7651.png)
![obraz](https://user-images.githubusercontent.com/53970326/141201284-e1f9f2e0-83af-4af4-ae82-8f1598209c3f.png)


# ZADANIA DODATKOWE

# 1.
a) `docker run -d -p 6677:5000 --restart always --name registry registry:2` uruchamiam obraz registry na porcie 6677 zamiast 5000 ( wcześniej go pobrałem `docker pull registry` ). Flaga --restart-always jest przydatna, bo prywatny rejestr powinien być częścią infrastruktury, która działa cały czas bez przerw.

![obraz](https://user-images.githubusercontent.com/53970326/141273899-b1d60601-7dde-4bb3-86e8-73141178925a.png)

b) 
`docker pull ubuntu` - pobieram obraz ubuntu w najnowszej wersji

`docker tag ubuntu localhost:6677/mojeubuntu` - taguję pobrany obraz podając adres przywatnego rejestru i tag (mojeubuntu)

`docker push localhost:6677/mojeubuntu` - pushuję obraz z tegiem mojeubuntu na prywatny rejestr

![obraz](https://user-images.githubusercontent.com/53970326/141274172-ce522c4e-7349-4ec7-80cb-2cf1e24f5995.png)


# 2.
1. Tworzę nowy plik z danymi logowania login=login, hasło=pass:

![obraz](https://user-images.githubusercontent.com/53970326/141275866-dea2b148-302e-4ff8-8e2d-d6e098b1fa92.png)


2. Zatrymuję prywatny rejestr:

![obraz](https://user-images.githubusercontent.com/53970326/141275962-0f9a29c3-e662-4442-b681-b2292f1216e0.png)


3. Uruchamiam rejest z konfiguracją:

![obraz](https://user-images.githubusercontent.com/53970326/141277024-5483f3a8-fbe3-47a4-b90e-1a8cb7059c05.png)

Tutaj lepie widać (github zjada slashe na końcu linijek, można wejść w 'Raw' na górze i będzie widać te slashe):
`
> docker run -d \
> -p 6677:5000 \
> --restart=always \
> --name registry1 \
> -v "$(pwd)"/auth:/auth \
> -e "REGISTRY_AUTH=htpasswd" \
> -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
> -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
> registry:2
`

4. Teraz aby zrobić pulla z mojego prywatnego rejestru musze się zalogować `docker login localhost:6677` i podać swoje dane:

`docker login localhost:6677 -u login -p pass`

![obraz](https://user-images.githubusercontent.com/53970326/141363153-392712bb-3ee2-41b9-b4ae-2e8df232cf67.png)

