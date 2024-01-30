package vo;

import java.util.Date;

public class StudyVO {

	private int s_id;
	private String s_title;
	private String s_content;
	private Date s_date;
	private String s_state;
	private String u_id;
	private int e_id;
	private String exam_name;
	private int s_count;
	private int replyCount;
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public String getS_state() {
		return s_state;
	}
	public void setS_state(String s_state) {
		this.s_state = s_state;
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
	public String getExam_name() {
		return exam_name;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public StudyVO(int s_id, String s_title, String s_content, Date s_date, String s_state, String u_id,
			String exam_name, int s_count, int replyCount) {
		super();
		this.s_id = s_id;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_date = s_date;
		this.s_state = s_state;
		this.u_id = u_id;
		this.exam_name = exam_name;
		this.s_count = s_count;
		this.replyCount = replyCount;
	}
	public StudyVO(int s_id, String s_title, String s_content, Date s_date, String s_state, String u_id,
			String exam_name, int s_count) {
		super();
		this.s_id = s_id;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_date = s_date;
		this.s_state = s_state;
		this.u_id = u_id;
		this.exam_name = exam_name;
		this.s_count = s_count;
	}
	public StudyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudyVO(int s_id, String s_title, String s_content, Date s_date, String s_state, String u_id,
			String exam_name) {
		super();
		this.s_id = s_id;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_date = s_date;
		this.s_state = s_state;
		this.u_id = u_id;
		this.exam_name = exam_name;
	}
	public StudyVO(int s_id, String s_title, String s_content, Date s_date, String s_state, String u_id) {
		super();
		this.s_id = s_id;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_date = s_date;
		this.s_state = s_state;
		this.u_id = u_id;
	}
	
	
	
}