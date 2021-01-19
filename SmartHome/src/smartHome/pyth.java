package smartHome;
import java.io.*;
import java.nio.charset.StandardCharsets;

public class pyth{
	public pyth() {}
public static void main(int a){
	try{
		System.out.println("Atry");

		System.out.println("pyth.java a="+a);
		
	if(a==0) {
		Process p1 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\switch1_on.py");
		p1.waitFor();
	}
	else if(a==1) {
		Process p2 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\switch1_off.py");
		p2.waitFor();
	}
	else if(a==2) {
		Process p3 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\switch2_on.py");
		p3.waitFor();
	}
	else if(a==3) {
		Process p4 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\switch2_off.py");
		p4.waitFor();
	}
	else if(a==4) {
		Process p5 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\switch3_on.py");
		p5.waitFor();
	}
	else if(a==5) {
		Process p6 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\switch3_off.py");
		p6.waitFor();
	}
	else if(a==6) {
		Process p7 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\auto_on.py");
		p7.waitFor();
	}
	else if(a==7) {
		Process p8 = Runtime.getRuntime().exec("python C:\\Users\\avder\\eclipse-workspace\\smartHome\\auto_off.py");
		p8.waitFor();
	}
	
	

	}
	catch(Exception e){
		e.printStackTrace();
	}
}
}