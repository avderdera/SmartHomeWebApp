package smartHome;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;



/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/")
public class UserServlet extends HttpServlet {
	public UserServlet() {
		super();
	}

	private static final long serialVersionUID = 1L;
	private static int func = 1;
	private static int func1 = 3;
	private static int func2 = 5;
	private static int func3 = 7;
	static String arraytemp[] = new String[24];
	static String arraytemp2[] = new String[24];
	static String arraytemp3[] = new String[24];
	String name="";
	String pass="";
	UserDAL userdal;
	public void init() {
		userdal = new UserDAL();
	}
    
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/insert":
				add(request, response);
				break;
			case "/delete":
				break;
			case "/signup":
				create(request,response);
				break;
			case "/home":
				home(request,response);
				break;	
			case "/history":
				history(request,response);
				break;
			case "/logout":
				logout(request,response);
				break;
			case "/confirm":
				confirm(request,response);
				break;		
			default:
				forward(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void home(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		request.setAttribute("name", name);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
		dispatcher.forward(request, response);
	}
	
	private void history(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Sensors sensor = userdal.getLast();
		//System.out.println(hour); correct 
		List<Sensors> s = userdal.getlastdaysData(sensor);
		//List<Sensors> s2
		System.out.println("print1");
		setarraytemp(s);
		System.out.println("print2");

		for(int i = 0;i < 24; i++) {
			//System.out.println(arraytemp[i]);
		}
		request.setAttribute("name", name);
		RequestDispatcher dispatcher = request.getRequestDispatcher("History.jsp");
		dispatcher.forward(request, response);
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		//add new account
		name = request.getParameter("name");
		pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		Users usr = userdal.getUser(name);
		if(usr==null) {
			if(pass2.equals(pass)) {
				Users user=new Users(name,pass);
				userdal.addUser(user);
				response.sendRedirect("forwad");
			}else {
				String mm= "Passwords dont match.Retry!!!";
				String error="100";
				request.setAttribute("mm", mm);
				request.setAttribute("error", error);
				RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			request.setAttribute("error", "same");
			RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}
	
	private void forward(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Sensors data = userdal.getLast();
		Sensors datab = randomval(data);
		Sensors datac = randomval(data);
		request.setAttribute("data", data);
		request.setAttribute("datab", datab);
		request.setAttribute("datac", datac);
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void confirm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		name = request.getParameter("name");
		pass = request.getParameter("pass");
		Users user = userdal.getUser(name);
		if(user!=null) {
			if(user.getPassword().equals(pass)){
				// forward to next page Home
				System.out.println("okk");
				Sensors data = userdal.getLast();
				Sensors datab = randomval(data);
				Sensors datac = randomval(data);
				request.setAttribute("data", data);
				request.setAttribute("datab", datab);
				request.setAttribute("datac", datac);
				request.setAttribute("name", name);
				System.out.println("Temp:"+data.getTemp());
				RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
				dispatcher.forward(request, response);
			}else {
				// wrong password
				String error = "10";
				request.setAttribute("error", error);
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			//user doesnt exist
			String out= "77";
			request.setAttribute("output", out);
			request.setAttribute("name", name);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	
	/*
	public Sensors randomval (Sensors data) {
		DecimalFormat numberFormat = new DecimalFormat("#.00");
		double a  = Math.random()*(2-0+1)+0;
		int tempe = Integer.parseInt(data.getTemp())+(int)a;
		int humidity = Integer.parseInt(data.getHumid())+(int)a;
		int pressures = Integer.parseInt(data.getPressure())+(int)a;
		int airq = Integer.parseInt(data.getAirquality())+(int)a;
		int luxs = Integer.parseInt(data.getLux())+(int)a;
		
		String temp = String.valueOf(tempe);
		String humid = String.valueOf(humidity);
		String pressure = String.valueOf(pressures);
		String air = String.valueOf(airq);
		String lux =String.valueOf(luxs);
		
		Sensors datamod = new Sensors (temp,humid,pressure,air,lux,0);
		return datamod;
	}
	*/
	public Sensors randomval (Sensors data) {
        DecimalFormat numberFormat = new DecimalFormat("#.00");
        double a = Math.random()*(2-0+1)+0;
        int tempe = (int)Float.parseFloat(data.getTemp())+(int)a;
        
        int humidity = Integer.parseInt(data.getHumid())+(int)a;
        int pressures = (int)Float.parseFloat(data.getPressure())+(int)a;
        int airq = (int)Float.parseFloat(data.getAirquality())+(int)a;
        int luxs = Integer.parseInt(data.getLux())+(int)a;

        String temp = String.valueOf(tempe);
        String humid = String.valueOf(humidity);
        String pressure = String.valueOf(pressures);
        String air = String.valueOf(airq);
        String lux =String.valueOf(luxs);

        Sensors datamod = new Sensors (temp,humid,pressure,air,lux,0);
        return datamod;
    }
	/*
	public String getstr() {
		System.out.println("it worked !!!");
		UserDAL userd=new UserDAL();
		Sensors s = userd.getLast();
		//XStream xstream = new XStream();
		//String xml=xstream.toXML(s);
		String xml= s.getHumid() +" "+ s.getLux();
		System.out.println(xml);
		return xml;
	}*/

	public int randomtemp (String temp) {
		DecimalFormat numberFormat = new DecimalFormat("#.00");
		double a = Math.random()*(2-0+1)+0;
		System.out.println(temp);
		int t = (int)Float.parseFloat(temp)+(int)a;
		//String te = numberFormat.format(t);
		
		return t;
	}
	
	public void setarraytemp (List<Sensors> sublist) {
		DecimalFormat numberFormat = new DecimalFormat("#.00");
		for (int i=0;i<24;i++) {
			int sum=0;
			int sum2 =0;
			int sum3 =0;
			int frequency=0;
			for (Sensors s: sublist) {
				int hour =Integer.parseInt(s.getTs().substring(s.getTs().length() -8,s.getTs().length()-6));
				if (i==hour) {
					//System.out.println("print sum");
					sum=sum +randomtemp(s.getTemp());
					//System.out.println("print sum1");
					sum2=sum2+(randomtemp(s.getTemp()));
					sum3=sum3+(randomtemp(s.getTemp()));
					frequency++;
				}
			} //end of inner for loop
			
			
			if (frequency!= 0) {
				String result =String.valueOf(sum/frequency);
				String result2 =String.valueOf(sum2/frequency);
				String result3 =String.valueOf(sum3/frequency);
				arraytemp[i]= result;
				arraytemp2[i] =result2;
				arraytemp3[i] =result3;
			}else {
				arraytemp[i]="0";
				arraytemp2[i]="0";
				arraytemp3[i]="0";
			}
		} // end of outer for loop	
	}
	
	public String[] getarraytemp() {
		return arraytemp;
	}
	public String[] getarraytemp2() {
		return arraytemp2;
	}
	public String[] getarraytemp3() {
		return arraytemp3;
	}

	public void pyFile(int h) {
		System.out.println("it worked !!!");
		System.out.println("pyFile a="+h);
		pyth m = new pyth();
		if(h == 0) {
			System.out.println("if 0");
			if(func == 1) {
				func=0;
				pyth.main(0);
			}
			else if(func == 0) {
				func = 1;
				pyth.main(1);
			}
			
		}else if(h == 1) {
			System.out.println("if 1");
			if(func1 == 3) {
				func1=2;
				pyth.main(2);
			}
			else if(func1 == 2) {
				func1 = 3;
				pyth.main(3);
			}
			
		}else if(h == 2) {
			System.out.println("if 2");
			if(func2 == 5) {
				func2 = 4;
				pyth.main(4);
			}
			else if(func2 == 4) {
				func2 = 5;
				pyth.main(5);
			}
			
		}else if(h == 3) {
			System.out.println("if 3");
			if(func3 == 7) {
				func3 = 6;
				pyth.main(6);
			}
			else if(func3 == 6) {
				func3 = 7;
				pyth.main(7);
			}
		}
		
		
	}
	
}

