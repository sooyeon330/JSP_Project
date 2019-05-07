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
	class Song{
		String num;
		String Album;
		String AlbumId;
		String date;
		ArrayList<String> track = new ArrayList<>();
		
		public Song(String num, String album, String albumid,  String date, ArrayList<String> track){
			this.num = num;
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
		String filePath = application.getRealPath("/WEB-INF/text/sleep.txt");
		reader = new BufferedReader(new FileReader(filePath));
		
		ArrayList<Song> song = new ArrayList<>();//전체 앨범을 담을 리스트
		//리스트에 추가 하기 위한 임시 변수들
		String albumnum;
		String albumstr; //앨범명을 담을 임시 변수
		String albumid; //앨범 id를 담을 임시변수
		String datestr; //발매일을 담을 임시변수
		String read=""; //파일을 읽어올 변수
		 while((read= reader.readLine())!=null){ //파일의 끝까지 반복
			String[] str = read.split(",");	 //파일에서 ',' 을 기준으로 문자열 추출
			//추출한걸 임시변수에 추가
			albumnum = str[0];
			albumid = str[1];
			albumstr = str[2];
			datestr = str[3];
			
			ArrayList<String> tracklist = new ArrayList<>(); //Song에 추가하기 위한 임시 트랙리스트
			String[] track = str[4].split("/");//파일에서 가져온 트랙리스트를  /를 기준으로 추출
			for(int i=0; i<track.length; i++){ //가져온 길이만큼 반복해 
				if(track[i].charAt(0) == '*'){//타이틀곡이면
					tracklist.add("<b>"+track[i].substring(1,track[i].length())+"</b><br>");//문자열 강조해서 임시리스트에 추가
				}else{
					tracklist.add(track[i]+"<br>");//그냥 임시리스트에 추가
				}	
			}
			
			//임시변수를 이용해 ArrayList<Song>에  추가
			song.add(new Song(albumnum, albumstr,albumid,datestr,tracklist));
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
		String imgatr="";
		String nullchk="";
//		String albumId = "";
		for(int i=0; i< song.size(); i++){
			albumnum = song.get(i).num.toString();
//			out.println(tmp+","+albumArt(tmp)+"<br>");
			imgatr = albumArt(albumnum);
//			albumId = albumId(albumnum);
			if(imgatr!=null){ //이유는 모르겠지만..첫번째 데이터가 null값이 넘겨져서... null이 아닐때만 tr생성..하는걸로..				
				out.println("<tr id="+albumnum+">");%>
				<td><img class="image" src="img/album/<%=imgatr%>"></td>
				<td><a target="black" href="https://www.melon.com/album/detail.htm?albumId=<%=song.get(i).AlbumId%>"><%=song.get(i).Album%></a></td>
	<%		//	out.println("<td><a href="+song.get(i).Album+"</td>");
				out.println("<td>"+song.get(i).date+"</td>");
				out.println("<td class='track'>");
				for(String tracklist:song.get(i).track){ //정확한 값만 추출하기위함
					out.println(tracklist+"<br>");
				}
				out.println("</td>");
				out.println("</tr>");
			}else{
			//	out.print("null"); 
			//	i--; //이거하면 에러낭..
			}
		}
	}catch(Exception e){
		out.print("catch");
		e.printStackTrace();
	}finally{
		/* reader.close(); */
	}
%>
<%!
	String albumArt(String albumnum){
		String str=null;
		switch(albumnum){
		case "1": str = "mini1.jpg"; break;
		case "2": str = "mini2.jpg"; break;
		case "3": str = "mini3.jpg"; break;
		case "4": str = "mini4.jpg"; break;
		case "5": str = "mini5.jpg"; break;
		case "6": str = "mini6.jpg"; break;
		case "7": str = "mini7.jpg"; break;
		case "8": str = "mini8.jpg"; break;
		case "9": str = "mini9.jpg"; break;
		case "10": str = "mini10.jpg"; break;
		case "11": str = "mini11.jpg"; break;
		case "12": str = "mini12.jpg"; break;
		case "j1": str = "jung1.jpg"; break;
		case "j2": str = "jung2.jpg"; break;
		case "Big_wave": str = "Big_wave.jpg"; break;
		case "Mark": str = "Mark.jpg"; break;
		case "pob4": str = "pob4.jpg"; break;
		case "spoiler": str = "spoiler.jpg"; break;
		case "HUTAJONE": str = "HUTAHONE.jpg"; break;
		}
		return str;
	}
/*
	String albumId(String albumnum){
		String str=null;
		switch(albumnum){
		case "1": str = "2104986"; break;
		case "2": str = "2149892"; break;
		case "3": str = "2200239"; break;
		case "4": str = "2233451"; break;
		case "5": str = "2283301"; break;
		case "6": str = "2293456"; break;
		case "7": str = "2644202"; break;
		case "8": str = "2675661"; break;
		case "9": str = "10012901"; break;
		case "10": str = "10041603"; break;
		case "11": str = "10175106"; break;
		case "j1": str = "2326467"; break;
		case "j2": str = "10102658"; break;
		case "s1": str = "10215293"; break;
		}
		return str;
	}
*/
%>

</table>
</body>
</html>