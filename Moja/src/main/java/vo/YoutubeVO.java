package vo;

public class YoutubeVO {

	private int y_id;
	private String y_url;
	public int getY_id() {
		return y_id;
	}
	public void setY_id(int y_id) {
		this.y_id = y_id;
	}
	public String getY_url() {
		return y_url;
	}
	public void setY_url(String y_url) {
		this.y_url = y_url;
	}
	public YoutubeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public YoutubeVO(int y_id, String y_url) {
		super();
		this.y_id = y_id;
		this.y_url = y_url;
	}
	
	
}
