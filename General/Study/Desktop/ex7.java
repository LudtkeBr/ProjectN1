import javax.swing.JOptionPane;

public class ex7 {

	public static void main(String[] args) {
		
		// Exemplo com o escolha totalemente preenchido
		
		int dia = Integer.parseInt(JOptionPane.showInputDialog("Digite o numero correspondente ao dia"));
		
		switch (dia) {
		case 1:
			System.out.println("Segunda");
			break;
		case 2:
			System.out.println("Terça");
			break;
		case 3:
			System.out.println("Quarta");
			break;
		case 4:
			System.out.println("Quinta");
			break;
		case 5:
			System.out.println("Sexta");
			break;
		case 6:
			System.out.println("Sabadou");
			break;
		case 7:
			System.out.println("Domingou");
			break;
			
		default:
			System.out.println("Num deu");
			break;
		}
		
	}
	
}
