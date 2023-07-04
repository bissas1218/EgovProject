package egovframework.example.sample.service;

public class NormalBoardVO {

	/** 게시물id */
	private String norBrdId;
	
	/** 게시판id */
	private String boardId;
	
	/** 게시물제목 */
	private String postTitle;

	/** 게시물내용 */
	private String postContent;
	
	public String getNorBrdId() {
		return norBrdId;
	}

	public void setNorBrdId(String norBrdId) {
		this.norBrdId = norBrdId;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
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
