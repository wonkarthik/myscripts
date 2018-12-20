#/bin/bash

# usage ./large_dir.sh /root

#check if user input argument

if [ $# -eq 0 ]; then

#if no argument print next messge and exit from script
echo "Usage: $0 "

exit 1

fi
# Save first arguments to variables
CheckedDir="$1"
#
HeadValue=$2
#set value for variable count value 1
count=1

#just print empty line
echo ""

#Print next message:
echo "Here is the ${HeadValue} biggest directories located in ${CheckedDir}:"

echo ""

#Getting list of directories and space they use.
du -a --max-depth=1 --one-file-system ${CheckedDir}/ |

#next we sort result
sort -rn |

sed "1d" |

# next we get only first X directories
head -"${HeadValue}" |

#next print result to user
while read size dirrr ; do
#counting size in Mb

size="$(( size / 1024 ))"

#show output for user
echo "N°${count} : ${dirrr} is ${size} Mb"

((count++))

done

echo ""
