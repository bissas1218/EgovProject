package egovframework.example.sample.service;

public class ScheduleVO {

	/** 스케쥴 id */
	private String id;
	
	/** 날짜 */
	private String sDate;
	
	/** 제목 */
	private String title;

	/** 건수 */
	private String cnt;
	
	/** 조회시작일 */
	private String srtDate;
	
	/** 조회종료일 */
	private String endDate;
	
	/** 일정시작시간 */
	private String srtTime;
	
	/** 일정종료시간 */
	private String endTime;
	
	/** 공휴일여부 */
	private String holiDayYn;
	
	public String getHoliDayYn() {
		return holiDayYn;
	}

	public void setHoliDayYn(String holiDayYn) {
		this.holiDayYn = holiDayYn;
	}

	public String getSrtTime() {
		return srtTime;
	}

	public void setSrtTime(String srtTime) {
		this.srtTime = srtTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
