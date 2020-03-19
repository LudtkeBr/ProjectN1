import javax.swing.JOptionPane;


public class aula2_2 {

	public static void main(String[] args) {
		
		String[] nome = new String[2];
		
		double[][] n1 = new double[2][4];
		
		
		//Solicita os nomes
		for (int i = 0; i < 2; i++) {//For 1 open
			
			nome[i] = JOptionPane.showInputDialog("Digite o nome do aluno n° " + (i+1));
			
		}//For 1 close
		
		//--------------------------------Solicita as notas--------------------------------
		
		for (int i = 0; i < 2; i++) {//For 2 open
			
			for (int j = 0; j < 3; j++) {//For 3 open
				
				if (j == 0) {
					
					n1[i][j] = Double.parseDouble(JOptionPane.showInputDialog("Escreva a nota " + (j+1) + " do aluno " + nome[i]));
					
					
				}
				
				if (j == 1) {
					
					n1[i][j] = Double.parseDouble(JOptionPane.showInputDialog("Escreva a nota " + (j+1) + " do aluno " + nome[i]));
					
					
				}
				
				if (j == 2) {
					
					n1[i][j] = Double.parseDouble(JOptionPane.showInputDialog("Escreva a nota " + (j+1) + " do aluno " + nome[i]));
					
					n1[i][j+1] = ((n1[i][j-2] + n1[i][j-1] + n1[i][j])/3);
					
				}
				
				
				
				
				
			}//For 3 close
			
		}//For 2 close
		
		//------------------------Printa as medias e informa se o aluno passou---------------------
		
		
		for (int i = 0; i < 2; i++) {//For 4 open
			
			
			double aux = Math.round(n1[i][3]); 
			
			if (aux >= 6.0) {
			
				JOptionPane.showMessageDialog(null, ("O aluno " + nome[i] + " ficou com a media " + aux + " e passou."));
			
			}
			
			if (aux < 6.0) {
				
				JOptionPane.showMessageDialog(null, ("O aluno " + nome[i] + " ficou com a media " + aux + " e reprovou."));
				
				}
		}//For 4 close
		
	}
	
}
