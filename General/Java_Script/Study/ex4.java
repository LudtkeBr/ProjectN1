import javax.swing.JOptionPane;

public class ex4 {

	public static void main(String[] args) {
		
		// Declara a variavel senha e atribui o valor do JOptionPane
		String senha = JOptionPane.showInputDialog("Digite sua senha:");
		
		
		// Abre um loop que se repetira 3 vezes
		for (int i = 0; i < 3; i++) {
			
			
			// Declara a variavel confSenha e atribui o valor do JOptionPane
			String confSenha = JOptionPane.showInputDialog("Confirme sua senha:");
			
			
			// Verifica se o valor da variavel senha � igual a variavel confSenha
			if (senha.equals(confSenha)) {
				
				
				// Caso a verificacao retorne verdadeira printa na tela o comando
				JOptionPane.showMessageDialog(null, "Deu boa guriz�o");
				
				// Quebra o loop
				break;
				
			}
			// Caso o valor das variaveis sejam diferentes entra no else
			else {
				
				
				if( i == 2) {
					
				    // Se for a ultima tentativa e o valor for errado printa o comando na tela
					JOptionPane.showMessageDialog(null, "Bloqueou o cart�o seu burro");
				
				}else {
					// Se o valor for errado mas nao for a ultima chance � solicitado uma nova tentativa
					JOptionPane.showMessageDialog(null, "Deu ruim, tenta dnv.");
					
				}
			}
			
		}
		
	}
	
}
