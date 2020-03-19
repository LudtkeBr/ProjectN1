import javax.swing.JOptionPane;

public class ex1 {

	public static void main(String[] args) {
		
		
		
		// Recebe o valor do JOptionPane
		double n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite um número: "));
		
		
		// Abre o loop para printar na tela todos os numeros pares até o numero que foi digitado no JOptionPane
		for (int i = 0; i < n1 ; i++) {
			
			if (i % 2 == 0) {
				
				System.out.println("Numero: " + i);
				
			}
			
		}
		
		
	}
	
}
