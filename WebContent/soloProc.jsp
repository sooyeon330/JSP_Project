<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/all.css">
<title>Insert title here</title>
</head>
<body>

<%
	class Album{
		String Albumimg;
//		String num;
		String Album;
		String AlbumId;
		String date;
		ArrayList<String> track = new ArrayList<>();
		
		public Album(String albumimg,  String album, String albumid,  String date, ArrayList<String> track){
			this.Albumimg = albumimg;
//			this.num = num;
			this.Album = album;
			this.AlbumId = albumid;
			this.date = date;
			this.track = track;
		}
	}
%>
<%

	request.setCharacterEncoding("UTF-8");
	String filename = request.getParameter("NAME");
/* 	out.println(filename); */
	
	BufferedReader reader = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/text/solo.txt");
		reader = new BufferedReader(new FileReader(filePath));
		
		ArrayList<Album> album = new ArrayList<>();//전체 앨범을 담을 리스트
		//리스트에 추가 하기 위한 임시 변수들
		String albumimg;
		String albumnum;
		String albumstr; //앨범명을 담을 임시 변수
		String albumid; //앨범 id를 담을 임시변수
		String datestr; //발매일을 담을 임시변수
		String read=""; //파일을 읽어올 변수
		 while((read= reader.readLine())!=null){ //파일의 끝까지 반복
			String[] str = read.split(",");	 //파일에서 ',' 을 기준으로 문자열 추출
			//추출한걸 임시변수에 추가tr[0].coumimg = str[0];
	//		albumnum = str[1];
			albumimg = str[0];
			albumid = str[1];
			albumstr = str[2];
			datestr = str[3];
			
			ArrayList<String> tracklist = new ArrayList<>(); //Album에 추가하기 위한 임시 트랙리스트
			String[] track = str[4].split("/");//파일에서 가져온 트랙리스트를  /를 기준으로 추출
			for(int i=0; i<track.length; i++){ //가져온 길이만큼 반복해 
				if(track[i].charAt(0) == '*'){//타이틀곡이면
					tracklist.add("<b>"+track[i].substring(1,track[i].length())+"</b><br>");//문자열 강조해서 임시리스트에 추가
				}else{
					tracklist.add(track[i]+"<br>");//그냥 임시리스트에 추가
				}	
			}
			
			//임시변수를 이용해 ArrayList<Album>에  추가
			album.add(new Album(albumimg, albumstr,albumid,datestr,tracklist));
		}//while 
%>
<table class="allList">
	<colgroup>
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
	</colgroup>
	<tr>
		<th colspan="2">앨범명</th><th>발매일</th><th>트랙리스트</th>
	</tr>
<%
		//출력
		String imgart="";
		for(int i=1; i< album.size(); i++){ //BOM 때문에 첫라인에서 에러가 나서 파일에 한줄 추가해주고 1부터 시작
			imgart = album.get(i).Albumimg;	
				out.println("<tr id="+imgart+">");
%>
				<td><img class="image" src="img/album/<%=imgart%>.jpg"></td>
				<td><a target="black" href="https://www.melon.com/album/detail.htm?albumId=<%=album.get(i).AlbumId%>">
																							<%=album.get(i).Album%></a></td>
<%		
				out.println("<td>"+album.get(i).date+"</td>");
				out.println("<td class='track'>");
				for(String tracklist:album.get(i).track){ //정확한 값만 추출하기위함
					out.println(tracklist+"<br>");
				}
				out.println("</td>");
				out.println("</tr>");
			}
	}catch(Exception e){
//		out.print("catch");
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