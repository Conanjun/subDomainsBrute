# Author: Conan0xff
# Function: translate the scan result file of subdomainbrute to ip_file or host_file
# Date: 2018/1/14
if [ $# -ne 3 ]
then
    echo "usage: ./translate_result.sh ipfile resultfile type[ip/host]"
    exit 0
else
    filename=$1
    savefile=$2
    if [ "$3"x = "ip"x ]
    then
        #实现ip排序
        awk '{for(i=2;i<=NF;i++){sub(/,/,"",$i);print $i}}' $filename | sort -k1,1n -k2,2n -k3,3n -k4,4n > $savefile
        echo "save ip to $savefile successfully."
    elif [ "$3"x = "host"x ]
    then
        awk '{print $1}' $filename | sort > $savefile
        echo "save host to $savefile successfully."
    else
        echo "wrong type"
        exit 1
    fi
fi

