package MyFlight;

public class RegisteredUser extends Person{
	public RegisteredUser(String eml, String nam, String phone, int rol){
		super(eml, nam, phone, rol);
		
	}
	public int getRole(){
		return 1;
		
	}
	//implements book methods. 
}
