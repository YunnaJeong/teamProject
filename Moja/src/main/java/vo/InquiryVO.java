package vo;

import java.util.Date;

public class InquiryVO {

	private int i_id;
	private String i_title;
	private String i_content;
	private String i_answer;
	private Date i_answerDate;
	private Date i_inquiryDate;
	private String i_state;
	private String u_id;
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getI_title() {
		return i_title;
	}
	public void setI_title(String i_title) {
		this.i_title = i_title;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getI_answer() {
		return i_answer;
	}
	public void setI_answer(String i_answer) {
		this.i_answer = i_answer;
	}
	public Date getI_answerDate() {
		return i_answerDate;
	}
	public void setI_answerDate(Date i_answerDate) {
		this.i_answerDate = i_answerDate;
	}
	public Date getI_inquiryDate() {
		return i_inquiryDate;
	}
	public void setI_inquiryDate(Date i_inquiryDate) {
		this.i_inquiryDate = i_inquiryDate;
	}
	public String getI_state() {
		return i_state;
	}
	public void setI_state(String i_state) {
		this.i_state = i_state;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public InquiryVO(int i_id, String i_title, String i_content, String i_answer, Date i_answerDate, Date i_inquiryDate,
			String i_state, String u_id) {
		super();
		this.i_id = i_id;
		this.i_title = i_title;
		this.i_content = i_content;
		this.i_answer = i_answer;
		this.i_answerDate = i_answerDate;
		this.i_inquiryDate = i_inquiryDate;
		this.i_state = i_state;
		this.u_id = u_id;
	}
	public InquiryVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
	

