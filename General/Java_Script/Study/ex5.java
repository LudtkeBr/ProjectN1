import javax.swing.JOptionPane;

public class ex5 {

	public static void main(String[] args) {
		
		String senha = JOptionPane.showInputDialog("Digite sua senha:");
		
		for (int i = 0; i < 3; i++) {
			
			String confSenha = JOptionPane.showInputDialog("Confirme sua senha:");
			
			if (senha.equals(confSenha)) {
				
				JOptionPane.showMessageDialog(null, "Deu boa gurizão");
				break;
				
			}else {
				
				if( i == 2) {
					
				
					JOptionPane.showMessageDialog(null, "Bloqueou o cartão seu burro");
				
				}else {
					
					JOptionPane.showMessageDialog(null, "Deu ruim, tenta dnv.");
					
				}
			}
			
		}
		
	}
	
}
