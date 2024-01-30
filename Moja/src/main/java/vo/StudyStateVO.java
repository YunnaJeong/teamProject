package vo;

public class StudyStateVO {
	
	private int s_s_id;
	private int s_id;
	private String u_id;
	private int s_s_status;
	public int getS_s_id() {
		return s_s_id;
	}
	public void setS_s_id(int s_s_id) {
		this.s_s_id = s_s_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getS_s_status() {
		return s_s_status;
	}
	public void setS_s_status(int s_s_status) {
		this.s_s_status = s_s_status;
	}
	public StudyStateVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudyStateVO(int s_s_id, int s_id, String u_id, int s_s_status) {
		super();
		this.s_s_id = s_s_id;
		this.s_id = s_id;
		this.u_id = u_id;
		this.s_s_status = s_s_status;
	}
	
	
}
