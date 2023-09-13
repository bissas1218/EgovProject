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

	/** 수정예약시간 */
	private String updateTime;
	
	/** 홀 */
	private String hole;
	
	/** 수정홀 */
	private String updateHole;
	
	/** 캐디여부 */
	private String caddy;
	
	/** 수정캐디여부 */
	private String updateCaddy;
	
	/** 인원수 */
	private String person;
	
	/** 수정인원수 */
	private String updatePerson;
	
	/** 그린피 */
	private String greenFee;
	
	/** 수정그린피 */
	private String updateGreenFee;
	
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
	
	/** 예약자 id */
	private String reservId;
	
	/** 예약일자 */
	private String reservDate;
	
	/** 관리자, 사용자 유무 */
	private String userType;
	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getReservId() {
		return reservId;
	}

	public void setReservId(String reservId) {
		this.reservId = reservId;
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public String getUpdateHole() {
		return updateHole;
	}

	public void setUpdateHole(String updateHole) {
		this.updateHole = updateHole;
	}

	public String getUpdateCaddy() {
		return updateCaddy;
	}

	public void setUpdateCaddy(String updateCaddy) {
		this.updateCaddy = updateCaddy;
	}

	public String getUpdatePerson() {
		return updatePerson;
	}

	public void setUpdatePerson(String updatePerson) {
		this.updatePerson = updatePerson;
	}

	public String getUpdateGreenFee() {
		return updateGreenFee;
	}

	public void setUpdateGreenFee(String updateGreenFee) {
		this.updateGreenFee = updateGreenFee;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

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
