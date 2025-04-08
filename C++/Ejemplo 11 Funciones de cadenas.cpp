#include <iostream>
#include <string.h>
#include <stdio.h>

using namespace std;

int main (){
	
	int i, m=0, t=0, min=0;
	char frase[32];
	
	cout<<"Ingrese una frase: ";
	gets(frase);
	t=strlen(frase);

	for (int r=0;r<t;r++){
		if(isupper(frase[r]))
		m++;
		if(islower(frase[r]))
		min++;
	}

	cout<<"\nLa frase tiene: "<<m<<" letras mayusculas";
	cout<<" "<<min<<" Letras minusculas.";

	return 0;
}
