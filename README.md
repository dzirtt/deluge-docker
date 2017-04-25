# Deluge docker build script #
## for auto build on docker hub ##

Run like this. 

```docker run --name deluge_test_1 -p 1113:1113 -p 11961:11961 -v /home/dzirtt/deluge/data:/home/deluge/data -e LOGIN=deluge -e PASSWORD=deluge2 deluge_test```

Do not forget change login:password.
[*]1113 - remote gui
[*]11961 - bittorrent port
