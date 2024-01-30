package vo;

import java.util.Date;

public class ExamPlanVO {
	private int exam_plan_id; //시험일정ID
	private String description;//설명
	private Date docRegStartDt ;//필기시험 원서접수 시작일자
	private Date docRegEndDt;//필기시험 원서접수 종료일자
	private Date docExamDt; //필기시험 시작일자
	private Date docPassDt;//필기시험 종료일자
	private Date docSubmitStartDt;//필기시험 합격자 발표일자
	private Date docSubmitEnDt;//필기시험 합격자 발표일자
	private Date pracRegStartDt;//실기,면접 시험 원서접수 시작일자
	private Date pracRegEndDt;//실기,면접 시험 원서접수 종료일자
	private Date pracExamStartDt;//실기,면접 시험 시작일자
	private Date pracExamEndDt;//실기,면접 시험 종료일자
	private Date pracPassDt;//실기,면접 합격자 발표일자
	public int getExam_plan_id() {
		return exam_plan_id;
	}
	public void setExam_plan_id(int exam_plan_id) {
		this.exam_plan_id = exam_plan_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDocRegStartDt() {
		return docRegStartDt;
	}
	public void setDocRegStartDt(Date docRegStartDt) {
		this.docRegStartDt = docRegStartDt;
	}
	public Date getDocRegEndDt() {
		return docRegEndDt;
	}
	public void setDocRegEndDt(Date docRegEndDt) {
		this.docRegEndDt = docRegEndDt;
	}
	public Date getDocExamDt() {
		return docExamDt;
	}
	public void setDocExamDt(Date docExamDt) {
		this.docExamDt = docExamDt;
	}
	public Date getDocPassDt() {
		return docPassDt;
	}
	public void setDocPassDt(Date docPassDt) {
		this.docPassDt = docPassDt;
	}
	public Date getDocSubmitStartDt() {
		return docSubmitStartDt;
	}
	public void setDocSubmitStartDt(Date docSubmitStartDt) {
		this.docSubmitStartDt = docSubmitStartDt;
	}
	public Date getDocSubmitEnDt() {
		return docSubmitEnDt;
	}
	public void setDocSubmitEnDt(Date docSubmitEnDt) {
		this.docSubmitEnDt = docSubmitEnDt;
	}
	public Date getPracRegStartDt() {
		return pracRegStartDt;
	}
	public void setPracRegStartDt(Date pracRegStartDt) {
		this.pracRegStartDt = pracRegStartDt;
	}
	public Date getPracRegEndDt() {
		return pracRegEndDt;
	}
	public void setPracRegEndDt(Date pracRegEndDt) {
		this.pracRegEndDt = pracRegEndDt;
	}
	public Date getPracExamStartDt() {
		return pracExamStartDt;
	}
	public void setPracExamStartDt(Date pracExamStartDt) {
		this.pracExamStartDt = pracExamStartDt;
	}
	public Date getPracExamEndDt() {
		return pracExamEndDt;
	}
	public void setPracExamEndDt(Date pracExamEndDt) {
		this.pracExamEndDt = pracExamEndDt;
	}
	public Date getPracPassDt() {
		return pracPassDt;
	}
	public void setPracPassDt(Date pracPassDt) {
		this.pracPassDt = pracPassDt;
	}
	public ExamPlanVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExamPlanVO(int exam_plan_id, String description, Date docRegStartDt, Date docRegEndDt, Date docExamDt,
			Date docPassDt, Date docSubmitStartDt, Date docSubmitEnDt, Date pracRegStartDt, Date pracRegEndDt,
			Date pracExamStartDt, Date pracExamEndDt, Date pracPassDt) {
		super();
		this.exam_plan_id = exam_plan_id;
		this.description = description;
		this.docRegStartDt = docRegStartDt;
		this.docRegEndDt = docRegEndDt;
		this.docExamDt = docExamDt;
		this.docPassDt = docPassDt;
		this.docSubmitStartDt = docSubmitStartDt;
		this.docSubmitEnDt = docSubmitEnDt;
		this.pracRegStartDt = pracRegStartDt;
		this.pracRegEndDt = pracRegEndDt;
		this.pracExamStartDt = pracExamStartDt;
		this.pracExamEndDt = pracExamEndDt;
		this.pracPassDt = pracPassDt;
	}
}
	
