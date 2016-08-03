/* 
 * An attempt to build an associative array in c 
 */
typedef struct associative_array{
	char *key;
	char *value;
	struct associative_array *next;
}assoc_array_t;

assoc_array_t* create_assoc_array(void);//returns an pointer to associative_array structure
void insert(assoc_array_t * name_of_array,char *key,char *value);//inserts into structure
char* get(assoc_array_t *name_of_array,char *key);//retrieve from structure

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main(){
	assoc_array_t *age = create_assoc_array();
	assoc_array_t *marks = create_assoc_array();

	insert(age,"Ajax","19");
	insert(age,"JavaScript","20");

	insert(marks,"Brackets","99.87");
	insert(marks,"ADOBE","100");

	printf("Age of Ajax is %s\n",get(age,"Ajax"));
	printf("Age of JavaScript is %s\n",get(age,"JavaScript"));
	printf("Age of PHP is %s\n",get(age,"PHP"));

	printf("Marks of ADOBE is %s\n",get(marks,"ADOBE"));
	printf("Marks of Brackets is %s\n",get(marks,"Brackets"));

	return 0;
}

assoc_array_t* create_assoc_array(void){
	return (assoc_array_t*)malloc(sizeof(assoc_array_t));
}

void insert(assoc_array_t *start,char *key, char *value){
	assoc_array_t *ptr = start;

	while( ptr->next!= NULL ) ptr = ptr->next;

	ptr->key = key;
	ptr->value = value;
	ptr->next = (assoc_array_t*)malloc(sizeof(assoc_array_t));
}
char* get(assoc_array_t *start,char* key){
	assoc_array_t *ptr = start;
	while( ptr->next != NULL ){
		if ( !strcmp(ptr->key,key) ) return ptr->value;
		ptr = ptr->next;
	}
	return NULL;
}
