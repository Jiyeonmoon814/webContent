package kr.or.bit.dto;
/*
create table memo(
	id varchar2(15) not null,
	email varchar2(20) not null,
	content varchar2(100)
);
*/
public class memo {
     private String id;
     private String email;
     private String content;
     
     //생성자 (편의)
     public memo() {}
     
     public memo(String id, String email, String content) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
	}




	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "memo [id=" + id + ", email=" + email + ", content=" + content + "]";
	}
     
     
     
}
