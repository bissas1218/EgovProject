package egovframework.example.sample.service;

public class BoardVO extends SampleDefaultVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/** 게시판ID */
	private String boardId;
	
	/** 게시판명 */
	private String boardNm;

	/** 게시판타입 */
	private String boardType;
	
	/** 게시글제목 */
	private String postTitle;
	
	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getBoardNm() {
		return boardNm;
	}

	public void setBoardNm(String boardNm) {
		this.boardNm = boardNm;
	}
	
	
}
