


package MyFlight;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginManager {
private String email;
private String password; 
public LoginManager(String eml, String pass){
	email=eml;
	password=pass;
	System.out.println("pas="+password);
}

public Person login(){
	Person p=null;
		String hash=hashString(password);
		System.out.println(hash);
		Connection con = null;
		Statement st = null;
		boolean success=false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
			st = con.createStatement();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet rs=null;
		String query="SELECT * FROM login WHERE email='"+email+"' AND password='"+hash+"'";
		System.out.println(query);//query checkpoint
		try {
			rs=st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			if(rs.next()){
				 System.out.println("rs="+rs);
				success=true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	String name=null;
	String phone=null;
	int role=0;
	if(success){	
		query="SELECT * FROM user WHERE email='"+email+"'";
		try {
			rs=st.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
				while (rs.next())
				  {
				  name=rs.getString("Name");
				  phone=rs.getString("Phone");
				  role=rs.getInt("role_id");
				  }
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	if(role==1){
		p=new RegisteredUser(email, name, phone, role);		
	}
	else if (role==2){
		p=new AdminUser(email, name, phone, role);
	}
	}
	try {
		con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return p;
}
private String hashString(String cad){
	System.out.println("cad="+cad);
	if(cad==null) 
		return null;
	String hash=null;
	MessageDigest digest;
	try {
		digest = MessageDigest.getInstance("MD5");
		digest.update(cad.getBytes(),0,cad.length());
		hash=new BigInteger(1,digest.digest()).toString(16);
		System.out.println("here");
	} catch (NoSuchAlgorithmException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return hash;

}
public boolean validateEmail(){
	boolean flag=true;
	Connection con = null;
	Statement st = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
		st = con.createStatement();
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
    catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	ResultSet rs=null;
	String query="SELECT * FROM login WHERE email='"+email+"'";
	System.out.println(query);//query checkpoint
	try {
		rs=st.executeQuery(query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 try {
		if(rs.next()){
			 System.out.println("rs="+rs);
			flag=false;
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	return flag;
	
}
public boolean validatePassword(){
		return true;//pending implementation
	
}

public void createLogin(){
	Connection con = null;
	Statement st = null;
	String hash=hashString(password);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/frs","root","");
		st = con.createStatement();
   String sql = "INSERT INTO login VALUES ('"+email+"','"+hash+"')";
		st.executeUpdate(sql);
	
	con.close();

	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
    catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
}
}
