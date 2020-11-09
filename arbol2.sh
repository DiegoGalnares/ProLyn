#!/bin/bash

print_(){
    if [ $1 -gt 0 ];then
        echo -n "│"
    fi
    for (( c=0; c<$1; c++ )) do  
        echo -n "  "
    done
    for (( c=1; c<$1; c++ )) do  
        echo -n " "
    done
}
print_dir(){
    for output in $1/*
    do
        if [ -d "$output" ];then
            internal_dir="$output"
            print_ $2
            echo -n "├──"
            echo $output | rev | cut -f1 -d "/" | rev
            suma=$(($2 + 1))
            print_dir $internal_dir $suma
        else
            print_ $2
            echo -n "├──"
            echo $output | rev | cut -f1 -d "/" | rev 
        fi

    done
}
if [ $# -eq 0 ];then
    print_dir $PWD 0
else
    print_dir $1 0
fi
