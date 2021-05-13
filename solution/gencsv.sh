#!/bin/bash

awk 'BEGIN {
      # seed
       srand()
       for (i=1;i<=10;i++){
        print int(1 + rand() * 100)

       }
    }'| awk '{print i++ ","     $0}' > inputFile
