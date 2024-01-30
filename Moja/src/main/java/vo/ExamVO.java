package vo;

public class ExamVO {
	private int e_id;
	private String qualgbcd;//자격구분
	private String qualgbnm;//자격구분명
	private int seriescd; //계열코드
	private String seriesnm;//계열명
	private int jmcd; //종목코드
	private String jmfldnm;//종목명
	private int y_id; //유튜브번호FK
	private int obligfldcd;//대직무분야코드
	private String obligfldnm;//대직무분야명
	private int mdobligfldcd;//중직무분야코드
	private String mdobligfldnm;//중직무분야명
	private String detail; //상세설명
	private int e_count;


	private String img;
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
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
	public String getMdobligfldnm() {
		return mdobligfldnm;
	}
	public void setMdobligfldnm(String mdobligfldnm) {
		this.mdobligfldnm = mdobligfldnm;
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
	

	public ExamVO(int e_id, String qualgbcd, String qualgbnm, int seriescd, String seriesnm, int jmcd, String jmfldnm,
			int y_id, int obligfldcd, String obligfldnm, int mdobligfldcd, String mdobligfldnm, String detail,
			int e_count) {
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
		this.mdobligfldnm = mdobligfldnm;
		this.detail = detail;
		this.e_count = e_count;
	}
	public ExamVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	public ExamVO(int e_id, String qualgbcd, String qualgbnm, int seriescd, String seriesnm, int jmcd, String jmfldnm,
			int y_id, int obligfldcd, String obligfldnm, int mdobligfldcd, String mdobligfldnm, String detail,
			int e_count, String img) {
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
		this.mdobligfldnm = mdobligfldnm;
		this.detail = detail;
		this.e_count = e_count;
		this.img = img;
	}

	
	
	
}