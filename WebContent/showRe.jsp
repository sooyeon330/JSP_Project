<%@page import="java.util.Collections"%>
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
		String Albumnum;
		String Albumimg;
		String Album;
		String AlbumId;
		String date;
		String song;
		
		public Song(String cnt, String albumimg, String album, String albumid,  String date, String song){
			this.Albumnum = cnt;
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
	String listname = request.getParameter("List");
	
	int flag=0;
	
	BufferedReader reader = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/text/"+listname+".txt");
		reader = new BufferedReader(new FileReader(filePath));
		
		ArrayList<Song> song = new ArrayList<>();//전체 앨범을 담을 리스트
		//리스트에 추가 하기 위한 임시 변수들
		int albumnum = 0;//랜덤으로 출력하기 위한 인덱스를 담을 count변수
		String albumimg; //앨범아트이미지를 불러오기 위한 string을 담을 변수
		String albumstr; //앨범명을 담을 임시 변수
		String albumid; //앨범 id를 담을 임시변수
		String datestr; //발매일을 담을 임시변수
		String songstr;//노래제목
		String read=""; //파일을 읽어올 변수
		 while((read= reader.readLine())!=null){ //파일의 끝까지 반복
			String[] str = read.split(",");	 //파일에서 ',' 을 기준으로 문자열 추출
			if (flag==0){ 
				str[0] =null; //이유는 모르겠지만 첫줄의 값이 이상해서 첫줄에 null을 주고 
				flag=1;
			}
			if(str[0] != null){ //null이 아닐때만 add
				//추출한걸 임시변수에 추가
				albumnum++;
				albumimg = str[0];
				albumid = str[1];
				albumstr = str[2];
				datestr = str[3];
				songstr = str[4];
				
				//임시변수를 이용해 ArrayList<Song>에  추가
				song.add(new Song( Integer.toString(albumnum)  ,albumimg, albumstr,albumid,datestr,songstr));
			}
		}//while 
			
	int ridx[] = new int[3];
	for(int i=0; i<3; i++){
		ridx[i]=(int)(Math.random()*song.size());
		for(int j=0; j<i; j++){
			if(ridx[i]==ridx[j]){
				i--; break;
			}
		}
	}
%>
<center>
<table id="List" >
	<tr>
		<th colspan="4">오늘의 추천곡</th>
	</tr>
<%		
	for(int i=0; i<3; i++){
%>
	<tr>
			<td class="imagetd"><img class="image" src="img/album/<%=song.get(ridx[i]).Albumimg%>.jpg"></td>
			<td class="titletd"><%=song.get(ridx[i]).song%></td>
			<td class="albumtd"><a title="앨범정보보기" target="black" href="https://www.melon.com/album/detail.htm?albumId=<%=song.get(ridx[i]).AlbumId%>">
																						<%=song.get(ridx[i]).Album%></a></td>
			<td>
				<input class="btn" type="button" value="▶ 들으러 가기"
				 onclick=" window.open('about:blank').location.href='https://www.melon.com/album/detail.htm?albumId=<%=song.get(ridx[i]).AlbumId%>'">
			</td>
	</tr>

<%
	}
	
%>
</center>
</table>
<table class="sleepList" >
<%
		Collections.shuffle(song);
		//출력
		String imgart="";
		
			for(int i=0; i< song.size(); i++){ 
//				if(i==0) out.print(song.get(i).Albumimg);
				imgart = song.get(i).Albumimg;	
					out.println("<tr id="+imgart+">");
%>
			<td class="imgtd"><img class="image" src="img/album/<%=imgart%>.jpg"></td>
			<td class="songtd"><%=song.get(i).song%></td>
			<td><%=song.get(i).date%></td>
			<td><a title="앨범정보보기" target="black" href="https://www.melon.com/album/detail.htm?albumId=<%=song.get(i).AlbumId%>">
																						<%=song.get(i).Album%></a></td>
<%		

			}
		}catch(Exception e){
			out.println("catch");
			e.printStackTrace();
		}finally{
		/* reader.close(); */
		}
%>
</table>
</body>
</html>