echo -e "Enter a Sentence \c"
read line

i=0 v=0 j=0

declare -A arr
arr[a]=0
arr[e]=0
arr[i]=0
arr[o]=0
arr[u]=0
distinct_vowels=0


while [ $i -lt ${#line} ];do

	if  echo ${line:$i:1} | grep [aeiouAEIOU] >> NULL ;then 
		
		temp=${line:$i:1}

		if [ ${arr[`echo "${temp,,}"`]} -eq 0 ];then
			arr[${temp,,}]=1
			distinct_vowels=$((distinct_vowels+1))
		fi
		
		v=$((v+1))
	fi
	i=$((i+1))
done

echo "Number of Vowels is $v"
echo "Numer of distinct Vowels is $distinct_vowels"
