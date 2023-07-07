package egovframework.example.sample.service;

public class ContentsVO extends SampleDefaultVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 컨텐츠ID */
	private String contentsId;
	
	/** 컨텐츠제목 */
	private String contentsNm;
	
	/** 컨텐츠내용 */
	private String contentsText;
	
	/** 컨텐츠 생성일자 */
	private String regDate;

	public String getContentsId() {
		return contentsId;
	}

	public void setContentsId(String contentsId) {
		this.contentsId = contentsId;
	}

	public String getContentsNm() {
		return contentsNm;
	}

	public void setContentsNm(String contentsNm) {
		this.contentsNm = contentsNm;
	}

	public String getContentsText() {
		return contentsText;
	}

	public void setContentsText(String contentsText) {
		this.contentsText = contentsText;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
