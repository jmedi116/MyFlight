package MyFlight;

public class AdminUser extends RegisteredUser{
	public AdminUser(String eml, String nam, String phone, int rol){
		super(eml, nam, phone, rol);
		
	}
	public int getRole(){
		return 2;//override 
		
	}

}
