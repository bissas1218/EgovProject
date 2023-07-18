package egovframework.user.service;

import org.springframework.web.multipart.MultipartFile;

public class VideoBoardVO {

	/** 사진id */
	private String videoId;
	
	/** 저장파일명 */
	private String saveNm;
	
	/** 파일타입 */
	private String type;
	
	/** 파일사이즈 */
	private long size;
	
	/** 실제파일명 */
	private String realNm;
	
	/** 저장경로 */
	private String savePath;
	
	/** 제목 */
	private String title;
	
	/** 사진설명 */
	private String descr;

	/** 게시판ID */
	private String boardId;
	
	/** 첨부파일 */
	private MultipartFile multipartFile;
	
	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public String getSaveNm() {
		return saveNm;
	}

	public void setSaveNm(String saveNm) {
		this.saveNm = saveNm;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getRealNm() {
		return realNm;
	}

	public void setRealNm(String realNm) {
		this.realNm = realNm;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	
}
