package vo;

import java.util.Date;

public class ReplyVO {
	private int r_id;
	private String r_content;
	private Date r_date;
	private int s_id;
	private String u_id;
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
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
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyVO(int r_id, String r_content, Date r_date, int s_id, String u_id) {
		super();
		this.r_id = r_id;
		this.r_content = r_content;
		this.r_date = r_date;
		this.s_id = s_id;
		this.u_id = u_id;
	}
	
}
