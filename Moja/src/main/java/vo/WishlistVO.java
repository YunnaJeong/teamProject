package vo;

public class WishlistVO {
	private int w_id;
	private String u_id;
	private int e_id;
	
	public int getW_id() {
		return w_id;
	}
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	
	public WishlistVO(int w_id, String u_id, int e_id) {
		super();
		this.w_id = w_id;
		this.u_id = u_id;
		this.e_id = e_id;
	}
	
	public WishlistVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
