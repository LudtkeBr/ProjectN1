import javax.swing.JOptionPane;

public class ex6 {

	public static void main(String[] args) {
		
		
		//declara a variavel dia e atribui o valor do JOptionPane
		int dia = Integer.parseInt(JOptionPane.showInputDialog("Digite o numero correspondente ao dia"));
		
		// Usa o comando escolha para tratar o valor da variavel dia
		//OBS: o comando switch precisa do comando break para parar sua execucao e caso nao contanha
		// executará todas as linhas de codigo posteriores até encontrar o comando break
		switch (dia) {
		case 1:
			
		case 2:
			
		case 3:
			
		case 4:
			
		case 5:
		// Comando para printar no console
			System.out.println("Dia de Semana");
			break;
		case 6:
			
		case 7:
		// Comando para printar no console
			System.out.println("Finaleira");
			break;
			
		default:
		// Comando para printar no console
			System.out.println("Num deu");
			break;
		}
		
	}
	
}
