package vo;

import java.util.Date;

public class CertiDetailVO {
	private int e_id;
	private String qualgbcd;// 자격구분
	private String qualgbnm;// 자격구분명
	private int seriescd; // 계열코드
	private String seriesnm;// 계열명
	private int jmcd; // 종목코드
	private String jmfldnm;// 종목명
	private int y_id; // 유튜브번호FK
	private String y_url; // 유튜브URL
	private int obligfldcd;// 대직무분야코드
	private String obligfldnm;// 대직무분야명
	private int mdobligfldcd;// 중직무분야코드
	private String mdobligfldnmm;// 중직무분야명
	private String detail; // 상세설명
	private int e_count;
	private String img;
	private int exam_plan_id; // 시험일정ID
	private String description;// 설명
	private Date docRegStartDt;// 필기시험 원서접수 시작일자
	private Date docRegEndDt;// 필기시험 원서접수 종료일자
	private Date docExamDt; // 필기시험 시작일자
	private Date docPassDt;// 필기시험 종료일자
	private Date docSubmitStartDt;// 필기시험 합격자 발표일자
	private Date docSubmitEnDt;// 필기시험 합격자 발표일자
	private Date pracRegStartDt;// 실기,면접 시험 원서접수 시작일자
	private Date pracRegEndDt;// 실기,면접 시험 원서접수 종료일자
	private Date pracExamStartDt;// 실기,면접 시험 시작일자
	private Date pracExamEndDt;// 실기,면접 시험 종료일자
	private Date pracPassDt;// 실기,면접 합격자 발표일자

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public String getQualgbcd() {
		return qualgbcd;
	}

	public void setQualgbcd(String qualgbcd) {
		this.qualgbcd = qualgbcd;
	}

	public String getQualgbnm() {
		return qualgbnm;
	}

	public void setQualgbnm(String qualgbnm) {
		this.qualgbnm = qualgbnm;
	}

	public int getSeriescd() {
		return seriescd;
	}

	public void setSeriescd(int seriescd) {
		this.seriescd = seriescd;
	}

	public String getSeriesnm() {
		return seriesnm;
	}

	public void setSeriesnm(String seriesnm) {
		this.seriesnm = seriesnm;
	}

	public int getJmcd() {
		return jmcd;
	}

	public void setJmcd(int jmcd) {
		this.jmcd = jmcd;
	}

	public String getJmfldnm() {
		return jmfldnm;
	}

	public void setJmfldnm(String jmfldnm) {
		this.jmfldnm = jmfldnm;
	}

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

	public int getObligfldcd() {
		return obligfldcd;
	}

	public void setObligfldcd(int obligfldcd) {
		this.obligfldcd = obligfldcd;
	}

	public String getObligfldnm() {
		return obligfldnm;
	}

	public void setObligfldnm(String obligfldnm) {
		this.obligfldnm = obligfldnm;
	}

	public int getMdobligfldcd() {
		return mdobligfldcd;
	}

	public void setMdobligfldcd(int mdobligfldcd) {
		this.mdobligfldcd = mdobligfldcd;
	}

	public String getMdobligfldnmm() {
		return mdobligfldnmm;
	}

	public void setMdobligfldnmm(String mdobligfldnmm) {
		this.mdobligfldnmm = mdobligfldnmm;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getE_count() {
		return e_count;
	}

	public void setE_count(int e_count) {
		this.e_count = e_count;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

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

	public CertiDetailVO(int e_id, String qualgbcd, String qualgbnm, int seriescd, String seriesnm, int jmcd,
			String jmfldnm, int y_id, String y_url, int obligfldcd, String obligfldnm, int mdobligfldcd,
			String mdobligfldnmm, String detail, int e_count, String img, int exam_plan_id, String description,
			Date docRegStartDt, Date docRegEndDt, Date docExamDt, Date docPassDt, Date docSubmitStartDt,
			Date docSubmitEnDt, Date pracRegStartDt, Date pracRegEndDt, Date pracExamStartDt, Date pracExamEndDt,
			Date pracPassDt) {
		super();
		this.e_id = e_id;
		this.qualgbcd = qualgbcd;
		this.qualgbnm = qualgbnm;
		this.seriescd = seriescd;
		this.seriesnm = seriesnm;
		this.jmcd = jmcd;
		this.jmfldnm = jmfldnm;
		this.y_id = y_id;
		this.y_url = y_url;
		this.obligfldcd = obligfldcd;
		this.obligfldnm = obligfldnm;
		this.mdobligfldcd = mdobligfldcd;
		this.mdobligfldnmm = mdobligfldnmm;
		this.detail = detail;
		this.e_count = e_count;
		this.img = img;
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

	// 시험 디테일
	public CertiDetailVO(int e_id, String qualgbcd, String qualgbnm, int seriescd, String seriesnm, int jmcd,
			String jmfldnm, int y_id, int obligfldcd, String obligfldnm, int mdobligfldcd, String mdobligfldnmm,
			String detail, int e_count, String img) {
		super();
		this.e_id = e_id;
		this.qualgbcd = qualgbcd;
		this.qualgbnm = qualgbnm;
		this.seriescd = seriescd;
		this.seriesnm = seriesnm;
		this.jmcd = jmcd;
		this.jmfldnm = jmfldnm;
		this.y_id = y_id;
		this.obligfldcd = obligfldcd;
		this.obligfldnm = obligfldnm;
		this.mdobligfldcd = mdobligfldcd;
		this.mdobligfldnmm = mdobligfldnmm;
		this.detail = detail;
		this.e_count = e_count;
		this.img = img;
	}

	// 시험 일정
	public CertiDetailVO(int exam_plan_id, String description, Date docRegStartDt, Date docRegEndDt, Date docExamDt,
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

	public CertiDetailVO(String y_url, int e_id) {
		this.y_url = y_url;
		this.e_id = e_id;
	}

	public CertiDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
