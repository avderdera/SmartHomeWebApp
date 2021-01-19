package smartHome;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class Users {

	
	@Id	
	@Column(name="name")
	protected String name;
	
	

	@Column(name="password")
	protected String password;
	
	

	public Users() {
		
	}
	
	public Users(String name,String password) {
		super();
		this.name=name;
		this.password=password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
