Creation of Script:
vim gencsv.sh

#!/bin/bash
awk 'BEGIN {
      # seed
       srand()
       for (i=1;i<=100000;i++){
        print int(1 + rand() * 100)
       }
    }'| awk '{print i++ ","     $0}' > inputFile

---------

chmod +x gencsv.sh

mkdir -p csvserver/inputdata/

mv inputFile csvserver/inputdata/

---------
Docker CMDs:

docker run --privileged=true -d -v /root/csvserver/inputdata/inputFile:/csvserver/inputdata infracloudio/csvserver:latest

docker exec -it c455bf0d9ff5 /bin/bash

[root@c455bf0d9ff5 csvserver]# netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver

docker stop c455bf0d9ff5

docker rm c455bf0d9ff5
