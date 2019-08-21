package boder;

public class BoderDTO {

	int boderId;
	String userId;
	String bodertitle;
	String bodercontent;
	String dateTime;
	int likeCount;

	public int getBoderId() {
		return boderId;
	}
	public void setBoderId(int boderId) {
		this.boderId = boderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBodertitle() {
		return bodertitle;
	}
	public void setBodertitle(String bodertitle) {
		this.bodertitle = bodertitle;
	}
	public String getBodercontent() {
		return bodercontent;
	}
	public void setBodercontent(String bodercontent) {
		this.bodercontent = bodercontent;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	public BoderDTO () {}
	public BoderDTO(int boderId, String userId, String bodertitle,
			 String bodercontent,String dateTime, int likeCount) {
		super();
		this.boderId = boderId;
		this.userId = userId;
		this.bodertitle = bodertitle;
		this.bodercontent = bodercontent;
		this.dateTime = dateTime;
		this.likeCount = likeCount;
	}
	
	
}
