import javax.swing.JOptionPane;

public class ex3 {

	public static void main(String[] args) {
		
		// declara a variavel aux do tipo double
		double aux = 0;
		
		
		// Declara a variavel qtNotas do tipo int e insere o valor do JOptionPane nela
		int qtNotas = Integer.parseInt(JOptionPane.showInputDialog("Quantas notas?"));
		
		
		// Abre um loop que se repetira de acordo com o valor inserido na variavel qtNotas
		for (int i = 0; i < qtNotas; i++) {
			
			// Declara a variavel n1 do tipo double e ira pedir a nota cada vez que acontecer o loop
			double n1 = Double.parseDouble(JOptionPane.showInputDialog("Qual a nota " + (i+1)));
			
			// Alimenta a variavel aux de acordo com o valor inserido na variavel n1
			aux = (aux + n1); 
			
			
			// Faz a verificacao se ele chegou no ultimo loop de acordo com a variavel qtNotas
			if(i == (qtNotas-1) ) {//Inicio if 1
			
				
					
					//Printa o resultado da media dividindo o total da soma das notas inseridas na variavel aux
					// dividindo pela quantidade de notas inseridas na variavel qtNotas
					JOptionPane.showMessageDialog(null, ("Sua media é: " + (aux/qtNotas)));
					
					
				
				
			}// Fim if 1
		}
		
	}
	
}
