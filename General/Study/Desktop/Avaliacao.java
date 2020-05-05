package av;

import javax.swing.JOptionPane;

public class Avaliacao {

	public static void main(String[] args) {

		/*
		 * Alunos
		 * 
		 * Matheus Ludtke da Silva
		 * Vinícius Duarte da Silva
		 */		
		exercicio1();
		exercicio2();
		exercicio3();
		exercicio4();

	}
	
	static void exercicio1() {
		
		
		// Define os arrays
		String[] aPrato = {"Vegetariano", "Peixe", "Frango", "Carne"};
		int[] aCaloriaPrato = {180, 230, 250, 350};
		
		String[] aSobremesa = {"Abacaxi", "Sorvete Diet", "Mousse Diet", "Mousse Chocolate"};
		int[] aCaloriaSobremesa = {75, 110, 170, 200};
		
		String[] aBebida = {"Chá", "Suco Laranja", "Suco Melão", "Refri Diet"};
		int[] aCaloriaBebida = {20, 70, 100, 65};
		// Fim da declaracao dos arrays
		
		// Apresenta um JOptionPane com opcoes definidas no array aPrato e insere o resutado escolhido pelo
		// usuario na variavel optionPrato
		int optionPrato = JOptionPane.showOptionDialog(
			null, 
			"Escolha um prato",
            "Exercício 1",
            JOptionPane.DEFAULT_OPTION, 
            JOptionPane.INFORMATION_MESSAGE, 
            null, 
            aPrato, 
            aPrato[0]
        );
		
		// Apresenta um JOptionPane com opcoes definidas no array aSobremesa e insere o resutado escolhido pelo
		// usuario na variavel optionSobremesa
		int optionSobremesa = JOptionPane.showOptionDialog(
				null, 
				"Escolha uma sobremesa",
	            "Exercício 1",
	            JOptionPane.DEFAULT_OPTION, 
	            JOptionPane.INFORMATION_MESSAGE, 
	            null, 
	            aSobremesa, 
	            aSobremesa[0]
	        );
		
		// Apresenta um JOptionPane com opcoes definidas no array aBebida e insere o resutado escolhido pelo
		// usuario na variavel optionBebida
		int optionBebida = JOptionPane.showOptionDialog(
				null, 
				"Escolha uma bebida",
	            "Exercício 1",
	            JOptionPane.DEFAULT_OPTION, 
	            JOptionPane.INFORMATION_MESSAGE, 
	            null, 
	            aBebida, 
	            aBebida[0]
	        );
		
		
		// calcula as calorias conforme os valores das variaveis optionPrato, optionSobremesa e optionBebida que sao utilizados para
		// obter os valores nas posicoes dos arrays aCaloriaPrato, aCaloriaSobremesa e aCaloriaBebida e somar todos.
		int caloria = aCaloriaPrato[optionPrato] + aCaloriaSobremesa[optionSobremesa] + aCaloriaBebida[optionBebida];	
		
		
		// Armazena o texto para ser printado na variavel message
		String message = "Prato selecionado: " + aPrato[optionPrato] + "\n";
		
		message = message + "Sobremesa selecionada: " + aSobremesa[optionSobremesa] + "\n";
		
		message = message + "Bebida selecionada: " + aBebida[optionBebida] + "\n\n";
		
		message = message + "Total Calorias: " + caloria; // Fim do armazenamento de valor na variavel message
		
		
		// Printa em um JOptionPane a variavel message
		JOptionPane.showMessageDialog(null, message);	
	}
	
	static void exercicio2() {
		
		double n1 = Double.parseDouble(JOptionPane.showInputDialog("Insira primeiro número"));
		double n2 = Double.parseDouble(JOptionPane.showInputDialog("Insira segundo número"));
		
		double aux = (n1 + n2);
		double total = (aux * aux);
		
		JOptionPane.showConfirmDialog(null, "O quadrado da soma de: " + n1 + " e " + n2 + " é " + total );
	}
	
	static void exercicio3() {
		double peso = Double.parseDouble(JOptionPane.showInputDialog("Informe o peso:"));
		double altura = Double.parseDouble(JOptionPane.showInputDialog("Informe a altura:"));
		
		double imc = (peso / (altura * altura));
		String situacao;
		
		if (imc < 23) {
			situacao = "Abaixo do peso";
		} else if (imc >= 23 && imc < 35) {
			situacao = "Peso normal";
		} else if (imc >= 35 && imc < 40) {
			situacao = "Sobrepeso";
		} else if (imc >= 40 && imc < 50) {
			situacao = "Obeso";
		} else {
			situacao = "Obeso mórbido";
		}
		
		JOptionPane.showMessageDialog(null, "IMC: " + situacao);
	}
	
	static void exercicio4() {
		
		String[] aJogador = {"Pedra", "Papel", "Tesoura"};
		
		int j1 = JOptionPane.showOptionDialog(
				null, 
				"Vez do jogador 1:",
	            "Exercício 4",
	            JOptionPane.DEFAULT_OPTION, 
	            JOptionPane.INFORMATION_MESSAGE, 
	            null, 
	            aJogador, 
	            aJogador[0]);
		
		int j2 = JOptionPane.showOptionDialog(
				null, 
				"Vez do jogador 2:",
	            "Exercício 4",
	            JOptionPane.DEFAULT_OPTION, 
	            JOptionPane.INFORMATION_MESSAGE, 
	            null, 
	            aJogador, 
	            aJogador[0]);
		
		String message = "";
		
		boolean vitoriaJogador1 = ((j1 == 1 && j2 == 0) || (j1 == 0 && j2 == 2) || (j1 == 2 && j2 == 1));
		boolean vitoriaJogador2 = ((j2 == 1 && j1 == 0) || (j2 == 0 && j1 == 2) || (j2 == 2 && j1 == 1)); 
		
		if (j1 == j2) {			
			 message = "Empate";			
		} else if (vitoriaJogador1) {			
			message = "Jogador 1 venceu!!";			
		} else if (vitoriaJogador2) {			
			message = "Jogador 2 venceu!!";			
		}
		
		JOptionPane.showMessageDialog(null, message);		
	}
}
