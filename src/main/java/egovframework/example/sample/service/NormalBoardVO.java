package egovframework.example.sample.service;

public class NormalBoardVO extends BoardVO  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 게시물id */
	private String norBrdId;
	
	/** 게시물제목 */
	private String postTitle;

	/** 게시물내용 */
	private String postContent;
	
	/** 등록일자 */
	private String regDate;
	
	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getNorBrdId() {
		return norBrdId;
	}

	public void setNorBrdId(String norBrdId) {
		this.norBrdId = norBrdId;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	
}
