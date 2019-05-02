<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	class Song{
		String Album;
		String date;
		ArrayList<String> track = new ArrayList<>();
		
		public Song(String album, String date){
			this.Album = album;
			this.date = date;
			
		}
		public Song(String album,  String date, ArrayList<String> track){
			this.Album = album;
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
		String filePath = application.getRealPath("/WEB-INF/text/all.txt");
		reader = new BufferedReader(new FileReader(filePath));
		
		ArrayList<Song> song = new ArrayList<>();//전체 앨범을 담을 리스트
		//리스트에 추가 하기 위한 임시 변수들
		String albumstr; //앨범명을 담을 임시 변수
		String datestr; //발매일을 담을 임시변수
		String read=""; //파일을 읽어올 변수
		 while((read= reader.readLine())!=null){ //파일의 끝까지 반복
			String[] str = read.split(",");	 //파일에서 ',' 을 기준으로 문자열 추출
			//추출한걸 임시변수에 추가
			albumstr = str[0];
			datestr = str[1];
			
			ArrayList<String> tracklist = new ArrayList<>(); //Song에 추가하기 위한 임시 트랙리스트
			String[] track = str[2].split("/");//파일에서 가져온 트랙리스트를  /를 기준으로 추출
			for(int i=0; i<track.length; i++){ //가져온 길이만큼 반복해 
				if(track[i].charAt(0) == '*'){//타이틀곡이면
					tracklist.add("<b>"+track[i].substring(1,track[i].length())+"</b><br>");//문자열 강조해서 임시리스트에 추가
				}else{
					tracklist.add(track[i]+"<br>");//그냥 임시리스트에 추가
				}	
			}
			
			//임시변수를 이용해 ArrayList<Song>에  추가
			song.add(new Song(albumstr,datestr,tracklist));

		}//while 
		
		for(int i=0; i< song.size(); i++){
			out.println("앨범명 : "+song.get(i).Album+"&nbsp;&nbsp;&nbsp;&nbsp;");
			out.println("발매일 : "+song.get(i).date+"&nbsp;&nbsp;&nbsp;&nbsp;");
			out.println("트랙리스트 : <br>");
			for(String tracklist:song.get(i).track){ //정확한 값만 추출하기위함
				out.println(tracklist+"<br>");
			}
			
			out.println("<br>");
		}
	}catch(Exception e){
		out.print("catch");
		e.printStackTrace();
	}finally{
		/* reader.close(); */
	}
%>
</body>
</html>