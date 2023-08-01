package egovframework.program.reserve.service;

public class GolfReservVO {

	/** 예약일자 */
	private String date;
	
	/** 골프코스 */
	private String course;
	
	/** 골프코스명 */
	private String courseNm;
	
	/** 예약시간 */
	private String time;

	/** 홀 */
	private String hole;
	
	/** 캐디여부 */
	private String caddy;
	
	/** 인원수 */
	private String person;
	
	/** 그린피 */
	private String greenFee;
	
	/** 부 */
	private String part;
	
	/** 공휴일여부 */
	private String holiDayYn;
	
	/** 예약건수 */
	private String cnt;
	
	/** 시작일 */
	private String srtDate;
	
	/** 종료일 */
	private String endDate;
	
	/** 회원종류 */
	private String memberType;
	
	public String getCourseNm() {
		return courseNm;
	}

	public void setCourseNm(String courseNm) {
		this.courseNm = courseNm;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getSrtDate() {
		return srtDate;
	}

	public void setSrtDate(String srtDate) {
		this.srtDate = srtDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getHoliDayYn() {
		return holiDayYn;
	}

	public void setHoliDayYn(String holiDayYn) {
		this.holiDayYn = holiDayYn;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getHole() {
		return hole;
	}

	public void setHole(String hole) {
		this.hole = hole;
	}

	public String getCaddy() {
		return caddy;
	}

	public void setCaddy(String caddy) {
		this.caddy = caddy;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getGreenFee() {
		return greenFee;
	}

	public void setGreenFee(String greenFee) {
		this.greenFee = greenFee;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
}
