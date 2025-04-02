import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Main {

	//D[시작][중간] + D[중간][끝] 의 모든 경우를 확인 할 수 있도록 하기
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(in.readLine());
		
		int city = Integer.parseInt(st.nextToken());
		st = new StringTokenizer(in.readLine());
		int bus = Integer.parseInt(st.nextToken());
		
		long[][] distance = new long[city+1][city+1];
		for(int i = 1; i<=city; i++) {
			for (int j =1; j<=city; j++){
				distance[i][j] = Integer.MAX_VALUE;
				if(i == j) distance[i][j] = 0;
			}
		}
		
		for(int i = 0; i<bus; i++) {
			st = new StringTokenizer(in.readLine());
			int s = Integer.parseInt(st.nextToken());
			int e = Integer.parseInt(st.nextToken());
			int price = Integer.parseInt(st.nextToken());
			
			if(distance[s][e]>price) distance[s][e] = price;
		}
		
		for(int k = 1; k<=city; k++) {
			for(int i = 1; i<=city; i++) {
				for(int j = 1; j<=city; j++) {
					if(distance[i][j] > distance[i][k] + distance[k][j]) {
						distance[i][j] = distance[i][k] + distance[k][j];
					}
				}
			}
		}
		
		for(int i = 1; i<=city; i++) {
			for (int j =1; j<=city; j++){
                if(distance[i][j] ==Integer.MAX_VALUE) System.out.print(0 + " ");
                else System.out.print(distance[i][j] + " ");
			}
			System.out.println();
		}
		
		
		
	}

}
