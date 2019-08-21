package user;

public class UserDTO {
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userEmailHash;
	private boolean userEmailChcked;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPASSWD(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public boolean isUserEmailChcked() {
		return userEmailChcked;
	}
	public void setUserEmailChcked(boolean userEmailChcked) {
		this.userEmailChcked = userEmailChcked;
	}
	
	public UserDTO(){
		
	}
	
	public UserDTO(String userId, String userPassword,String userName, String userEmail, String userEmailHash,
			boolean userEmailChcked) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChcked = userEmailChcked;
	}

	
	
}
