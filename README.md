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
	
chmod +x gencsv.sh

mkdir -p csvserver/inputdata/

mv inputFile csvserver/inputdata/
