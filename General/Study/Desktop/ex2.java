import javax.swing.JOptionPane;

public class ex2 {

	public static void main(String[] args) {
		
		// Declara o array nome do tipo string
		String nome[] = new String[5];
		
		
		//Abre um loop que ira se repetir 5 vezes
		for (int i = 0; i < 5; i++) {
			
			// A cada loop é armazenado o valor do Dialog em uma posicao do array
			nome[i] = JOptionPane.showInputDialog("Escreva o nome da pessoa nº " + i);
			
		}
		
		
		//Abre um loop que ira se repetir 5 vezes
		for (int i = 0; i < 5; i++) {
			
			
			// A cada loop é printado Boa noite + o valor que foi inserido em cada posicao
			// do array alimentado no loop anterior
			
			System.out.println("Boa noite, " + nome[i]);
			
		}
		
	}
	
}
