import javax.swing.JOptionPane;

public class ex8 {

	public static void main(String[] args) {
		
		
		// declara as variaveis e atribui seus valores de acordo com o JOptionPane
		double n1 = Integer.parseInt(JOptionPane.showInputDialog("Escolha o primiro numero:"));
		double n2 = Integer.parseInt(JOptionPane.showInputDialog("Escolha o segundo numero:"));
		String opera = JOptionPane.showInputDialog("Escolha a operacao:");
		
		
		// Comando escolha para o valor inserido na variavel opera
		switch (opera) {
			
			// Executa caso o valor de opera seja +
		case "+":
			// Comando que printa na tela
			System.out.println("Resultado é: " + (n1+n2));
			
			// Comando que quebra o switch
			break;
		
			// Executa caso o valor de opera seja -
		case "-":
		
		// Comando que printa na tela
			System.out.println("Resultado é: " + (n1-n2));
			
			// Comando que quebra o switch
			break;
			
			// Executa caso o valor de opera seja *
		case "*":
		
		// Comando que printa na tela
			System.out.println("Resultado é: " + (n1*n2));
			
			// Comando que quebra o switch
			break;
			
			// Executa caso o valor de opera seja /
		case "/":
		
		// Comando que printa na tela
			System.out.println("Resultado é: " + (n1/n2));
			
			// Comando que quebra o switch
			break;
		
		// Valor defaut que executa caso o resultado nao esteja em nenhum case do switch
		default:
		
		// Comando que printa na tela
			System.out.println("Deu ruim!!!!");
			
			// Comando que quebra o switch
			break;
		}
		
		
		
	}
	
}
