#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>

/*
 * This variable will keep track of
 * number of tokens
 */
int _index;

/*
 * This function returns substring.
 */
char* substr(char* str,int beg,int end){
      char *temp = (char*)malloc(sizeof(char) * (end - beg + 1));
      int ii = 0;
      for(int i = beg;i <= end;i++)
            temp[ii++] = str[i];
      temp[ii] = '\0';
      return temp;
}

/*
 * This function cheks whether a character is
 * delimiter or not
 */
bool is_it_a_delimeter(char *del,char ch){
	for(int i = 0; i < strlen(del); i++)
		if ( del[i] == ch )
			return true;
	return false;
}

/*
 * This function splits the main string upon a string of
 * delimeter characters and returns an array of
 * tokens.
 */
char** split(char* expr,char *del){
      int i = 0;
      char **array = (char**)malloc(sizeof(char*)*20);
      while( i < strlen(expr) ) {
            if ( is_it_a_delimeter(del,expr[i]) ) {
            
            	if( i > 0 ){
            		/*
            		 * Add token iff the delimeter character 
            		 * is not at the begining
            		 */
            		array[_index++] = substr(expr,0, i - 1);
            	}
            	/*
            	 * Extract the remaining part
            	 */
                expr = substr(expr,i + 1,strlen(expr));
                /*
                 * Start From beginning
                 */
              	i = 0;
            }
            else
                  i++;
      }
      array[_index] = substr(expr,0, i - 1);
      _index++;
      return array;
}
int main(){
	char **array = split("1 + 2 * 3 / 4 - 5","+*/- ");
	for(int i = 0; i < _index;i++)
		printf("%s\n",array[i]);
}
