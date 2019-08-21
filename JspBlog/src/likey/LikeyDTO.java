package likey;

public class LikeyDTO {

	String userId;
	int boderId;
	String userIp;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getboderId() {
		return boderId;
	}
	public void setboderId(int boderId) {
		this.boderId = boderId;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	
	public LikeyDTO()
	{
		
	}
	
	public LikeyDTO(String userId, int boderId, String userIp) {
		super();
		this.userId = userId;
		this.boderId = boderId;
		this.userIp = userIp;
	}
	
	
}
