programa
{
	
	funcao inicio()
	{
		escreva("pensar em um numero de 1 ate 8 \n")

		caracter resposta

		escreva("o número é menor que 5? \n :")
		leia(resposta)

		se(resposta == 's') { // 1 até 4
			escreva("O numero é maior que 2? \n")
			leia(resposta)

			se(resposta == 's'){// 3 ou 4 
				escreva("o numero é a raiz quadrada de 16? \n :")
				leia(resposta)
				se(resposta == 's'){ 
					escreva("voce pensou no numero 4! \n")
					}
					senao{ 
						escreva("voce pensou no numero 3! \n")
						}
				}
				senao{// 1 ou 2 
					escreva("o numero é par? \n: ")
					leia(resposta)
					se(resposta =='s'){ 
						escreva("o seu numero é 2! \n")
						}
						senao{ 
							escreva("O seu numero é 1!")
							}
					}
									
				
			}
			senao{ // 5 ate 8 
				escreva("O numero é maior que 6? \n :")
				leia(resposta)
				se(resposta == 's'){// 7 ou 8
					escreva("O numero é multiplo de 4? \n :")
					leia(resposta)
					se(resposta == 's'){ 
						escreva("O numero é 8! \n")
						} 
					   senao{
					   	escreva("o numero é 7!")
					   	}
					}
					senao{// 5 ou 6 
						escreva("o seu numero é a raiz quadrada de 25? \n :")
						leia(resposta)
						se(resposta == 's'){ 
							escreva("o seu numero é 5!")
							}
							senao{ 
								escreva("o seu numero é 6!")
								}
							
						}
				
				}
				 
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 256; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */