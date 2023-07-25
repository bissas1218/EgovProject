package egovframework.example.sample.service;

public class ScheduleVO {

	/** 스케쥴 id */
	private String id;
	
	/** 날짜 */
	private String sDate;
	
	/** 제목 */
	private String title;

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
