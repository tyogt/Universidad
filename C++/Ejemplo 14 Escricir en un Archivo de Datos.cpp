#include<iostream>

using namespace std;

int main(){
	FILE *myText;
	char ch;
	
	myText=fopen("myStory.dat","a");
	
	if(myText == NULL) printf("Error\n");
	else{
		printf("Ingrese un texto a ser almacenado dentro del archivo\n");
		ch= getchar();
		
		while(ch!= '\n'){
			ch= toupper(ch);
			putc(ch, myText);
			ch= getchar();
		}
		fclose(myText);
	}
	
	return 0;
}
