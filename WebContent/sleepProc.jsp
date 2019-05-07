<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/sleep.css">
<title>Insert title here</title>
</head>
<body>

<%
	class Song{
		String Albumimg;
		String Album;
		String AlbumId;
		String date;
		String song;
		
		public Song(String albumimg,  String album, String albumid,  String date, String song){
			this.Albumimg = albumimg;
			this.Album = album;
			this.AlbumId = albumid;
			this.date = date;
			this.song = song;
		}
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String filename = request.getParameter("NAME");
/* 	out.println(filename); */
	
	BufferedReader reader = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/text/sleep.txt");
		reader = new BufferedReader(new FileReader(filePath));
		
		ArrayList<Song> song = new ArrayList<>();//전체 앨범을 담을 리스트
		//리스트에 추가 하기 위한 임시 변수들
		String albumnum;
		String albumstr; //앨범명을 담을 임시 변수
		String albumid; //앨범 id를 담을 임시변수
		String datestr; //발매일을 담을 임시변수
		String songstr;
		String read=""; //파일을 읽어올 변수
		 while((read= reader.readLine())!=null){ //파일의 끝까지 반복
			String[] str = read.split(",");	 //파일에서 ',' 을 기준으로 문자열 추출
			//추출한걸 임시변수에 추가
			albumnum = str[0];
			albumid = str[1];
			albumstr = str[2];
			datestr = str[3];
			songstr = str[4];
			
			//임시변수를 이용해 ArrayList<Song>에  추가
			song.add(new Song(albumnum, albumstr,albumid,datestr,songstr));
		}//while 
%>
<table class="sleepList">
<!-- 
	<colgroup>
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
	</colgroup>
	 -->
<!-- 	
	<tr>
		<th colspan="2">앨범명</th><th>발매일</th><th>트랙리스트</th>
	</tr>
 -->
<%
		//출력
		String imgart="";
			for(int i=1; i< song.size(); i++){ //BOM 때문에 첫라인에서 에러가 나서 파일에 한줄 추가해주고 1부터 시작
				imgart = song.get(i).Albumimg;	
					out.println("<tr id="+imgart+">");
%>
			<td class="imgtd"><img class="image" src="img/album/<%=imgart%>.jpg"></td>
			<td class="songtd"><%=song.get(i).song%></td>
			<td><%=song.get(i).date%></td>
			<td><a title="앨범정보보기" target="black" href="https://www.melon.com/album/detail.htm?albumId=<%=song.get(i).AlbumId%>">
																						<%=song.get(i).Album%></a></td>
<%		
			/* out.println("<td>"+song.get(i).date+"</td>");
			out.println("<td class='track'>"+song.get(i).song+"</td>");
			out.println("</tr>"); */
			}
		}catch(Exception e){
		//out.print("catch");
		e.printStackTrace();
		}finally{
		/* reader.close(); */
		}
%>
<%!

%>

</table>
</body>
</html>