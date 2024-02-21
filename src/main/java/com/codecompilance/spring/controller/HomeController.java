package com.codecompilance.spring.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Date;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codecompilance.spring.model.Book;
import com.codecompilance.spring.model.BookmarkView;
import com.codecompilance.spring.model.BuildingComposition;
import com.codecompilance.spring.model.Chapter;
import com.codecompilance.spring.model.ChapterSectionDetails;
import com.codecompilance.spring.model.FloorDetails;
import com.codecompilance.spring.model.ProjectView;
import com.codecompilance.spring.model.QueryData;
import com.codecompilance.spring.model.RegionCodeYear;
import com.codecompilance.spring.model.UserView;
import com.codecompilance.spring.model.WallSegmentDetails;

@Controller
@RequestMapping({"/home" , "/"})
public class HomeController {
	private static final Logger logger = Logger.getLogger(HomeController.class);
	Properties prop = new Properties();
	InputStream inputStream;
	String propFileName = "dbconnection.properties";

	/* Home jsp page request mapping method */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {
		String ipkey = request.getParameter("ipkey");
		setSiteUrl(request, response);
		String str = buildingCodes(request, response);
		return "home";
	}
	
	private void setSiteUrl(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		inputStream = logger.getClass().getClassLoader().getResourceAsStream(propFileName);
		try{
			if (inputStream != null) {
				prop.load(inputStream);
				String siteurl = prop.getProperty("siteurl");
		        System.out.println("siteurl !!!!"+siteurl);
		        session.setAttribute("siteurl", siteurl);
			}
		} catch (Exception e) {
            System.out.println(e);
        }
	}
	
	/* ChapterView jsp page request mapping method */
	@RequestMapping(value = "/ChapterView", method = RequestMethod.GET)
	public String ChapterView(HttpServletRequest request, HttpServletResponse response) {
		return "ChapterView";

	}
	
	/* ChapterView jsp page request mapping method */
	@RequestMapping(value = "/codebooks", method = RequestMethod.GET)
	public String codebooks(HttpServletRequest request, HttpServletResponse response) {
		String test = buildingCodes(request, response);
		return "codebooks";

	}
	
	/* manage account jsp page request mapping method */
	@RequestMapping(value = "/manageaccount", method = RequestMethod.GET)
	public String manageAccount(HttpServletRequest request, HttpServletResponse response) {
		return "manageaccount";

	}
	
	/* manage account jsp page request mapping method */
	@RequestMapping(value = "/updateProfile", method = RequestMethod.GET)
	public String updateProfile(HttpServletRequest request, HttpServletResponse response) {
		return "updateprofile";

	}
	
	/* manage account jsp page request mapping method */
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword(HttpServletRequest request, HttpServletResponse response) {
		return "changepassword";

	}
	
	/* manage account jsp page request mapping method */
	@RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
	public String resetPassword(HttpServletRequest request, HttpServletResponse response) {
		setSiteUrl(request, response);
		String emailId = request.getParameter("emailId");
		request.setAttribute("emailId", emailId);
		return "resetpassword";

	}
	
	/* Pricing jsp page request mapping method */
	@RequestMapping(value = "/pricing", method = RequestMethod.GET)
	public String productPricing(HttpServletRequest request, HttpServletResponse response) {
		return "product_pricing";

	}

	/* Feature jsp page request mapping method */
	@RequestMapping(value = "/features", method = RequestMethod.GET)
	public String productFeatures(HttpServletRequest request, HttpServletResponse response) {
		return "product_features";

	}
	
	/* Feature jsp page request mapping method */
	@RequestMapping(value = "/drawings", method = RequestMethod.GET)
	public String newDrawings(HttpServletRequest request, HttpServletResponse response) {
		return "drawings";

	}

	/* This will get states list, This method will call another method called getREgionsAndBooksWithStateName which will return the list of books and book years and renders ChapterView jsp page  */
	@RequestMapping(value = "/codes", method = RequestMethod.GET)
	public String buildingCodes(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		HashMap<String, ArrayList<String>> stateBooksMap = new LinkedHashMap<String, ArrayList<String>>();
		String ipAddress = request.getParameter("ipkey");
		String stateName = null;
		System.out.println("==========ipAddress======== "+ipAddress); 
		try {
			
			/*URL whatismyip = new URL("http://checkip.amazonaws.com");
	        BufferedReader in = null;
	        try {
	            in = new BufferedReader(new InputStreamReader(whatismyip.openStream()));
	            ipAddress = in.readLine();
	            System.out.println("==========ipAddress======== "+ipAddress);  
	        } finally {
	            if (in != null) {
	                try {
	                    in.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }*/
			
			URL url = new URL("https://ipinfo.io/"+ipAddress);
			HttpURLConnection http = (HttpURLConnection)url.openConnection();
			http.setRequestProperty("User-Agent", "curl/7.68.0");
			http.setRequestProperty("Authorization", "cd0c6ac2c24543");

			//System.out.println("========content========="+http.getContent());

			//String content = IOUtils.toString((InputStream) http.getContent(), StandardCharsets.UTF_8);
			
			BufferedReader bR = new BufferedReader(new InputStreamReader((InputStream) http.getContent()));
			String line = "";

			StringBuilder responseStrBuilder = new StringBuilder();
			while((line =  bR.readLine()) != null){

			    responseStrBuilder.append(line);
			}
			bR.close();
			
			JSONObject result= new JSONObject(responseStrBuilder.toString()); 
			
			System.out.println("========content========="+result);
			
			stateName = result.getString("region");
			
			System.out.println("========region========="+stateName);

			http.disconnect();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(stateName == null || "".equalsIgnoreCase(stateName)) {
			stateName = request.getParameter("statename");
		}
		System.out.println("========stateName========="+stateName);
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            System.out.println("Database connection is successful !!!!");
	            
	            Statement st=(Statement) conn.createStatement();

	            String sql="select * from tblstates" ;
	            ResultSet rs=st.executeQuery(sql);
	            Set<String> outputRes = new TreeSet<String>();
	            ArrayList bookList = new ArrayList();
	            ArrayList<String> statesList = new ArrayList<String>();
	    		while (rs.next()) {
	                statesList.add(rs.getString("state_name"));
	            }
	    		
	    		for(String state:statesList){
	    	        
	    	        	bookList = getRegionsAndBooksWithStateName(request,state);
		                outputRes.add(state);
		                stateBooksMap.put(state, bookList);
		                if(state.equals(stateName)) {
		                	selectedStateBookList(request, response);
		                	session.setAttribute("selectedState1", stateName);
		                	session.setAttribute("selectedState", stateName);
	    	        }
	    	             
	    	    }
	            System.out.println("statesList ::::::::::::"+outputRes);
	            session.setAttribute("stateBooksMap", stateBooksMap);
	            session.setAttribute("statesList", outputRes);
	         }
			session.setAttribute("selectedState1", stateName);
			//selectedStateBookList(request, response);
		} catch (Exception e) {
	         e.printStackTrace();
	      }
		return "building_codes";
	}
	
	
	

//	This method will get list og books for the given statename and render building_codes.jsp page
	@RequestMapping(value = "/selectedStateBookList", method = RequestMethod.GET)
	public String selectedStateBookList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String stateName = request.getParameter("statename");
		if(stateName == null || "".equalsIgnoreCase(stateName)) {
			stateName = (String)session.getAttribute("selectedState1");
		}
		// commenting region based states for now 
		 List res = getRegionsAndBooksWithStateName(request, stateName);
		
		// Code to get books for the selected state -- according to new DB
		//List res = getBooksForState(request, stateName);
		
		session.setAttribute("selectedState", stateName);
		session.setAttribute("statename", stateName);
		return "building_codes";

	}
	
	
//	This method will get list of books for the given statename and render building_codes.jsp page
	@RequestMapping(value = "/getBooksForSelectedState", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody ArrayList<Object> getBooksForSelectedState(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String stateName = request.getParameter("statename");
		if(stateName == null || "".equalsIgnoreCase(stateName)) {
			stateName = (String)session.getAttribute("selectedState1");
		}
		// commenting region based states for now 
		 ArrayList<Object> bookList = getRegionsAndBooksWithStateName(request, stateName);
		
		// Code to get books for the selected state -- according to new DB
		//List res = getBooksForState(request, stateName);
		
		session.setAttribute("selectedState", stateName);
		session.setAttribute("statename", stateName);
		System.out.println("bookList==========="+bookList);
		return bookList;

	}
	
//	This is reusable private function which is used to get list of books and book years for get given stateName
	@RequestMapping(value = "/getRegionsAndBooksWithStateName", method = RequestMethod.GET)
		public ArrayList<Object> getRegionsAndBooksWithStateName(HttpServletRequest request, String stateName) {
		
		HttpSession session = request.getSession();
		Book book = null;
		ArrayList<Object> bookList = new ArrayList<>();
		Connection conn = null;
		ResultSet rs = null;
		Statement st = null;
		try {
			conn = DBConnect.connect();
			
			if (conn != null) {
	            System.out.println("Database connection is successful !!!!");
	            
	            st=(Statement) conn.createStatement();

	            //String sql="select * from books where stateid = (select id from states where state ='"+stateName+"') order by year desc";
	            String sql="select * from tblbooks where state_id = (select id from tblstates where state_name ='"+stateName+"') order by book_year desc";
	            rs=st.executeQuery(sql);
	            
	            List<String> outputYears = new ArrayList<String>();
	            while (rs.next()) {	            	
	    				LinkedHashMap<Object, Object> bookDet = new LinkedHashMap<>();
	    				book = new Book();
	    				int bookId = rs.getInt("id");
	    				bookDet.put("bookId", bookId);
	    				book.setBookId(bookId);
	    				
	    				@SuppressWarnings("unused")
						String region = rs.getString("book_region");
	    				bookDet.put("regionName", stateName);
	    				bookDet.put("region", stateName);
	    				
	    				int stateId = rs.getInt("state_id");
	    				bookDet.put("stateId", stateId);
	    				book.setStateId(stateId);
	    				
	    				String bookStr = rs.getString("book_title");
	    				bookDet.put("bookUrl", bookStr);
	    				bookDet.put("bookName", bookStr);
	    				book.setBookName(bookStr);
	    				
	    				String bookYear = rs.getString("book_year");
	    				outputYears.add(bookYear);
	    				bookList.add(bookDet);
	            }
	            session.setAttribute("bookList", bookList);
				session.setAttribute("yearList", outputYears);
				System.out.println(bookList);
	         }
			//session.setAttribute("selectedState", stateName);
		} catch (Exception e) {
	         e.printStackTrace();
	    }finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bookList;
	}
	
	@RequestMapping(value = "/saveCommentsAndBookmarks", method = RequestMethod.GET)
	  public @ResponseBody String saveCommentsAndBookmarks(HttpServletRequest request, HttpServletResponse response) 
	  {
		JSONObject outputJsonObj = new JSONObject();
		
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		int stateid = Integer.parseInt(request.getParameter("stateid"));
		int bookid = Integer.parseInt(request.getParameter("bookId"));
		int chapter = Integer.parseInt(request.getParameter("chapterId"));
		int section = Integer.parseInt(request.getParameter("subChapterId"));
		int subsection = Integer.parseInt(request.getParameter("subChapterSecId"));
		int subsubsection = Integer.parseInt(request.getParameter("subChapterSecSubSecId"));
		String actiontype = request.getParameter("actionType");
		String comments = request.getParameter("comments");
		String status = null;
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
	            String sql = "insert into bookmarks(userid, stateid, bookid, chapter, section, subsection, subsubsection, actiontype, comments, created_at) values(?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)";
	            
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            
	            preparedStmt.setInt(1, userId);
	            preparedStmt.setInt(2, stateid);
	            preparedStmt.setInt(3, bookid);
	            preparedStmt.setInt(4, chapter);
	            preparedStmt.setInt(5, section);
	            preparedStmt.setInt(6, subsection);
	            preparedStmt.setInt(7, subsubsection);
	            preparedStmt.setString(8, actiontype);
	            preparedStmt.setString(9, comments);

	            // execute the java prepared statement
	            int rowCount = preparedStmt.executeUpdate();
	            
	            if(rowCount == 1) {
	            	if("bookmark".equalsIgnoreCase(actiontype)) {
	            		status = "This Section has been Bookmarked";
	            		request.setAttribute("bookmarkstatus", status);
	            	}else {
	            		status = "The Comments have been added";
	            		request.setAttribute("bookmarkstatus", status);
	            	}
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		System.out.println("Comments or Bookmarks ========="+status);
		session.setAttribute("bookmarkstatus", status);
		outputJsonObj.put("outputPage", "ChapterView");
		outputJsonObj.put("bookmarkstatus", status);
		return outputJsonObj.toString();
	}
	
	
//	This will delete the comments or bookmarks 
	@RequestMapping(value = "/deleteBookmarksOrComments", method = RequestMethod.POST)
	public @ResponseBody String deleteBookmarksOrComments(HttpServletRequest request, HttpServletResponse response) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		int bookmarkId = Integer.parseInt(request.getParameter("bookmarkId"));
		String actionType = request.getParameter("actionType");
		String status = null;
		String outputPage = null;
		JSONObject outputJsonObj = new JSONObject();
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
	            String sql = "DELETE FROM bookmarks WHERE userid = ? and id = ?";
	            
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            preparedStmt.setInt(1, userId);
	            preparedStmt.setInt(2, bookmarkId);
	            
	            // execute the java prepared statement
	            int rowCount = preparedStmt.executeUpdate();
	            if(rowCount == 1) {
	            	if("comment".equalsIgnoreCase(actionType)) {
	            		status = "Comment has been deleted successfully";
		            	outputPage = viewComments(request,response);
	            		request.setAttribute("status", status);
	            		System.out.println(status);
	            	}
	            	else {
		            	status = "Bookmark has been deleted successfully";
		            	request.setAttribute("status", status);
	            		System.out.println(status);
	            		outputPage = viewBookmarks(request,response);
	            	}
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		request.setAttribute("status", status);
		outputJsonObj.put("status", status);
		outputJsonObj.put("outputPage", outputPage); //outputJsonObj.put("outputPage", "book_details");
		return  outputJsonObj.toString();
	}
	
	
//	This will return Chapter details of selected chapter
	  @RequestMapping(value = "/showChapterDetails", method = RequestMethod.GET)
	  public String showChapterDetails(HttpServletRequest request, HttpServletResponse response) 
	  {
		  HttpSession session = request.getSession();
		  int chaptId = Integer.parseInt(request.getParameter("chapterId"));
		  System.out.println("===========chapterId=========="+chaptId);
		  JSONObject outputJsonObj = new JSONObject(); 
		  int stateId = Integer.parseInt(session.getAttribute("selectedStateId").toString());
		  int bookId = Integer.parseInt(session.getAttribute("selectedBookId").toString());
		  List<Chapter> chapterList = new ArrayList<Chapter>();
		  Chapter chapter = new Chapter();
		  ArrayList<String> sectionDetailsList = new ArrayList<String>();
		  Connection conn = null;
		  Statement st = null;
		  ResultSet rs = null;
		  try 
		  {
			  conn = DBConnect.connect();
			  if (conn != null) {
				  st =(Statement) conn.createStatement();
				  /*String sql = "select sts.id as stateId, sts.state_name as State, bks.id as bookId, bks.book_title , chps.id as chapterId, chps.chapter_title, "
				  		+ "chps.chapter_name, subchps.id as subchapterId, subchps.subchapter_title, sbchsec.id as subchaptersecid, sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, "
				  		+ "tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content, tblsbchsbsec.subchaptersubsection_title from tblsubchapterssubsections \r\n" + 
				  		"tblsbchsbsec left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left \r\n" + 
				  		"join tblsubchapters subchps on sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n" + 
				  		"chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and \r\n" +
				  		"sts.state_name = '"+stateId+"' and bks.book_title = '"+bookName+"' and chps.chapter_title = '"+chaptId+"' where bks.id is not null and sts.state_name is not null;";
					*/
				  String sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, chps.chapter_title, chps.chapter_name, "
				  		+ "subchps.id as subchapterId, subchps.subchapter_title, sbchsec.id as subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, \r\n" + 
						"sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content,"
						+ " tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content "
						+ "from tblsubchapterssubsubsections tblsbchsbsbsec left join tblsubchapterssubsections tblsbchsbsec on tblsbchsbsbsec.subchaptersubsection_id = tblsbchsbsec.id \r\n" + 
						" left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left join tblsubchapters subchps on "
						+ "sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n" + 
						"chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and sts.id = "+stateId+" and bks.id = "+bookId+" and "
						+ "chps.id = "+chaptId+" and chps.id = subchps.chapter_id where bks.id is not null and sts.id is not null and chps.id is not null "
						+ "order by chps.sequence, tblsbchsbsec.id, tblsbchsbsbsec.id;";
					
					
					rs=st.executeQuery(sql);
		            while (rs.next()) {
		            	chapter = new Chapter();
		            	chapter.setStateId(rs.getInt("stateId"));
		            	chapter.setState(rs.getString("State"));
		            	chapter.setBookId(rs.getInt("bookId"));
		            	chapter.setChapterId(rs.getInt("chapterId"));
		            	chapter.setChpName(rs.getString("chapter_name"));
		            	chapter.setChpTitle(rs.getString("chapter_title"));
		            	chapter.setSubChapterId(rs.getInt("subchapterId"));
		            	chapter.setSubChapterTitle(rs.getString("subchapter_title"));
		            	chapter.setSubChapterSecId(rs.getInt("subchaptersecid"));
		            	chapter.setSubChapterSecName(rs.getString("subchaptersection_no"));
		            	chapter.setSubChapterSecTitle(rs.getString("subchaptersection_title"));
		            	chapter.setSubChapterSecContent(rs.getString("subchaptersection_content"));
		            	chapter.setSubChapterSecSubSecId(rs.getInt("sbchpsecsubsecid"));
		            	chapter.setSubChapterSecSubSecTitle(rs.getString("subchaptersubsection_title"));
		            	chapter.setSubChapterSecSubSecContent(rs.getString("subchaptersubsection_content"));
		            	chapter.setSubChapterSecSubSubSecId(rs.getInt("sbchpsbsbsecId"));
		            	chapter.setSubChapterSecSubSubSecTitle(rs.getString("subchaptersubsubsection_title"));
		            	chapter.setSubChapterSecSubSubSecContent(rs.getString("subchaptersubsubsection_content"));
		            	chapterList.add(chapter);
		            	sectionDetailsList.add(rs.getInt("subchapterId")+"_"+rs.getString("subchapter_title"));
		            }
				}
			  
		  }catch (SQLException sqe) {
			  sqe.printStackTrace();
		  }catch (Exception e) {
			  e.printStackTrace();
		  }finally {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("sectionDetailsList"+sectionDetailsList);
			session.setAttribute("chapterList", chapterList);
			//session.setAttribute("chpList", chpList);
		  
		  System.out.println("chpList -->"+chapterList);
		  session.setAttribute("sectionDetailsList", sectionDetailsList);
		  outputJsonObj.put("chapterList", chapterList);
		  outputJsonObj.put("sectionDetailsList", sectionDetailsList);
		  outputJsonObj.put("outputPage", "ChapterView"); //outputJsonObj.put("outputPage", "book_details");
		  //return  outputJsonObj.toString();
		  return "ChapterView";
	}
	
	  

	  public List<ChapterSectionDetails> getSubSectionList(HttpServletRequest request, HttpServletResponse response, String chaptId) {
		  	List<ChapterSectionDetails> sectionDetailsList = new ArrayList<ChapterSectionDetails>();
			Statement st = null;
			Connection conn = null;
			ResultSet rs = null;
			try {
				conn = DBConnect.connect();
				if (conn != null) {
					
		            st = conn.createStatement();
		            
		            //String sql = "select subchaptersecsubsecname,SubChapterSecSubSubSecName, SubChapterSecSubSubSecTitle, SubChapterSecSubSubSecContent from tblchapters where subchaptersecsubsecname in (select distinct subchaptersecsubsecname from tblchapters where chaptername like '"+chaptId+"' ) and SubChapterSecSubSubSecName not like 'nan'";
		            String sql = "select subchaptersecsubsecname,SubChapterSecSubSubSecName, SubChapterSecSubSubSecTitle, SubChapterSecSubSubSecContent from tblchapters where subchaptersecsubsecname in (select distinct subchaptersecsubsecname from tblchapters where chaptername like '"+chaptId+"') and SubChapterSecSubSubSecName not like 'nan' order by subchaptersecsubsecname,SubChapterSecSubSubSecName asc;";
		            rs = st.executeQuery(sql);
		            while (rs.next()) {
		            	ChapterSectionDetails chapterSectionDetail = new ChapterSectionDetails();
		            	chapterSectionDetail.setSubchaptersecsubsecname(rs.getString("subchaptersecsubsecname"));
		            	chapterSectionDetail.setSubChapterSecSubSubSecName(rs.getString("SubChapterSecSubSubSecName"));
		            	chapterSectionDetail.setSubchaptersecsubsubsectitle(rs.getString("SubChapterSecSubSubSecTitle"));
		            	chapterSectionDetail.setSubchaptersecsubsubseccontent(rs.getString("SubChapterSecSubSubSecContent"));
		            	sectionDetailsList.add(chapterSectionDetail);
		            }
				}
			}catch (SQLException e) {

				e.printStackTrace();

			}
			catch (Exception e) {

				e.printStackTrace();

			}finally {
			
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return sectionDetailsList;
		}
	  
	  
	  private ArrayList<Chapter> getSubSectionDetails(HttpServletRequest request, HttpServletResponse response, int chapterId, int sectionId) 
	  {
		  HttpSession session = request.getSession();
		  session.setAttribute("bookmarkstatus", "");
		  int stateId = Integer.parseInt(session.getAttribute("selectedStateId").toString());
		  int bookId = Integer.parseInt(session.getAttribute("selectedBookId").toString());
		  
		  System.out.println("===========chapter Id=========="+chapterId);
		  System.out.println("===========section Id=========="+sectionId);
		  Connection conn = null;
		  Statement st = null;
		  ResultSet rs = null;
		  Chapter chapter = null;
		  String sql = null;
		  ArrayList<Chapter> chapterList = new ArrayList<Chapter>();
		  	
		  try
		  {
			  conn = DBConnect.connect();
			  if(conn != null) {
			  st=(Statement) conn.createStatement();				  
			  
			  sql = "select schps.subchapter_title, schps.chapter_id, sbsc.id as sbscid, sbsc.subchaptersubsection_title, \r\n" + 
			  		"sbsc.subchaptersubsection_content , sc.id, sc.subchaptersection_no, sc.subchaptersection_title, \r\n" + 
			  		"sc.subchaptersection_content, sbchsbsbsec.id as sbchpsbsbsecId, "
			  		+ "sbchsbsbsec.subchaptersubsubsection_title, sbchsbsbsec.subchaptersubsubsection_content from "
			  		+ "tblsubchapterssubsubsections sbchsbsbsec left join tblsubchapterssubsections sbsc "
			  		+ "on sbchsbsbsec.subchaptersubsection_id = sbsc.id left join tblsubchaptersections sc on \r\n" + 
			  		"sbsc.subchaptersection_id = sc.id left join tblsubchapters schps on sc.subchapter_id = schps.id \r\n" + 
			  		"where sc.subchapter_id = "+sectionId+" and schps.chapter_id = "+chapterId+" order by sc.id,sbsc.id,sbchsbsbsec.id;";
			  
			  rs = st.executeQuery(sql);
				while (rs.next()) {
					chapter = new Chapter();
	            	chapter.setStateId(stateId);
	            	chapter.setBookId(bookId);
	            	chapter.setChapterId(chapterId);
	            	chapter.setSubChapterId(sectionId);
	            	chapter.setSubChapterTitle(rs.getString("subchapter_title"));
	            	chapter.setSubChapterSecId(rs.getInt("id"));
	            	chapter.setSubChapterSecName(rs.getString("subchaptersection_no"));
	            	chapter.setSubChapterSecTitle(rs.getString("subchaptersection_title"));
	            	chapter.setSubChapterSecContent(rs.getString("subchaptersection_content"));
	            	chapter.setSubChapterSecSubSecId(rs.getInt("sbscid"));
	            	chapter.setSubChapterSecSubSecTitle(rs.getString("subchaptersubsection_title"));
	            	chapter.setSubChapterSecSubSecContent(rs.getString("subchaptersubsection_content"));
	            	chapter.setSubChapterSecSubSubSecId(rs.getInt("sbchpsbsbsecId"));
	            	chapter.setSubChapterSecSubSubSecTitle(rs.getString("subchaptersubsubsection_title"));
	            	chapter.setSubChapterSecSubSubSecContent(rs.getString("subchaptersubsubsection_content"));
	            	chapterList.add(chapter);
	            }
			}
		  }catch (SQLException sqe) {
			  sqe.printStackTrace();
		  }catch (Exception e) {
			  e.printStackTrace();
		  }finally {
			  try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  }
		  System.out.println("chapterList in getSubSectionDetails  ----> "+chapterList);
		  return chapterList;
	}
	  
	  
	  
	  private ArrayList<Chapter> getSectionContent(HttpServletRequest request, HttpServletResponse response, int chapterId, int sectionId) 
	  {
		  HttpSession session = request.getSession();
		  session.setAttribute("bookmarkstatus", "");
		  int stateId = Integer.parseInt(session.getAttribute("selectedStateId").toString());
		  int bookId = Integer.parseInt(session.getAttribute("selectedBookId").toString());
		  
		  System.out.println("===========chapter Id=========="+chapterId);
		  System.out.println("===========section Id=========="+sectionId);
		  Connection conn = null;
		  Statement st = null;
		  ResultSet rs = null;
		  Chapter chapter = null;
		  String sql = null;
		  ArrayList<Chapter> chapterList = new ArrayList<Chapter>();
		  	
		  try
		  {
			  conn = DBConnect.connect();
			  if(conn != null) {
			  st=(Statement) conn.createStatement();
			  sql = "select schps.subchapter_content, schps.subchapter_title, schps.chapter_id, sc.id, \r\n" + 
			  		"sc.subchaptersection_no, sc.subchaptersection_title, sc.subchaptersection_content from \r\n" + 
			  		"tblsubchaptersections sc left join tblsubchapters schps on sc.subchapter_id = schps.id \r\n" + 
			  		"where sc.subchapter_id = "+sectionId+" and schps.chapter_id = "+chapterId+" order by sc.id;";
			  
			  rs = st.executeQuery(sql);
				while (rs.next()) {
					chapter = new Chapter();
	            	chapter.setStateId(stateId);
	            	chapter.setBookId(bookId);
	            	chapter.setChapterId(chapterId);
	            	chapter.setSubChapterId(sectionId);
	            	chapter.setSubChapterTitle(rs.getString("subchapter_title"));
	            	chapter.setSubChapterContent(rs.getString("subchapter_content"));
	            	chapterList.add(chapter);
	            }
			}
		  }catch (SQLException sqe) {
			  sqe.printStackTrace();
		  }catch (Exception e) {
			  e.printStackTrace();
		  }finally {
			  try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  }
		  System.out.println("chapterList in getSectionContent  ----> "+chapterList);
		  return chapterList;
	}

	  
	  
//		This will return Chapter details of selected chapter
		  @RequestMapping(value = "/showSectionDetails", method = RequestMethod.GET)
		  public @ResponseBody String showSectionDetails(HttpServletRequest request, HttpServletResponse response) 
		  {
			  HttpSession session = request.getSession();
			  session.setAttribute("bookmarkstatus", "");
			  int stateId = Integer.parseInt(session.getAttribute("selectedStateId").toString());
			  int bookId = Integer.parseInt(session.getAttribute("selectedBookId").toString());
			  JSONObject outputJsonObj = new JSONObject(); 
			  int chapterId = Integer.parseInt(request.getParameter("chapterId"));
			  int sectionId = Integer.parseInt(request.getParameter("sectionId"));
			  
			  ArrayList<Chapter> chapterList = new ArrayList<Chapter>();
			  
			  if(sectionId != 0) {
				  chapterList = getSubSectionDetails(request, response, chapterId, sectionId);
				  if(chapterList.isEmpty()) {
					  chapterList = getSectionContent(request, response, chapterId, sectionId); 
				  }
				  if(!chapterList.isEmpty()) {
					  session.setAttribute("chapterList", chapterList);
					  //session.setAttribute("chpList", chapterList);
				  }
			  }
			  System.out.println("chapterList in showSectionDetails  ----> "+chapterList);
			  session.setAttribute("chapterList", chapterList);
			  outputJsonObj.put("chapterList", chapterList); //outputJsonObj.put("outputPage", "book_details");
			  
			  outputJsonObj.put("outputPage", "ChapterView"); //outputJsonObj.put("outputPage", "book_details");
			  return  outputJsonObj.toString();
			  //return "ChapterView";
		}
		  
		  
		  public HashMap<String, Integer> getChaptersList(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId) {
				HashMap<String, Integer> chapSecMap = new LinkedHashMap<String, Integer>();
				ArrayList<String> chapterNamesList = new ArrayList<String>();
				Statement st = null;
				Connection conn = null;
				ResultSet rs = null;
				try {
					conn = DBConnect.connect();
					if (conn != null) {
			            st = conn.createStatement();
			            String sql = "select chps.id as chapterId, chps.chapter_name, chps.chapter_title from tblchapters chps where "
			            		+ "chps.book_id = "+bookId+" and chps.chapter_name is not null order by chps.sequence;";
			            
			            rs = st.executeQuery(sql);
			            while (rs.next()) {
			            	StringBuilder chaptid = new StringBuilder();
			            	int chpId = rs.getInt("chapterId");
			            	chaptid.append(chpId);
			            	chaptid.append("__");
			            	chapterNamesList.add(chaptid+rs.getString("chapter_title"));
			            	chapSecMap.put(rs.getInt("chapterId")+"-"+rs.getString("chapter_title").toUpperCase(), rs.getInt("chapterId"));
			            }
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}
				catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						rs.close();
						st.close();
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				System.out.println("Chapters List --->"+chapSecMap);
				return chapSecMap;
			}
		  
//	This method returns book code years list for the given stateId , region Id
	@RequestMapping(value = "/getCodeYearsList", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getCodeYearsList(@RequestParam("regionId") String regionId, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("==========regionId============" + regionId);
		System.out.println("==========regionId============" + regionId);
		JSONObject res = new JSONObject();

		List<String> yearsList = getYearByRegion(request, regionId);
		/*if(!yearsList.isEmpty()) {
			yearsList.set(0, "Current");
		}*/
		//yearsList.get(0).replace("Current", regionId);
		res.append("years", yearsList);
		logger.info(res.toString());
		return res.toString();

	}
	
//	This method will create user with the given details
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/user_creation", method = RequestMethod.POST)
	public String userCreation(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		String emailID = request.getParameter("email");
		String companyName = request.getParameter("company");
		String userType = request.getParameter("inputUserType");
		int	userId = 0;
		logger.info("===username==" + username);
		logger.info("===password==" + password);
		logger.info("===emailID==" + emailID);
		logger.info("===companyName==" + companyName);
		logger.info("===userType==" + userType);
		String responsePage = null;
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            System.out.println("Database connection is successful !!!!");
	            
	            String selectSQL = "select id from users where email = '"+emailID+"'";
	            Statement st = conn.createStatement();
	            ResultSet rs1 = st.executeQuery(selectSQL);
	            
	            if(rs1.next()) {
	            	request.setAttribute("signupStatus", "Signup Failure, User already exists");
	    			responsePage = "signup";
	            }else {
	            
		            String sql="insert into users(firstname,plan,email,password,company,created_at) values(?,?,?,?,?,CURRENT_TIMESTAMP)" ;
		            	            
		            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		                
	                pstmt.setString(1, username);
	                pstmt.setString(2, userType);
	                pstmt.setString(3, emailID);
	                pstmt.setString(4, password);
	                pstmt.setString(5, companyName);
	                
	                int count = pstmt.executeUpdate();
	                if(count == 1)
	                {
	                    // get candidate id
	                    ResultSet rs = pstmt.getGeneratedKeys();
	                    if(rs.next()) {
	                    	userId = rs.getInt(1);
	                    	responsePage = "login";
	                    	request.setAttribute("signupUserId", userId);
	          		        sendSignupEmail(request, response, emailID);
	                    }
	                }
	            }
			}
		} catch (Exception e) {
			logger.debug("===================user creation failure1==============");
			e.printStackTrace();
			request.setAttribute("signupStatus", "Signup Failure, Please Signup again");
			responsePage = "signup";

		}
		return responsePage;

	}
	
	
//	This will send the email after signup/register
	private String sendSignupEmail(HttpServletRequest request, HttpServletResponse response, String emailId) throws MessagingException{
		String siteurl = request.getSession().getAttribute("siteurl").toString();
		request.setAttribute("email", emailId);
		String userName = getUserNameByEmail(emailId);
		Session session;
		try {
			session = createSession();
		
			String title = "CodeComplAI New User Registration";
			StringBuffer htmlRes = new StringBuffer();
			htmlRes.append("<!doctype html><html lang=\"en-US\"><body><div>Hello "+userName+",</div><div><br/>Welcome to The ComplAI community.</div>");			
			//htmlRes.append("<a href='home' class='logo logo-light'><span class=\"logo-lg\"><img src=\"assets/images/logo-light.png\" alt=\"logo-light\" height=\"42\"></span></a>");
			htmlRes.append("<div><p style='font:bold 12px/30px Georgia, serif; ;'>We know how important it is for you to understand building codes and ensure that your projects are fully complaint.<br/>We build tools that make code complaince fast and accurate so that you'll never get surprised with complaince related delays or expensive rework.</p></div>");
			htmlRes.append("<div><p style='font:10px/30px Georgia, serif; align:center;'>If you have questions, please reach out to us at support@complai.com.</p></div>");
			htmlRes.append("<div><a href='http://104.131.0.156:8080/"+siteurl+"/login'style=\"background:#20e277;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:14px;padding:10px 24px;display:inline-block;border-radius:50px;\">Login</a></div>");
			htmlRes.append("</body></html>");
		      //create message using session
		      MimeMessage message = new MimeMessage(session);
		      prepareEmailMessage(message, emailId, title, htmlRes.toString());
		      //sending message
		      Transport.send(message);
		      System.out.println("Done");
		      request.setAttribute("signupStatus", "Registration Successful. An email has been sent to the entered emailid. Please verify your email id and login to Code ComplAI.");
				
		      //request.setAttribute("fpStatus", "Registration Successful. An email has been sent to the entered emailid. Please verify your email id and login to Code ComplAI.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "login";

	}

	

//	This method will logout the session
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
//	This method will render viewprojects.jsp page
@RequestMapping(value = "/viewProjects", method = RequestMethod.GET)
	public String viewProjects(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String sort = request.getParameter("sort");
		int userId = 0;
		if(session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
			logger.info("===userId==" + userId);
		}else {
			session.invalidate();
			String str = buildingCodes(request,response);
			return "home";
		}
		List<RegionCodeYear> regionCodeYearsList = getCodeYearByRegion(request);
		session.setAttribute("regionCodeYear", regionCodeYearsList);
		List<ProjectView> projectList = projectslistPage(request, userId);
		request.setAttribute("projectList", projectList);
		session.setAttribute("projectList", projectList);
		return "viewprojects";
	}



@RequestMapping(value = "/showProcessedDXF", method = RequestMethod.POST)
public String showProcessedDXF(int userId, int projectId, HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	List<String> dxfimagesList = new ArrayList<String>();
	List<String> pngimagesList = new ArrayList<String>();  
	
	String fileName = "";
	
	/*if(request.getParameter("userId") != null && request.getParameter("projectId") != null) {
		userId = Integer.parseInt(request.getParameter("userId").toString());
		projectId = Integer.parseInt(request.getParameter("projectId").toString());
		fileName = userId+"_"+projectId;
	} else if(session.getAttribute("userId") != null && session.getAttribute("projectId") != null) {
		userId = Integer.parseInt(session.getAttribute("userId").toString());
		projectId = Integer.parseInt(session.getAttribute("projectId").toString());
		fileName = userId+"_"+projectId;
	}*/
	if(userId != 0 && projectId != 0) {
		
		fileName = userId+"_"+projectId;
		try {
			//String contextPath = request.getContextPath();codecompilance
			String absoluteFilePath = "/var/lib/tomcat9/webapps/processed_files/"+fileName+"/";
			System.out.println("absoluteFilePath--->"+absoluteFilePath);
			
			String pngPath = absoluteFilePath+"labled_pngs/";
			String dxfPath = absoluteFilePath+"pngs/";
					
			File pngimageDir = new File(pngPath);  
			for(File imageFile : pngimageDir.listFiles()){  
			  String imageFileName = imageFile.getName();  
	
			  // add this images name to the list we are building up  
			  pngimagesList.add("processed_files/"+fileName+"/labled_pngs/"+imageFileName);
	
			}
			File dxfimageDir = new File(dxfPath);
			for(File imageFile : dxfimageDir.listFiles()){
			  String imageFileName = imageFile.getName();
	
			  // add this images name to the list we are building up  
			  dxfimagesList.add("processed_files/"+fileName+"/pngs/"+imageFileName);  
	
			}
	    } catch (Exception e) {
	   	    System.out.println("Exception Trace ######### "+e);
		}
	}
	session.setAttribute("pngimagesList", pngimagesList);
	session.setAttribute("dxfimagesList", dxfimagesList);
	return "projectdetails";
}

@RequestMapping(value = "/uploadDrawing", method = RequestMethod.POST)
public String uploadDrawing(HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	String fileName = "";
	int userId = 0;
	int projectId = 0;
	if(request.getParameter("userId") != null && request.getParameter("projectId") != null) {
		userId = Integer.parseInt(request.getParameter("userId").toString());
		projectId = Integer.parseInt(request.getParameter("projectId").toString());
		fileName = userId+"_"+projectId;
	}else if(session.getAttribute("userId") != null && session.getAttribute("projectId") != null) {
		userId = Integer.parseInt(session.getAttribute("userId").toString());
		projectId = Integer.parseInt(session.getAttribute("projectId").toString());
		fileName = userId+"_"+projectId;
	}
	
	try {
		
		String filePath = "/uploaded_files/"+fileName+"/";
		String absoluteFilePath = request.getContextPath()+filePath;
		
		// changing the path in server 
		absoluteFilePath = "/var/lib/tomcat9/webapps/uploaded_files/"+fileName+"/";
		System.out.println("absoluteFilePath--->"+absoluteFilePath);
		
		String file_name = null;
        String file_name2="";
        String projectName = null;
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            return null;
        }
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        List < FileItem > fields = upload.parseRequest(request);
        Iterator < FileItem > it = fields.iterator();
        if (!it.hasNext()) {
            return null;
        }
        
        while (it.hasNext()) {
            FileItem fileItem = it.next();
            boolean isFormField = fileItem.isFormField();
            if (isFormField) {
                if (file_name == null) {
                    if (fileItem.getFieldName().equals("file_name")) {
                    	file_name = fileItem.getString();
                    }
                }
            } else {
                if (fileItem.getSize() > 0) {
                	file_name2=fileItem.getName();
                	
                    //fileItem.write(new File("C:\\Swathi\\Projects\\CCProject\\codecomplaince\\" + file_name2));
                	fileItem.write(new File(absoluteFilePath + file_name2));
                	
                	//generates random UUID    
                	UUID uuid=UUID.randomUUID();   
                	
                	Connection conn = DBConnect.connect();
        			if (conn != null) {
        				
        				Statement st=(Statement) conn.createStatement();
        				String sql1 = "select projectname from projects where userid = "+userId+" and id ="+projectId;
        				ResultSet rs = st.executeQuery(sql1);
        				if(rs.next()) {
        					projectName = rs.getString("projectname");
        				}

        	                  	            
        	            String sql="insert into dxf_uploads(Customer_id, project_id, dxf_unique_id, project_name, dxf_file_path, png_file_path, time_of_upload, job_state) values(?,?,?,?,?,?,CURRENT_TIMESTAMP,?)" ;
        	            	            
        	            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        	                
                        pstmt.setInt(1, userId);
                        pstmt.setInt(2, projectId);
                        pstmt.setString(3, uuid.toString());
                        pstmt.setString(4, projectName);
                        pstmt.setString(5, absoluteFilePath + file_name2);
                        pstmt.setString(6, null);
                        pstmt.setString(7, "J0");

                        int count = pstmt.executeUpdate();
                        if(count == 1)
                        {
                        	System.out.println("File/Image "+file_name2+" is inserted successfully");
                        	request.setAttribute("uploadstatus", "The image(s) have been uploaded successfully");
                        }
        			}
                	
                	
                }
            }
        }
        // storing in session to check the path in server
        session.setAttribute("absoluteFilePath", absoluteFilePath);
	  } catch (Exception e) {
	    String fileUploadError = "Problem with Apache Commons File Upload.";
	    System.out.println(fileUploadError);
	    System.out.println("Exception Trace ######### "+e);
	  }
	//showProcessedDXF(userId, projectId, request,response);
	return "projectdetails";
}

@RequestMapping(value = "/user_login", method = RequestMethod.POST)
public String userLogin(HttpServletRequest request, HttpServletResponse response) {
	String email = request.getParameter("username");
	String password = request.getParameter("password");
	logger.info("===username==" + email);
	logger.info("===password==" + password);
	    
	String outputUsername = null;
	int outputUserId = 0;
	try {
		Connection conn = DBConnect.connect();
		if (conn != null) {
            System.out.println("Database connection is successful !!!!");
            
            Statement st=(Statement) conn.createStatement();

            String sql="select * from users where email = '"+email+"' and password = '"+password+"'" ;
            ResultSet rs=st.executeQuery(sql);
             while (rs.next()) {
            	outputUsername = rs.getString("firstname");
            	outputUserId = rs.getInt("id");
            }
         }

	} catch (Exception e) {

		e.printStackTrace();

	}
	String outputView;
	if (outputUserId == 0 && outputUsername == null) {
		request.setAttribute("loginStatus", "failed");
		outputView = "login";

	} else {
		HttpSession session = request.getSession();
		session.setAttribute("username", outputUsername);
		session.setAttribute("userId", outputUserId);
		String userId = Integer.toString(outputUserId);
		logger.info("===outputUserId==" + outputUserId);
		List<RegionCodeYear> regionCodeYearsList = getCodeYearByRegion(request);
		session.setAttribute("regionCodeYear", regionCodeYearsList);
		List<ProjectView> projectList = projectslistPage(request, outputUserId);
		request.setAttribute("projectList", projectList);
		session.setAttribute("projectList", projectList);
		String profile = viewProfile(userId, request, response);
		outputView = "login_view";
	}
	return outputView;

}


//This method will return code years for the given regionId
	private List<RegionCodeYear> getCodeYearByRegion(HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<RegionCodeYear> outputRes = new ArrayList<RegionCodeYear>();
		RegionCodeYear regionCodeYear = null;
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            String sql="select * from tblstates" ;
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	regionCodeYear = new RegionCodeYear();
	            	int stateId = rs.getInt("id");
	                String state= rs.getString("state_name");
					regionCodeYear.setStateName(state);
					regionCodeYear.setRegionName(state);
					regionCodeYear.setRegionId(stateId);
					outputRes.add(regionCodeYear);
	            }
	            System.out.println("regionCodeYear ::::::::::::"+outputRes);
	            session.setAttribute("regionCodeYear", outputRes);
	         }
			} catch (Exception e) {
	         e.printStackTrace();
	      }
		return outputRes;
	}
	
	
// This method returns years of books for the given region
	private List<String> getYearByRegion(HttpServletRequest request, String regionId) {
		List<String> years = new ArrayList<String>();
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            String sql="select year from books where stateid = "+regionId+" order by year desc";
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	String year = rs.getString("year");
					years.add(year);
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		return years;
	}
	
	
//	This will create project with building data creation view
	@RequestMapping(value = "/createProjectShowBuildingData", method = RequestMethod.GET)
	public /* @ResponseBody */ String createProjectShowBuildingData(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String projectName = request.getParameter("projectname");
		String Jurisdiction = request.getParameter("Jurisdiction");
		String codeYear = request.getParameter("codeYear");
		Date currentDate = getCurrentDate();
		
		String jurisdictionName = null;
		
		
		session.setAttribute("projectName", projectName);
		session.setAttribute("Jurisdiction", Jurisdiction);
		session.setAttribute("codeYear", codeYear);
		session.setAttribute("createdAt", currentDate);
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		int projectId = 0;

		try {
			
			Connection conn = DBConnect.connect();
			if (conn != null) {
				
				Statement st=(Statement) conn.createStatement();

	            String stateSql ="select state_name from tblstates where id ="+Jurisdiction ;
	            ResultSet rs1 = st.executeQuery(stateSql);
	             if (rs1.next()) {
	            	 jurisdictionName = rs1.getString("state_name");
	                 st.close();
	            }
	            session.setAttribute("jurisdictionName", jurisdictionName);
	            
	            String sql="insert into projects(userid,projectname,jurisdiction,codeyear,created_at) values(?,?,?,?,CURRENT_TIMESTAMP)" ;
	            	            
	            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
	                
                pstmt.setInt(1, userId);
                pstmt.setString(2, projectName);
                pstmt.setString(3, Jurisdiction);
                pstmt.setString(4, codeYear);

                int count = pstmt.executeUpdate();
                if(count == 1)
                {
                    // get candidate id
                    ResultSet rs = pstmt.getGeneratedKeys();
                    if(rs.next())
                    	projectId = rs.getInt(1);
                    logger.info(projectId);
    				System.out.println("projectId===========" + projectId);
    				session.setAttribute("projectId", projectId);
    				List<ProjectView> projectList = projectslistPage(request, userId);
    				session.setAttribute("projectList", projectList);
    				
    				ProjectView pView = new ProjectView();
    				pView.setUserId(userId);
    				pView.setProjectId(projectId);
    				pView.setProjectName(projectName);
    				pView.setJurisdiction(jurisdictionName);
    				pView.setCodeYear(codeYear);
    				pView.setCreatedAt(currentDate);
    				session.setAttribute("projectView", pView);
    				pstmt.close();
    				conn.close();
                }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}

		session.setAttribute("floorNo", "1");
		return "createprojectbuilddata";
	}
	
	private static java.sql.Date getCurrentDate() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}
	

//	It will redirect to buildingdata.jsp page
	@RequestMapping(value = "/buildingdata", method = RequestMethod.GET)
	public  String buildingdata(HttpServletRequest request, HttpServletResponse response) {

		return "buildingdata";
	}

//This will redirect to buildingdata page
	@RequestMapping(value = "/beforebuildingdata", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String beforebuildingdata(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		
		JSONObject outputJsonObj = new JSONObject();
		
		buildingDataCommon(buildingComps, request, response);
		
		// create ProjectBuildData table with all the building fields
		//createProjectBuildData(buildingComps, request, response);

		outputJsonObj.put("outputPage", "buildingdata");

		return outputJsonObj.toString();

	}

//	This will redirect to heightandareas page
	@RequestMapping(value = "/heightandareas", method = RequestMethod.GET)
	public  String heightandareas(HttpServletRequest request, HttpServletResponse response) {

		return "heightandareas";
	}
	

	public @ResponseBody void buildingDataCommon(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		HttpSession session = request.getSession();
		JSONObject jsonObject = new JSONObject(buildingComps);
		//JSONObject buildInfoJsonObj = new JSONObject();
				
		JSONArray buildingCompArr = (JSONArray) jsonObject.getJSONArray("buildingComp");
		
		if(jsonObject.has("sprinklertype")) {
			String sprinklerType = jsonObject.get("sprinklertype").toString();
			session.setAttribute("sprinklertype", sprinklerType);
		}
		
		JSONArray outputJsonArr = new JSONArray();
		List<FloorDetails> output = new ArrayList<FloorDetails>();
		for (int i = 0; i < buildingCompArr.length(); i++) {
			JSONObject buildingComp = (JSONObject) buildingCompArr.get(i);
			String type = "old";
			String floor = (String) buildingComp.get("floor");
			String storyHeight = (String) buildingComp.get("storyHeight");
			FloorDetails fDet = new FloorDetails();
			if (!floor.equals("")) {
				fDet.setFloor(floor);
				fDet.setStoryHeight(storyHeight);
				// int j = i;
				List<BuildingComposition> bCompList = new ArrayList<BuildingComposition>();
				for (int j = i; j < buildingCompArr.length(); j++) {
					JSONObject buildingCompTemp = (JSONObject) buildingCompArr.get(j);
					String tempFloor = (String) buildingCompTemp.get("floor");
					if (tempFloor.equals("") || j == i) {
						BuildingComposition bComp = new BuildingComposition();
						i = j;
						bComp.setFloor((String) buildingCompTemp.get("floor"));
						bComp.setStoryHeight((String) buildingCompTemp.get("storyHeight"));
						bComp.setSpaceName((String) buildingCompTemp.get("spaceName"));
						bComp.setOccupancy((String) buildingCompTemp.get("occupancy"));
						bComp.setFunctionOfSpace((String) buildingCompTemp.get("functionOfSpace"));
						bComp.setGross((String) buildingCompTemp.get("gross"));
						bComp.setNetOccupaintLoad((String) buildingCompTemp.get("netOccupaintLoad"));
						bComp.setNextComponentWithPath((String) buildingCompTemp.get("nextComponentWithPath"));
						bComp.setType(type);
						bCompList.add(bComp);

					} else {

						break;
					}
				}
				fDet.setbList(bCompList);
			}

			output.add(fDet);
		}
		
		// code to add corridor details 
		List<FloorDetails> corridorData = new ArrayList<FloorDetails>();
		if(jsonObject.has("corridorDetails")) {
			JSONArray corridorDetailsArray = (JSONArray) jsonObject.getJSONArray("corridorDetails");
			for (int i = 0; i < corridorDetailsArray.length(); i++) {
				JSONObject buildingComp = (JSONObject) corridorDetailsArray.get(i);
				String floor = (String) buildingComp.get("floor");
				String storyHeight = (String) buildingComp.get("storyHeight");
				FloorDetails fDet = new FloorDetails();
				if (!floor.equals("")) {
					fDet.setFloor(floor);
					fDet.setStoryHeight(storyHeight);
					// int j = i;
					List<BuildingComposition> bCompList = new ArrayList<BuildingComposition>();
					for (int j = i; j < corridorDetailsArray.length(); j++) {
						JSONObject buildingCompTemp = (JSONObject) corridorDetailsArray.get(j);
						String tempFloor = (String) buildingCompTemp.get("floor");
						if (tempFloor.equals("") || j == i) {
							BuildingComposition bComp = new BuildingComposition();
							i = j;
							bComp.setFloor((String) buildingCompTemp.get("floor"));
							bComp.setStoryHeight((String) buildingCompTemp.get("storyHeight"));
							bComp.setCorridor((String) buildingCompTemp.get("corridor"));
							bComp.setCorridorSpace((String) buildingCompTemp.get("corridorSpace"));
							bCompList.add(bComp);
						} else {
	
							break;
						}
					}
					fDet.setbList(bCompList);
				}
				corridorData.add(fDet);
			}
		}
		
		// code to add stairways
		List<FloorDetails> stairwaysData = new ArrayList<FloorDetails>();
		if(jsonObject.has("stairwayDetails")) {
			JSONArray stairwayDetailsArray = (JSONArray) jsonObject.getJSONArray("stairwayDetails");
			for (int i = 0; i < stairwayDetailsArray.length(); i++) {
				JSONObject buildingComp = (JSONObject) stairwayDetailsArray.get(i);
				String type = "old";
				String floor = (String) buildingComp.get("floor");
				String storyHeight = (String) buildingComp.get("storyHeight");
				FloorDetails fDet = new FloorDetails();
				if (!floor.equals("")) {
					fDet.setFloor(floor);
					fDet.setStoryHeight(storyHeight);
					// int j = i;
					List<BuildingComposition> bCompList = new ArrayList<BuildingComposition>();
					for (int j = i; j < stairwayDetailsArray.length(); j++) {
						JSONObject buildingCompTemp = (JSONObject) stairwayDetailsArray.get(j);
						String tempFloor = (String) buildingCompTemp.get("floor");
						if (tempFloor.equals("") || j == i) {
							BuildingComposition bComp = new BuildingComposition();
							i = j;
							bComp.setFloor((String) buildingCompTemp.get("floor"));
							bComp.setStoryHeight((String) buildingCompTemp.get("storyHeight"));
							bComp.setStairway((String) buildingCompTemp.get("stairway"));
							bCompList.add(bComp);
						} else {
	
							break;
						}
					}
					fDet.setbList(bCompList);
				}
				stairwaysData.add(fDet);
			}
		}
		
		// code to add stairways
		List<FloorDetails> exitData = new ArrayList<FloorDetails>();
		if(jsonObject.has("exitDetails")) {
			JSONArray exitDetailsArray = (JSONArray) jsonObject.getJSONArray("exitDetails");
			for (int i = 0; i < exitDetailsArray.length(); i++) {
				JSONObject buildingComp = (JSONObject) exitDetailsArray.get(i);
				String type = "old";
				String floor = (String) buildingComp.get("floor");
				String storyHeight = (String) buildingComp.get("storyHeight");
				FloorDetails fDet = new FloorDetails();
				if (!floor.equals("")) {
					fDet.setFloor(floor);
					fDet.setStoryHeight(storyHeight);
					// int j = i;
					List<BuildingComposition> bCompList = new ArrayList<BuildingComposition>();
					for (int j = i; j < exitDetailsArray.length(); j++) {
						JSONObject buildingCompTemp = (JSONObject) exitDetailsArray.get(j);
						String tempFloor = (String) buildingCompTemp.get("floor");
						if (tempFloor.equals("") || j == i) {
							BuildingComposition bComp = new BuildingComposition();
							i = j;
							bComp.setFloor((String) buildingCompTemp.get("floor"));
							bComp.setStoryHeight((String) buildingCompTemp.get("storyHeight"));
							bComp.setExit((String) buildingCompTemp.get("exit"));
							bCompList.add(bComp);
						} else {
	
							break;
						}
					}
					fDet.setbList(bCompList);
				}
				exitData.add(fDet);
			}
		}
		session.setAttribute("corridorData", corridorData);
		session.setAttribute("stairwaysData", stairwaysData);
		session.setAttribute("exitData", exitData);
		session.setAttribute("buildingdata", output);
		session.setAttribute("bbuildingdata", output);
	}
	
	
	// This will create ProjectWithBuildData table
	@RequestMapping(value = "/updateProjectBuildData", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody void updateProjectBuildData(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println(buildingComps);
		
		HttpSession session = request.getSession();
		
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		int projectId = Integer.parseInt(session.getAttribute("projectId").toString());
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		
		boolean isUpdated = false;
		if(session.getAttribute("isUpdated") != null) {
			isUpdated = (boolean) session.getAttribute("isUpdated");
		}
		
		ProjectView pView = new ProjectView();
		
		JSONObject jsonObject = new JSONObject(buildingComps);
		
		int entertainment = 0;
		int extBalcony = 0;
		int egressBalcony = 0;
		int roofPortionOccupiable = 0;
		int fireAlarm = 0;
		
		if(jsonObject.has("entertainment")) {
			entertainment = Integer.parseInt(jsonObject.get("entertainment").toString());
			pView.setEntertainment(entertainment);
			session.setAttribute("entertainment", entertainment);
		}
		if(jsonObject.has("extBalcony")) {
			extBalcony = Integer.parseInt(jsonObject.get("extBalcony").toString());
			pView.setExtBalcony(extBalcony);
			session.setAttribute("extBalcony", extBalcony);
		}
		if(jsonObject.has("egressBalcony")) {
			egressBalcony = Integer.parseInt(jsonObject.get("egressBalcony").toString());
			pView.setEgressBalcony(egressBalcony);
			session.setAttribute("egressBalcony", egressBalcony);
		}
		if(jsonObject.has("roofPortionOccupiable")) {
			roofPortionOccupiable = Integer.parseInt(jsonObject.get("roofPortionOccupiable").toString());
			pView.setRoofPortionOccupiable(roofPortionOccupiable);
			session.setAttribute("roofPortionOccupiable", roofPortionOccupiable);
		}
		if(jsonObject.has("fireAlarm")) {
			fireAlarm = Integer.parseInt(jsonObject.get("fireAlarm").toString());
			pView.setFireAlarm(fireAlarm);
			session.setAttribute("fireAlarm", fireAlarm);
		}
		
		try {
			conn = DBConnect.connect();
			
			if (conn != null) {
	            System.out.println("Database connection is successful !!!!");
	            
	           String sql="update buildingdata set entertainment = ?, extbalcony = ?, egressbalcony = ?, roofportion = ?, firealarm = ? where userid = "+userId+" and projectid = "+projectId ;
	           
	           pstmt = conn.prepareStatement(sql); // create a statement
	           pstmt.setInt(1, entertainment);
               pstmt.setInt(2, extBalcony);
               pstmt.setInt(3, egressBalcony);
               pstmt.setInt(4, roofPortionOccupiable);
               pstmt.setInt(5, fireAlarm);
               count  = pstmt.executeUpdate(); // execute update statement
	            	            
                if(count == 1)
                {
                	System.out.println("record updated");
                	pstmt.close();
      		        conn.close();
                }
			}
			session.setAttribute("projectView", pView);
		} catch (Exception e) {

			e.printStackTrace();

		}
	}

	
	
		// This will create ProjectWithBuildData table
		@RequestMapping(value = "/createProjectBuildData", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
		public @ResponseBody void createProjectBuildData(@RequestBody String buildingComps, HttpServletRequest request,
				HttpServletResponse response) {
			
			System.out.println(buildingComps);
			
			HttpSession session = request.getSession();
			int userId = Integer.parseInt(session.getAttribute("userId").toString());
			//int userId = Integer.parseInt(request.getParameter("userId").toString());
			int projectId = Integer.parseInt(session.getAttribute("projectId").toString());
			
			boolean isInserted = false;
			ProjectView pView = new ProjectView();
			
			JSONObject jsonObject = new JSONObject(buildingComps);
			String sprinklerType = null;
			String constructionType = null;
			String neworexistingbuild = null;
			String avgHeight = null;
			String heightOrArea = null;
			int movieTheatre = 0;
			int entertainment = 0;
			int conStructure = 0;
			int extBalcony = 0;
			int egressBalcony = 0;
			int roofPortionOccupiable = 0;
			int fireAlarm = 0;
			int buildingdataId =0;
			
			if(jsonObject.has("sprinklertype")) {
				sprinklerType = jsonObject.get("sprinklertype").toString();
				pView.setSprinklerType(sprinklerType);
				session.setAttribute("sprinklertype", sprinklerType);
			}
			if(jsonObject.has("constructiontype")) {
				constructionType = jsonObject.get("constructiontype").toString();
				pView.setconstructionType(constructionType);
				session.setAttribute("constructiontype", constructionType);
			}
			if(jsonObject.has("neworexistingbuild")) {
				neworexistingbuild = jsonObject.get("neworexistingbuild").toString();
				pView.setNeworexistingbuild(neworexistingbuild);
				session.setAttribute("neworexistingbuild", neworexistingbuild);
			}
			if(jsonObject.has("avgHeight")) {
				avgHeight = jsonObject.get("avgHeight").toString();
				pView.setAvgHeight(avgHeight);
				session.setAttribute("avgHeight", avgHeight);
			}
			if(jsonObject.has("heightOrArea")) {
				heightOrArea = jsonObject.get("heightOrArea").toString();
				pView.setHeightOrArea(heightOrArea);
				session.setAttribute("heightOrArea", heightOrArea);
			}
			if(jsonObject.has("movieTheatre")) {
				movieTheatre = Integer.parseInt(jsonObject.get("movieTheatre").toString());
				pView.setMovieTheatre(movieTheatre);
				session.setAttribute("movieTheatre", movieTheatre);
			}
			if(jsonObject.has("entertainment")) {
				entertainment = Integer.parseInt(jsonObject.get("entertainment").toString());
				pView.setEntertainment(entertainment);
				session.setAttribute("entertainment", entertainment);
			}
			if(jsonObject.has("conStructure")) {
				conStructure = Integer.parseInt(jsonObject.get("conStructure").toString());
				pView.setConStructure(conStructure);
				session.setAttribute("conStructure", conStructure);
			}
			if(jsonObject.has("extBalcony")) {
				extBalcony = Integer.parseInt(jsonObject.get("extBalcony").toString());
				pView.setExtBalcony(extBalcony);
				session.setAttribute("extBalcony", extBalcony);
			}
			if(jsonObject.has("egressBalcony")) {
				egressBalcony = Integer.parseInt(jsonObject.get("egressBalcony").toString());
				pView.setEgressBalcony(egressBalcony);
				session.setAttribute("egressBalcony", egressBalcony);
			}
			if(jsonObject.has("roofPortionOccupiable")) {
				roofPortionOccupiable = Integer.parseInt(jsonObject.get("roofPortionOccupiable").toString());
				pView.setRoofPortionOccupiable(roofPortionOccupiable);
				session.setAttribute("roofPortionOccupiable", roofPortionOccupiable);
			}
			if(jsonObject.has("fireAlarm")) {
				fireAlarm = Integer.parseInt(jsonObject.get("fireAlarm").toString());
				pView.setFireAlarm(fireAlarm);
				session.setAttribute("fireAlarm", fireAlarm);
			}
			
						
			try {
				if(!isInserted) {
					Connection conn = DBConnect.connect();
					if (conn != null) {
			            System.out.println("Database connection is successful !!!!");
			            
			            String sql="insert into buildingdata(userid,projectid,sprinklertype,constructiontype,neworexistingbuild,avgheight,heightorareaincrease,movietheatre,entertainment,constructure,egressbalcony,extbalcony,roofportion,firealarm,created_at) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)" ;
			            	            
			            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			                
		                pstmt.setInt(1, userId);
		                pstmt.setInt(2, projectId);
		                pstmt.setString(3, sprinklerType);
		                pstmt.setString(4, constructionType);
		                pstmt.setString(5, neworexistingbuild);
		                pstmt.setString(6, avgHeight);
		                pstmt.setString(7, heightOrArea);
		                pstmt.setInt(8, movieTheatre);
		                pstmt.setInt(9, entertainment);
		                pstmt.setInt(10, conStructure);
		                pstmt.setInt(11, extBalcony);
		                pstmt.setInt(12, egressBalcony);
		                pstmt.setInt(13, roofPortionOccupiable);
		                pstmt.setInt(14, fireAlarm);
		                
		                int count = pstmt.executeUpdate();
		                if(count == 1)
		                {
		                    // get candidate id
		                    ResultSet rs = pstmt.getGeneratedKeys();
		                    if(rs.next()) {
		                    	buildingdataId = rs.getInt(1);
		                    	isInserted = true;
								session.setAttribute("isInserted", isInserted);
		                    }
		                }
					}
				}
				
				session.setAttribute("projectView", pView);

			}catch (Exception e) {

				e.printStackTrace();

			}
		}


// This will redirect to heightandareas page
	@RequestMapping(value = "/beforeheightandareas", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String beforeheightandareas(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println(buildingComps);
		
		JSONObject outputJsonObj = new JSONObject();
		
		buildingDataCommon(buildingComps, request, response);
		
		outputJsonObj.put("outputPage", "heightandareas");

		return outputJsonObj.toString();

	}
	
//	This will increment floorNo
		@RequestMapping(value = "/incrementFloorNo", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String incrementFloorNo(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		HttpSession session = request.getSession();
		JSONObject output = new JSONObject();
		JSONObject jsonObject = new JSONObject(buildingComps);
		String floorNoStr = (String) session.getAttribute("floorNo");
		Integer floorNo = Integer.parseInt(floorNoStr);
		System.out.println("======floorNo==before update===" + floorNo);
		floorNo += 1;
		output.put("floorNo", String.valueOf(floorNo));
		session.setAttribute("floorNo", String.valueOf(floorNo));
		System.out.println("======floorNo===after update==" + output.toString());
		return output.toString();
	}

//		This will redirect to project details page
	@RequestMapping(value = "/projectdetails", method = RequestMethod.GET)
	public  String projectdetails(HttpServletRequest request, HttpServletResponse response) {

		return "projectdetails";
	}
	
	
	
//	This will rename the selected project name
	@RequestMapping(value = "/renameProject", method = RequestMethod.GET)
	public  String renameProject(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		//int userId = Integer.parseInt(request.getParameter("userId"));
		//int projectId = Integer.parseInt(request.getParameter("projectId"));
		int userId = 0;
		int projectId = 0;
		String inputuserId = request.getParameter("inputuserId");
		if(inputuserId != null && !"".equalsIgnoreCase(inputuserId)) {
			userId = Integer.parseInt(inputuserId);
		}
		String inputprojectId = request.getParameter("inputprojectId");
		if(inputprojectId != null && !"".equalsIgnoreCase(inputprojectId)) {
			projectId = Integer.parseInt(inputprojectId);
		}
		String projectName = request.getParameter("projectname");
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
	            String sql = "update projects set projectname = ? where userid = ? and id = ?";
	            
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            preparedStmt.setString(1, projectName);
	            preparedStmt.setInt(2, userId);
	            preparedStmt.setInt(3, projectId);

	            // execute the java prepared statement
	            preparedStmt.executeUpdate();
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		List<ProjectView> projectList = projectslistPage(request, userId);
		//session.setAttribute("projectId", projectId);
		session.setAttribute("projectList", projectList);
		
		return "viewprojects";
	}
	
	
	
//	This will create a copy of the project in projects table
	@RequestMapping(value = "/duplicateProject", method = RequestMethod.GET)
	public String duplicateProject(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(request.getParameter("userId"));
		int projectId = Integer.parseInt(request.getParameter("projectId"));
		String projectName = request.getParameter("projectName");
		Date currentDate = getCurrentDate();
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
	            String sql = "insert into projects(userid, projectname, jurisdiction, codeyear, created_at) select userid, concat(?,'_copy'),jurisdiction, codeyear, NOW() from projects where userid = ? and id = ?";
	            
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            preparedStmt.setString(1, projectName);
	            preparedStmt.setInt(2, userId);
	            preparedStmt.setInt(3, projectId);

	            // execute the java prepared statement
	            int rowCount = preparedStmt.executeUpdate();
	            
	            if(rowCount == 1) {
		            List<ProjectView> projectList = projectslistPage(request, userId);
		    		session.setAttribute("projectList", projectList);
		    		response.sendRedirect("/codecompilance/viewProjects");
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return "viewprojects";
	}
	
	
	
//	This will delete the project from projects table
	@RequestMapping(value = "/deleteProject", method = RequestMethod.GET)
	public  String deleteProject(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(request.getParameter("userId"));
		int projectId = Integer.parseInt(request.getParameter("projectId"));
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
	            String sql = "DELETE FROM projects WHERE userid = ? and id = ?";
	            
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            preparedStmt.setInt(1, userId);
	            preparedStmt.setInt(2, projectId);

	            // execute the java prepared statement
	            int rowCount = preparedStmt.executeUpdate();
	            if(rowCount == 1) {
	            	System.out.println("Project Deleted successfully");
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		List<ProjectView> projectList = projectslistPage(request, userId);
		session.setAttribute("projectList", projectList);
		
		return "viewprojects";
	}
	
	
	//	This will redirect to project details page
	@RequestMapping(value = "/viewProjectDetails", method = RequestMethod.GET)
	public  String viewProjectDetails(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int userId = 0;
		int projectId = 0;
		if(request.getParameter("userId") != null && request.getParameter("userId") != "") {
			userId = Integer.parseInt(request.getParameter("userId").toString());
			projectId = Integer.parseInt(request.getParameter("projectId").toString());
		}else if(session.getAttribute("userId") != null && session.getAttribute("userId") != "") {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
			projectId = Integer.parseInt(session.getAttribute("projectId").toString());
		}
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
	            String sql = "select pr.*, st.state_name from projects pr left join tblstates st on pr.jurisdiction = st.id where pr.userid = "+userId+ " and pr.id ="+projectId;
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	                ProjectView pView = new ProjectView();
					pView.setUserId(rs.getInt("userid"));
					pView.setProjectId(rs.getInt("id"));
					pView.setProjectName((String) rs.getString("projectname"));
					pView.setJurisdiction((String) rs.getString("state_name"));
					pView.setCodeYear((String) rs.getString("codeyear"));
					session.setAttribute("projectView", pView);
					session.setAttribute("selectedState", pView.getJurisdiction());
	            }
	            //System.out.println("projectList ::::::::::::"+projectList);
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		// This method will get all the building Data for the given project Id and user id 
		getBuildingData(request, userId, projectId);
		
		// This method will get all the build field details for the given project Id and user id 
		getBuildFieldsData(request, userId, projectId);
		
		// This method will get the wall segment details for the given project Id and user id 
		getWallSegmentDetails(request, userId, projectId);
		
		showProcessedDXF(userId, projectId, request,response);
		
		List<ProjectView> projectList = projectslistPage(request, userId);
		session.setAttribute("projectId", projectId);
		session.setAttribute("projectList", projectList);
		
		return "projectdetails";
	}
	
//	This will redirect to project details page
	@RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
	public String viewProfile(String userId, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		UserView userView = new UserView();
		int userid = 0;
		if(userId != null) {
			userid = Integer.parseInt(userId);
		}
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            String sql="select * from users where id = "+userid;
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	                
	                userView.setUserId(rs.getInt("id"));
	                userView.setFirstName(rs.getString("firstname"));
	                userView.setCompany(rs.getString("company"));
	                userView.setEmail(rs.getString("email"));
	                userView.setPlan(rs.getString("plan"));
	                userView.setAddress(rs.getString("address"));
	                userView.setStreet(rs.getString("street"));
	                userView.setCity(rs.getString("city"));
	                userView.setStatename(rs.getString("statename"));
	                userView.setPhone(rs.getString("phone"));
	                userView.setZipcode(rs.getString("zipcode"));
	            }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("userView", userView);
		return "home";
	}
	
	
//	This will redirect to bookmarks page
	@RequestMapping(value = "/viewBookmarks", method = RequestMethod.GET)
	public  String viewBookmarks(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(request.getParameter("userId"));
		List<BookmarkView> bookmarkList = new ArrayList<BookmarkView>();
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            //String sql = "select * from bookmarks where userid = "+userId+" and actiontype = 'bookmark'";
	            String sql = "select bm.id, bm.userid, bm.created_at, bm.actiontype, sts.state_name, bks.book_title, chps.chapter_name, sbchps.subchapter_title, \r\n" + 
	            		"sbchpsc.subchaptersection_title, sbchpsbsc.subchaptersubsection_title from bookmarks bm \r\n" + 
	            		"left join tblstates sts on bm.stateid = sts.id left join tblbooks bks on bks.id = bm.bookid \r\n" + 
	            		"left join tblchapters chps on chps.id = bm.chapter left join tblsubchapters sbchps on \r\n" + 
	            		"bm.section = sbchps.id left join tblsubchaptersections sbchpsc on sbchpsc.id = bm.subsection \r\n" + 
	            		"left join tblsubchapterssubsections sbchpsbsc on sbchpsbsc.id = bm.subsubsection \r\n" + 
	            		"where bm.userid = "+userId+" and bm.actiontype = 'bookmark' order by bm.created_at desc;";
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	BookmarkView bView = new BookmarkView();
	            	bView.setBookMarkId(rs.getInt("id"));
	                bView.setUserId(rs.getInt("userid"));
	                bView.setStateId(rs.getString("state_name"));
	                bView.setBookId(rs.getString("book_title"));
	                bView.setChapter(rs.getString("chapter_name"));
	                bView.setSection(rs.getString("subchapter_title"));
	                bView.setSubSection(rs.getString("subchaptersection_title"));
	                bView.setSubsubSection(rs.getString("subchaptersubsection_title"));
	                bView.setCreatedTime(rs.getTimestamp("created_at"));
	                bView.setActionType(rs.getString("actiontype"));
	                bookmarkList.add(bView);
					
	            }
	            session.setAttribute("bookmarkList", bookmarkList);
	            System.out.println("bookmarkList ::::::::::::"+bookmarkList);
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return "bookmarks";
	}

	
//	This will redirect to Comments page
	@RequestMapping(value = "/viewComments", method = RequestMethod.GET)
	public  String viewComments(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(request.getParameter("userId"));
		List<BookmarkView> commentsList = new ArrayList<BookmarkView>();
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            //String sql = "select * from bookmarks where userid = "+userId+" and actiontype = 'comment'";
	            String sql = "select bm.id, bm.userid, bm.comments, bm.created_at, bm.actiontype, sts.state_name, bks.book_title, chps.chapter_name, sbchps.subchapter_title, \r\n" + 
	            		"sbchpsc.subchaptersection_title, sbchpsbsc.subchaptersubsection_title from bookmarks bm \r\n" + 
	            		"left join tblstates sts on bm.stateid = sts.id left join tblbooks bks on bks.id = bm.bookid \r\n" + 
	            		"left join tblchapters chps on chps.id = bm.chapter left join tblsubchapters sbchps on \r\n" + 
	            		"bm.section = sbchps.id left join tblsubchaptersections sbchpsc on sbchpsc.id = bm.subsection \r\n" + 
	            		"left join tblsubchapterssubsections sbchpsbsc on sbchpsbsc.id = bm.subsubsection \r\n" + 
	            		"where bm.userid = "+userId+" and bm.actiontype = 'comment' order by bm.created_at desc;";
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	BookmarkView bView = new BookmarkView();
	            	bView.setBookMarkId(rs.getInt("id"));
	                bView.setUserId(rs.getInt("userid"));
	                bView.setStateId(rs.getString("state_name"));
	                bView.setBookId(rs.getString("book_title"));
	                bView.setChapter(rs.getString("chapter_name"));
	                bView.setSection(rs.getString("subchapter_title"));
	                bView.setSubSection(rs.getString("subchaptersection_title"));
	                bView.setSubsubSection(rs.getString("subchaptersubsection_title"));
	                bView.setCreatedTime(rs.getTimestamp("created_at"));
	                bView.setComments(rs.getString("comments"));
	                bView.setActionType(rs.getString("actiontype"));
	                commentsList.add(bView);
					
	            }
	            session.setAttribute("commentsList", commentsList);
	            System.out.println("commentsList ::::::::::::"+commentsList);
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return "comments";
	}	
	

//	This will redirect to egress page
	@RequestMapping(value = "/beforeegress", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String beforeegress(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		
		JSONObject outputJsonObj = new JSONObject();
		HttpSession session = request.getSession();
		
		buildingDataCommon(buildingComps, request, response);
		
		// create ProjectBuildData table with all the building fields
		
		boolean isInserted = false;
		if(session.getAttribute("isInserted") != null) {
			isInserted = (boolean) session.getAttribute("isInserted");
		}
		if(!isInserted) {
			createProjectBuildData(buildingComps, request, response);
		}
		
		buildingWallSegment(buildingComps, request, response);
		outputJsonObj.put("outputPage", "egress");

		return outputJsonObj.toString();

	}
	
//	This method will create buildingWallsegment
public @ResponseBody void buildingWallSegment(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		HttpSession session = request.getSession();
		
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		int projectId = Integer.parseInt(session.getAttribute("projectId").toString());
		int partyWall = 0;
		
		JSONObject jsonObject = new JSONObject(buildingComps);
		List<WallSegmentDetails> wallSegData = new ArrayList<WallSegmentDetails>();
		
		try {
				
		JSONArray wallSegmentDetailsArray = (JSONArray) jsonObject.getJSONArray("wallSegmentDetails");
		WallSegmentDetails wallSegmentData = new WallSegmentDetails();
		
		Connection conn = DBConnect.connect();
		
		for (int i = 0; i < wallSegmentDetailsArray.length(); i++) {
			JSONObject wallSegment = (JSONObject) wallSegmentDetailsArray.get(i);
			
			String wallSeg = (String) wallSegment.get("wallSegment");
			String length = (String) wallSegment.get("length");
			String wallFace = (String) wallSegment.get("wallFace");
			String wallDistFrom = (String) wallSegment.get("wallDistFrom");
			String wallDistTo = (String) wallSegment.get("wallDistTo");
			String isPartyOn = wallSegment.get("partyWall").toString();
			if(isPartyOn == "on") {
				partyWall = 1;
			}
			
			int wallSegmentId = 0;
			
			wallSegmentData.setWallSegment(wallSeg);
			wallSegmentData.setLength(length);
			wallSegmentData.setWallFace(wallFace);
			wallSegmentData.setWallDistFrom(wallDistFrom);
			wallSegmentData.setWallDistTo(wallDistTo);
			wallSegmentData.setPartyWall(partyWall);
			
			wallSegData.add(wallSegmentData);

			if (conn != null) {
	            System.out.println("Database connection is successful !!!!");
	            
	            String sql="insert into wallsegments(userid,projectid,wallsegment,length,wallfaces,walldistancefrom,walldistanceto,partywall,created_at) values(?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)" ;
	            	            
	            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
	                
                pstmt.setInt(1, userId);
                pstmt.setInt(2, projectId);
                pstmt.setString(3, wallSeg);
                pstmt.setString(4, length);
                pstmt.setString(5, wallFace);
                pstmt.setString(6, wallDistFrom);
                pstmt.setString(7, wallDistTo);
                pstmt.setInt(8, partyWall);
                		                
                int count = pstmt.executeUpdate();
                if(count == 1)
                {
                    // get candidate id
                    ResultSet rs = pstmt.getGeneratedKeys();
                    if(rs.next())
                    	wallSegmentId = rs.getInt(1);
                }
			}
		}

		} catch (Exception e) {

			e.printStackTrace();

		}
		session.setAttribute("wallsegmentdata", wallSegData);
	}


//This method will getWallSegmentDetails from wall segment table
public @ResponseBody void getWallSegmentDetails(HttpServletRequest request, int userId, int projectId) {
	
	HttpSession session = request.getSession();
			
	List<WallSegmentDetails> wallSegList = new ArrayList<WallSegmentDetails>();
	
	//JSONArray wallSegmentDetailsArray = (JSONArray) jsonObject.getJSONArray("wallSegmentDetails");
	WallSegmentDetails wallSegmentData = new WallSegmentDetails();
 	try {
		
		Connection conn = DBConnect.connect();
		if (conn != null) {
            Statement st=(Statement) conn.createStatement();

            String sql="select * from wallsegments where userid = "+userId+ " and projectid ="+projectId ;
            ResultSet rs=st.executeQuery(sql);
            while (rs.next()) {
            	       		
        		wallSegmentData.setWallSegment(rs.getString("wallsegment"));
        		wallSegmentData.setLength(rs.getString("length"));
        		wallSegmentData.setWallFace(rs.getString("wallfaces"));
        		wallSegmentData.setWallDistFrom(rs.getString("walldistancefrom"));
        		wallSegmentData.setWallDistTo(rs.getString("walldistanceto"));
        		wallSegmentData.setPartyWall(rs.getInt("partywall"));
        		
        		wallSegList.add(wallSegmentData);
            }
            System.out.println("wallSegList ::::::::::::"+wallSegList);
         }
	}catch (Exception e) {

		e.printStackTrace();

	}
	session.setAttribute("wallsegmentdata", wallSegList);
}


//This will get the building data for the given user id and project id
@RequestMapping(value = "/getBuildingData", method = RequestMethod.GET, produces = "application/json")
public @ResponseBody void getBuildingData(HttpServletRequest request, int userId, int projectId) {
	HttpSession session = request.getSession();
	List<BuildingComposition> bCompList = new ArrayList<BuildingComposition>();
	List<FloorDetails> output = new ArrayList<FloorDetails>();
	FloorDetails fDet = new FloorDetails();
	try {
		Connection conn = DBConnect.connect();
		if (conn != null) {
            Statement st=(Statement) conn.createStatement();

            String sql="select * from buildingcomposition where userid = "+userId+ " and projectid ="+projectId ;
            ResultSet rs=st.executeQuery(sql);
            while (rs.next()) {
            	BuildingComposition bComp = new BuildingComposition();
            	bComp.setFloor(rs.getString("floor"));
				bComp.setStoryHeight(rs.getString("storyheight"));
				bComp.setSpaceName(rs.getString("spacename"));
				bComp.setOccupancy(rs.getString("occupancy"));
				bComp.setFunctionOfSpace(rs.getString("functionOfSpace"));
				bComp.setGross(rs.getString("gross"));
				bComp.setNetOccupaintLoad(rs.getString("netOccupaintLoad"));
				bComp.setNextComponentWithPath(rs.getString("nextComponentWithPath"));
				//bComp.setType(type);
				bCompList.add(bComp);
            }
            System.out.println("bCompList ::::::::::::"+bCompList);
         }
		fDet.setbList(bCompList);
		output.add(fDet);

	}  catch (Exception e) {

		e.printStackTrace();

	}
	
	session.setAttribute("buildingdata", output);
	session.setAttribute("bbuildingdata", output);
}


//This will get all the build field values for the given user id and project id
@RequestMapping(value = "/getBuildFieldsData", method = RequestMethod.GET, produces = "application/json")
public @ResponseBody void getBuildFieldsData(HttpServletRequest request, int userId, int projectId) {
	HttpSession session = request.getSession();
	
	List<ProjectView> output = new ArrayList<ProjectView>();
	
	try {
		ProjectView pView = new ProjectView();
		Connection conn = DBConnect.connect();
		if (conn != null) {
            Statement st=(Statement) conn.createStatement();

            String sql="select * from buildingdata where userid = "+userId+ " and projectid ="+projectId ;
            ResultSet rs=st.executeQuery(sql);
            while (rs.next()) {
            	pView.setSprinklerType(rs.getString("sprinklerType"));
            	
        		pView.setconstructionType(rs.getString("constructionType"));
        		pView.setNeworexistingbuild(rs.getString("neworexistingbuild"));
        		pView.setAvgHeight(rs.getString("avgheight"));
        		pView.setHeightOrArea(rs.getString("heightorareaincrease"));
        		pView.setMovieTheatre(rs.getInt("movietheatre"));
        		pView.setConStructure(rs.getInt("constructure"));
        		pView.setExtBalcony(rs.getInt("extbalcony"));
        		pView.setEgressBalcony(rs.getInt("egressbalcony"));
        		pView.setRoofPortionOccupiable(rs.getInt("roofportion"));
        		pView.setEntertainment(rs.getInt("entertainment"));
        		pView.setFireAlarm(rs.getInt("firealarm"));
        		
        		output.add(pView);
            }
            System.out.println("output ::::::::::::"+output);
         }

	} catch (Exception e) {

		e.printStackTrace();

	}
	session.setAttribute("projectbuilddata", output);
}


//This will redirect to egress page
	@RequestMapping(value = "/egress", method = RequestMethod.GET)
	public  String egress(HttpServletRequest request, HttpServletResponse response) {

		return "egress";
	}

//	This will redirect to fireratings page
	@RequestMapping(value = "/beforefireratings", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String beforefireratings(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		JSONObject outputJsonObj = new JSONObject();
		
		HttpSession session = request.getSession();
		
		boolean isUpdated = false;
		if(session.getAttribute("isUpdated") != null) {
			isUpdated = (boolean) session.getAttribute("isUpdated");
		}
		
		buildingDataCommon(buildingComps, request, response);
		
		if(!isUpdated) {
			updateProjectBuildData(buildingComps, request, response);
		}
		
		outputJsonObj.put("outputPage", "fireratings");

		return outputJsonObj.toString();

	}

//	This will redirect to fireratings
	@RequestMapping(value = "/fireratings", method = RequestMethod.GET)
	public  String fireratings(HttpServletRequest request, HttpServletResponse response) {

		return "fireratings";
	}

//	This is used to redirect to plumbing page
	@RequestMapping(value = "/beforeplumbing", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String beforeplumbing(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		
		JSONObject outputJsonObj = new JSONObject();
		
		buildingDataCommon(buildingComps, request, response);
		
		outputJsonObj.put("outputPage", "plumbing");

		return outputJsonObj.toString();

	}

//	This is also used to redirect to plumbing page
	@RequestMapping(value = "/plumbing", method = RequestMethod.GET)
	public  String plumbing(HttpServletRequest request, HttpServletResponse response) {

		return "plumbing";
	}

//	This is used to create BuildingComp 
	@RequestMapping(value = "/createBuildingComp", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public @ResponseBody String createBuildingComp(@RequestBody String buildingComps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(buildingComps);
		HttpSession session = request.getSession();
		
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		int projectId = Integer.parseInt(session.getAttribute("projectId").toString());
		
		JSONObject jsonObject = new JSONObject(buildingComps);
		JSONObject outputJsonObj = new JSONObject();
		List<FloorDetails> output = new ArrayList<FloorDetails>();
		boolean isBuilddataInserted = false;
		boolean isInserted = false;

		List<BuildingComposition> projectBuildCompList = new ArrayList<BuildingComposition>();
		
		JSONArray buildingCompArr = (JSONArray) jsonObject.getJSONArray("buildingComp");
		for (int i = 0; i < buildingCompArr.length(); i++) {
			BuildingComposition buildCompData = new BuildingComposition();
			JSONObject buildingComp = (JSONObject) buildingCompArr.get(i);
			String floor = (String) buildingComp.get("floor");
			buildCompData.setFloor(floor);
			String storyHeight = (String) buildingComp.get("storyHeight");
			buildCompData.setStoryHeight(storyHeight);
			String spaceName = (String) buildingComp.get("spaceName");
			buildCompData.setSpaceName(spaceName);
			String occupancy = (String) buildingComp.get("occupancy");
			buildCompData.setOccupancy(occupancy);
			String functionOfSpace = (String) buildingComp.get("functionOfSpace");
			buildCompData.setFunctionOfSpace(functionOfSpace);
			String gross = (String) buildingComp.get("gross");
			buildCompData.setGross(gross);
			String netOccupaintLoad = (String) buildingComp.get("netOccupaintLoad");
			buildCompData.setNetOccupaintLoad(netOccupaintLoad);
			String nextComponentWithPath = (String) buildingComp.get("nextComponentWithPath");
			buildCompData.setNextComponentWithPath(nextComponentWithPath);
			projectBuildCompList.add(buildCompData);
			
			int buildingCompId = 0;
			
			try {
				
				Connection conn = DBConnect.connect();
				if (conn != null) {
		            System.out.println("Database connection is successful !!!!");
		            
		            		            
			            String sql="insert into buildingcomposition(userid,projectid,floor,storyheight,spacename,occupancy,functionOfSpace,gross,netOccupaintLoad,nextComponentWithPath,created_at) values(?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)" ;
			            	            
			            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			                
		                pstmt.setInt(1, userId);
		                pstmt.setInt(2, projectId);
		                pstmt.setString(3, floor);
		                pstmt.setString(4, storyHeight);
		                pstmt.setString(5, spaceName);
		                pstmt.setString(6, occupancy);
		                pstmt.setString(7, functionOfSpace);
		                pstmt.setString(8, gross);
		                pstmt.setString(9, netOccupaintLoad);
		                pstmt.setString(10, nextComponentWithPath);
		                
		                int count = pstmt.executeUpdate();
		                if(count == 1)
		                {
		                    // get candidate id
		                    ResultSet rs = pstmt.getGeneratedKeys();
		                    if(rs.next()) {
		                    	buildingCompId = rs.getInt(1);
		                    	isInserted = true;
		                    	session.setAttribute("isInserted", isInserted);
		                    	conn.close();
		                    }
		                }

				}
			} catch (Exception e) {

				e.printStackTrace();

			}

		}
		
		if(jsonObject.has("corridorDetails")) {
			JSONArray corridorDetailsArray = (JSONArray) jsonObject.getJSONArray("corridorDetails");
			for (int i = 0; i < corridorDetailsArray.length(); i++) {
				JSONObject buildingComp = (JSONObject) corridorDetailsArray.get(i);
				String floor = (String) buildingComp.get("floor");
				String storyHeight = (String) buildingComp.get("storyHeight");
				String corridor = (String) buildingComp.get("corridor");
				String corridorSpace = (String) buildingComp.get("corridorSpace");
				String transtype = "corridor";
				int buildingTransId = 0;
				boolean isCorridorInserted = false;
							
				try {					
								
					Connection conn = DBConnect.connect();
					if (conn != null) {
			            System.out.println("Database connection is successful !!!!");
			            
			            String sql="insert into buildingtrans(userid,projectid,floor,storyheight,transtype,transtypevalue,spaces,created_at) values(?,?,?,?,?,?,?,CURRENT_TIMESTAMP)" ;
			            	            
			            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			                
		                pstmt.setInt(1, userId);
		                pstmt.setInt(2, projectId);
		                pstmt.setString(3, floor);
		                pstmt.setString(4, storyHeight);
		                pstmt.setString(5, transtype);
		                pstmt.setString(6, corridor);
		                pstmt.setString(7, corridorSpace);
		                		                
		                int count = pstmt.executeUpdate();
		                if(count == 1)
		                {
		                    // get candidate id
		                    ResultSet rs = pstmt.getGeneratedKeys();
		                    if(rs.next()) {
		                    	buildingTransId = rs.getInt(1);
		                    	isCorridorInserted = true;
		                    	session.setAttribute("isCorridorInserted", isCorridorInserted);
		                    	conn.close();
		                    }
		                }
					}
	
				}catch (Exception e) {
	
					e.printStackTrace();
	
				}
	
			}
		}
		
		if(jsonObject.has("stairwayDetails")) {
			JSONArray stairwayDetailsArray = (JSONArray) jsonObject.getJSONArray("stairwayDetails");
			for (int i = 0; i < stairwayDetailsArray.length(); i++) {
				JSONObject buildingComp = (JSONObject) stairwayDetailsArray.get(i);
				String floor = (String) buildingComp.get("floor");
				String storyHeight = (String) buildingComp.get("storyHeight");
				String stairway = (String) buildingComp.get("stairway");
				String transtype = "stairways";
				boolean isStairwayInserted = false;
							
				try {
					
					Connection conn = DBConnect.connect();
					if (conn != null) {
			            System.out.println("Database connection is successful !!!!");
			            
			            String sql="insert into buildingtrans(userid,projectid,floor,storyheight,transtype,transtypevalue,spaces,created_at) values(?,?,?,?,?,?,?,CURRENT_TIMESTAMP)" ;
			            	            
			            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			                
			            pstmt.setInt(1, userId);
		                pstmt.setInt(2, projectId);
		                pstmt.setString(3, floor);
		                pstmt.setString(4, storyHeight);
		                pstmt.setString(5, transtype);
		                pstmt.setString(6, stairway);
		                pstmt.setString(7, "");
		                		                
		                int count = pstmt.executeUpdate();
		                int bungTransId = 0;
		                if(count == 1)
		                {
		                    // get candidate id
		                    ResultSet rs = pstmt.getGeneratedKeys();
		                    if(rs.next()) {
		                    	bungTransId = rs.getInt(1);
		                    	isStairwayInserted = true;
		                    	session.setAttribute("isStairwayInserted", isStairwayInserted);
		                    	conn.close();
		                    }
		                }
					}
				} catch (Exception e) {
	
					e.printStackTrace();
	
				}
	
			}
		}
		
		if(jsonObject.has("exitDetails")) {
			JSONArray exitDetailsArray = (JSONArray) jsonObject.getJSONArray("exitDetails");
			for (int i = 0; i < exitDetailsArray.length(); i++) {
				JSONObject buildingComp = (JSONObject) exitDetailsArray.get(i);
				String floor = (String) buildingComp.get("floor");
				String storyHeight = (String) buildingComp.get("storyHeight");
				String exit = (String) buildingComp.get("exit");
				String transtype = "exit";
											
				try {
					
					Connection conn = DBConnect.connect();
					if (conn != null) {
			            System.out.println("Database connection is successful !!!!");
			            
			            String sql="insert into buildingtrans(userid,projectid,floor,storyheight,transtype,transtypevalue,spaces,created_at) values(?,?,?,?,?,?,?,CURRENT_TIMESTAMP)" ;
			            	            
			            PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			                
			            pstmt.setInt(1, userId);
		                pstmt.setInt(2, projectId);
		                pstmt.setString(3, floor);
		                pstmt.setString(4, storyHeight);
		                pstmt.setString(5, transtype);
		                pstmt.setString(6, exit);
		                pstmt.setString(7, "");
		                		                
		                int count = pstmt.executeUpdate();
		                int bTransId = 0;
		                if(count == 1)
		                {
		                    // get candidate id
		                    ResultSet rs = pstmt.getGeneratedKeys();
		                    if(rs.next())
		                    	bTransId = rs.getInt(1);
		                }
					}
				} catch (Exception e) {
	
					e.printStackTrace();
	
				}
	
			}
		}
		
		// create ProjectBuildData table with all the building fields
		
		if(session.getAttribute("isBuilddataInserted") != null) {
			isBuilddataInserted = (boolean) session.getAttribute("isBuilddataInserted");
		}
		if(!isBuilddataInserted && jsonObject.has("sprinklertype")) {
			createProjectBuildData(buildingComps, request, response);
		}
		
		viewProjectDetails(request,response);
		outputJsonObj.put("outputPage", "projectdetails");

		return outputJsonObj.toString();
	}
	
//	This will redirect to login page
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request, HttpServletResponse response) {
		setSiteUrl(request, response);
		return "login";

	}

//	This will redirect to signup page
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String singupPage(HttpServletRequest request, HttpServletResponse response) {
		setSiteUrl(request, response);
		String plan = request.getParameter("plan");
		request.setAttribute("plan", plan);
		return "signup";

	}
// This will redirect to home page
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(HttpServletRequest request, HttpServletResponse response) {
		return home(request, response);
		//return "home";
	}	
	
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profile(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		int userId = 0;
		if(session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		String username = request.getParameter("username");
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String mobile = request.getParameter("mobile");
		String zipcode = request.getParameter("zipcode");
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
				String sql = "update users set firstname = ?, company = ?, address = ?, street = ?, city = ?, statename = ?, phone = ?, zipcode = ?, updated_at = CURRENT_TIMESTAMP where id = ?";
				
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            
	            preparedStmt.setString(1, username);
	            preparedStmt.setString(2, company);
	            preparedStmt.setString(3, address);
	            preparedStmt.setString(4, street);
	            preparedStmt.setString(5, city);
	            preparedStmt.setString(6, state);
	            preparedStmt.setString(7, mobile);
	            preparedStmt.setString(8, zipcode);
	            preparedStmt.setInt(9, userId);
	            
	            // execute the java prepared statement
	            int rowCount = preparedStmt.executeUpdate();
	            
	            if(rowCount == 1) {
	            	System.out.println("Profile updated successfully");
	            	request.setAttribute("userStatus", "Your profile has been updated");
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		String user = Integer.toString(userId);
		String profile = viewProfile(user, request, response);
		return "updateprofile";
	}
	
	
	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public String changepassword(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		String newpassword = request.getParameter("newpassword");
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            
	            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
				String sql = "update users set password = ? where id = ?";
				
	            PreparedStatement preparedStmt = conn.prepareStatement(sql);
	            
	            preparedStmt.setString(1, newpassword);
	            preparedStmt.setInt(2, userId);
	            //preparedStmt.setString(3, oldpassword);
	            
	            // execute the java prepared statement
	            int rowCount = preparedStmt.executeUpdate();
	            
	            if(rowCount == 1) {
	            	System.out.println("Password updated successfully");
	            	request.setAttribute("userStatus", "Your password has been updated successfully");
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		return "changepassword";

	}
	
	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public String resetpassword(HttpServletRequest request, HttpServletResponse response) {

		//HttpSession session = request.getSession();
		String emailId = request.getParameter("emailId");
		System.out.println("Email id in reset password"+emailId);
		if (emailId != null) {
					
			String newpassword = request.getParameter("newpassword");
			
			try {
				Connection conn = DBConnect.connect();
				if (conn != null) {
		            
		            //String sql="select * from projects where userid = "+userId+ " and id ="+projectId;
					String sql = "update users set password = ? where email = ?";
					
		            PreparedStatement preparedStmt = conn.prepareStatement(sql);
		            
		            preparedStmt.setString(1, newpassword);
		            preparedStmt.setString(2, emailId);
		            //preparedStmt.setString(3, oldpassword);
		            
		            // execute the java prepared statement
		            int rowCount = preparedStmt.executeUpdate();
		            
		            if(rowCount == 1) {
		            	System.out.println("Password updated successfully");
		            	request.setAttribute("userStatus", "Your password has been updated successfully. Please Login");
		            }
				}
			} catch (Exception e) {
	
				e.printStackTrace();
	
			}
		}else {
			System.out.println("Email id can not be retrieved");
        	request.setAttribute("userStatus", "Password reset has been failed");
		}
		return "login";

	}
	
	
	//	This will redirect to forgot password page
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public String forgotpassword(HttpServletRequest request, HttpServletResponse response) {
		//String plan = request.getParameter("plan");
		//request.setAttribute("plan", plan);
		return "forgotpassword";

	}
	
	private String getUserNameByEmail(String emailId) {
		String username = "";
		
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
				Statement st=(Statement) conn.createStatement();
	            String sql = "select firstname from users where email= '"+emailId+"'";
				
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	username = rs.getString("firstname");
	            }
			}
		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return username;
	}
	
//	This will send the email from forgot password page
	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
	public String sendEmail(HttpServletRequest request, HttpServletResponse response) throws MessagingException{
		String emailId = request.getParameter("email");
		String siteurl = request.getSession().getAttribute("siteurl").toString();
		request.setAttribute("email", emailId);
		String userName = getUserNameByEmail(emailId);
		Session session;
		try {
			session = createSession();
		
			String title = "Reset your password for codecomplAI";
			StringBuffer htmlRes = new StringBuffer();
			htmlRes.append("<!doctype html><html lang=\"en-US\"><body><div>Hello "+userName+",</div><div>A request has been made to reset your password.</div>");			
			//htmlRes.append("<a href='home' class='logo logo-light'><span class=\"logo-lg\"><img src=\"assets/images/logo-light.png\" alt=\"logo-light\" height=\"42\"></span></a>");
			htmlRes.append("<div><p style='font: italic small-caps bold 12px/30px Georgia, serif; ;'>Click the button below and you'll be on your way! If you did not make this request, please disregard this email.</p></div>");
			htmlRes.append("<div><a href='http://104.131.0.156:8080/"+siteurl+"/resetpassword?emailId="+emailId+"'style=\"background:#20e277;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:14px;padding:10px 24px;display:inline-block;border-radius:50px;\">Reset Password</a></div>");
			htmlRes.append("</body></html>");
		      //create message using session
		      MimeMessage message = new MimeMessage(session);
		      prepareEmailMessage(message, emailId, title, htmlRes.toString());
	
		      //sending message
		      Transport.send(message);
		      
		      System.out.println("Done");
		      request.setAttribute("fpStatus", "An email has been sent to the entered emailid. Please follow the instructions in the mail to reset the password.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forgotpassword";

	}
	
	 private static void prepareEmailMessage(MimeMessage message, String to, String title, String html)
	          throws MessagingException {
		  String senderEmail = "sagetestmail.123@gmail.com";
	      message.setContent(html, "text/html; charset=utf-8");
	      message.setFrom(new InternetAddress(senderEmail));
	      message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	      message.setSubject(title);
	  }
	 
	 private static Session createSession() throws Exception {
	      Properties props = new Properties();
	      //props.put("mail.smtp.auth", "flase");//Outgoing server requires authentication
	      //props.put("mail.smtp.starttls.enable", "true");//TLS must be activated
	      props.put("mail.smtp.auth", true);
	      props.put("mail.smtp.ssl.enable", true);
	      props.put("mail.smtp.host", "smtp.gmail.com"); //Outgoing server (SMTP) - change it to your SMTP server
	      props.put("mail.smtp.port", "465");//Outgoing port
	      String senderEmail = "sagetestmail.123@gmail.com";
	      String senderPassword= "lkiauxmskvacvqdn";
	      
	       Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	          protected PasswordAuthentication getPasswordAuthentication() {
	              return new PasswordAuthentication(senderEmail, senderPassword);
	          }
	      });
	      
	      //Session session = Session.getInstance(props);
	      return session;
	  }
	
	//This will get keyword search results
	@RequestMapping(value = "/readKeywordSearchRes", method = RequestMethod.GET)
	public @ResponseBody String readKeywordSearchRes(@RequestParam("indexID") String indexID,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("readKeywordSearchRes...");
		HttpSession session = request.getSession();
		JSONArray jsonArr1Search = null;
		Integer index = Integer.valueOf(indexID);
		@SuppressWarnings({ "unchecked", "rawtypes" })
		ArrayList<Map> res = (ArrayList<Map>) session.getAttribute("searchResults");
		System.out.println("res============="+res);
		/*JSONObject jsonObjectSearch1 = new JSONObject(res);
		if (jsonObjectSearch1.isEmpty()) { 
		} else {
			jsonArr1Search = (JSONArray) jsonObjectSearch1.get("results");
		}
		JSONObject result = (JSONObject) jsonArr1Search.getJSONObject(index - 1);
		*/
		
		HashMap map = (HashMap) res.get(index-1);
		String output = (String) map.get("responseVal");
		return output;
	}
	
//	This method will return selected state keyword search results
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selectedStateSearch", method = RequestMethod.GET)
	public /* @ResponseBody */ String selectedStateSearch(HttpServletRequest request, HttpServletResponse response) {
		logger.info("searchBooks...");
		HttpSession session = request.getSession();
		int bookId = 0;
		int book_year = 0;
		String book_title = null;
		String statename = (String)session.getAttribute("selectedState");
		if(session.getAttribute("selectedBookId") != null) {
			bookId = Integer.parseInt(session.getAttribute("selectedBookId").toString());
		}
		String sql = "";
		try {
			String searchString = request.getParameter("rasaSearch");
			List resultsList = new ArrayList<>();
  			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            if(bookId != 0) {
	            	sql = "select bks.book_title, bks.book_year, sbchscsbsc.subchaptersubsection_title, sbchscsbsc.subchaptersubsection_content \r\n" + 
		            		"from tblsubchapterssubsections sbchscsbsc left join tblsubchaptersections sbchsc on \r\n" + 
		            		"sbchscsbsc.subchaptersection_id = sbchsc.id left join tblsubchapters sbchps on \r\n" + 
		            		"sbchsc.subchapter_id = sbchps.id left join tblchapters chps on sbchps.chapter_id = chps.id \r\n" + 
		            		"left join tblbooks bks on chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and\r\n" + 
		            		"bks.id = "+bookId+" and sts.state_name = '"+statename+"' and sbchscsbsc.subchaptersubsection_content like '%"+searchString+"%' \r\n" + 
		            		"where sts.state_name is not null;";
	            }
	            else {
	            	sql = "select bks.book_title, bks.book_year, sbchscsbsc.subchaptersubsection_title, sbchscsbsc.subchaptersubsection_content \r\n" + 
		            		"from tblsubchapterssubsections sbchscsbsc left join tblsubchaptersections sbchsc on \r\n" + 
		            		"sbchscsbsc.subchaptersection_id = sbchsc.id left join tblsubchapters sbchps on \r\n" + 
		            		"sbchsc.subchapter_id = sbchps.id left join tblchapters chps on sbchps.chapter_id = chps.id \r\n" + 
		            		"left join tblbooks bks on chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and\r\n" + 
		            		"sts.state_name = '"+statename+"' and (bks.book_title like '%ibc%' or bks.book_title like '%building%') "
		            		+ "and bks.book_year = (SELECT MAX(book_year) as book_year FROM tblbooks where state_id = \r\n" + 
		            		"(select id from tblstates where state_name='"+statename+"')) and sbchscsbsc.subchaptersubsection_content like '%"+searchString+"%' \r\n" + 
		            		"where sts.state_name is not null;";
	            	
	            }
	            
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	book_title = rs.getString("book_title");
	            	book_year = rs.getInt("book_year");
	            	Map serachResMap = new LinkedHashMap<>();
					serachResMap.put("highlightVal", (String)rs.getString("subchaptersubsection_title"));
					serachResMap.put("responseVal", (String)rs.getString("subchaptersubsection_content"));
//					serachResMap.put("sectionVal", (String) result.get("sectionVal"));
					resultsList.add(serachResMap);
	            }
	            System.out.println("Search Results Query  ::::::::::::"+sql);
	            System.out.println("resultsList ::::::::::::"+resultsList);
	            session.setAttribute("searchResults", resultsList);
	            session.setAttribute("searchString", searchString);
	            session.setAttribute("searchBookTitle", book_title);
	            session.setAttribute("searchBookYear", book_year);
	            }

		} catch (Exception e) {
			logger.debug("==================bookslist failure2==============");
			e.printStackTrace();

		}

		return "StateSearchDetailsPage";

	}	
	
//	This method will return book list for the given keyword search results
	@RequestMapping(value = "/bookTitleSearch", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody ArrayList<Object> bookTitleSearch(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String statename = (String)session.getAttribute("selectedState");
		String bookTitle = request.getParameter("bookTitle");
		
		Book book = null;
		ArrayList<Object> bookList = new ArrayList<>();
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            System.out.println("Database connection is successful !!!!");
	            
	            Statement st=(Statement) conn.createStatement();

	            String sql="select * from tblbooks where state_id = (select id from tblstates where state_name ='"+statename+"') and book_title like '%"+bookTitle+"%' order by book_year desc";
	            ResultSet rs=st.executeQuery(sql);
	            
	            List<String> outputYears = new ArrayList<String>();
	            while (rs.next()) {	            	
	    				LinkedHashMap<Object, Object> bookDet = new LinkedHashMap<>();
	    				book = new Book();
	    				int bookId = rs.getInt("id");
	    				bookDet.put("bookId", bookId);
	    				book.setBookId(bookId);
	    				
	    				@SuppressWarnings("unused")
						String region = rs.getString("book_region");
	    				bookDet.put("regionName", statename);
	    				bookDet.put("region", statename);
	    				
	    				int stateId = rs.getInt("state_id");
	    				bookDet.put("stateId", stateId);
	    				book.setStateId(stateId);
	    				
	    				String bookStr = rs.getString("book_title");
	    				bookDet.put("bookUrl", bookStr);
	    				bookDet.put("bookName", bookStr);
	    				book.setBookName(bookStr);
	    				
	    				String bookYear = rs.getString("book_year");
	    				outputYears.add(bookYear);
	    				bookList.add(bookDet);
	            }
	            request.setAttribute("bookList", bookList);
	            request.setAttribute("yearList", outputYears);
				System.out.println(bookList);
	         }
			session.setAttribute("selectedState", statename);
		} catch (Exception e) {
	         e.printStackTrace();
	    }
		return bookList;
	}

	public static <T> T[] subArray(T[] array, int beg, int end) {
		return Arrays.copyOfRange(array, beg, end + 1);
	}

//		This method will redirect to newproject jsp

	@RequestMapping(value = "/newproject", method = RequestMethod.GET)
	public String newprojectPage(HttpServletRequest request, HttpServletResponse response) {

		return "newproject";

	}
	
	
//	This method will redirect to project view jsp 
	public List<ProjectView> projectslistPage(HttpServletRequest request, int userId) {
		List<ProjectView> projectList = new ArrayList<ProjectView>();
		String sort = request.getParameter("sort");
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            String sql = "select * from projects where userid = "+userId ;
	            if(sort !=null && sort != "") {
	            	sql = "select * from projects where userid = "+userId+" order by created_at "+sort;
	            }
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	                ProjectView pView = new ProjectView();
					pView.setUserId(rs.getInt("userid"));
					pView.setProjectId(rs.getInt("id"));
					pView.setProjectName((String) rs.getString("projectname"));
					pView.setJurisdiction((String) rs.getString("jurisdiction"));
					pView.setCodeYear((String) rs.getString("codeyear"));
					pView.setCreatedAt(rs.getDate("created_at"));
					projectList.add(pView);
	            }
	            System.out.println("projectList ::::::::::::"+projectList);
	         }
		}catch (Exception e) {

			e.printStackTrace();

		}
		return projectList;
	}
	

	//	This method will return the years for the given state 
	@RequestMapping(value = "/getStates", method = RequestMethod.GET)
	public @ResponseBody List<Integer> getStates(@RequestParam String state, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<Integer> yearList = new ArrayList<Integer>();
		System.out.println("state ::::::::::::"+state);
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            String sql = "select distinct book_year from tblbooks where state_id = (select id from tblstates where state_name like '%"+state+"%')";
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	                yearList.add(rs.getInt("book_year"));
	            }
	            System.out.println("yearList ::::::::::::"+yearList);
	         }
		}catch (Exception e) {

			e.printStackTrace();

		}
		session.setAttribute("stae_chatbot", state);
		session.setAttribute("yearList_chatbot", yearList);
		return yearList;
	}
	
	
	//This method will return the years for the given state 
	public JSONObject getCollectionDetails(String state) {
		JSONObject collectionJson = new JSONObject();
		System.out.println("state ::::::::::::"+state);
		try {
			Connection conn = DBConnect.connect();
			if (conn != null) {
	            Statement st=(Statement) conn.createStatement();

	            String sql = "select collection_name, location from tblvectordbcollections where state = '"+state+"'";
	            ResultSet rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	collectionJson.put("collection_name", rs.getString("collection_name"));
	            	collectionJson.put("location", rs.getString("location"));
	            }
	            System.out.println("bookList ::::::::::::"+collectionJson);
	         }
		}catch (Exception e) {
			e.printStackTrace();
		}
		return collectionJson;
	}


	@RequestMapping(value = "/getNodesAndEdges", method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public @ResponseBody String getNodesAndEdges(@RequestParam int bookid, @RequestParam int schapterid, @RequestParam int subChpSecId,  HttpServletRequest request, HttpServletResponse response) {

		JSONArray LinkedIdsJsonArray = new JSONArray();
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
			try {
				
				conn = DBConnect.connect();
				if (conn != null) {
		            st=(Statement) conn.createStatement();

		            String sql = "select subchaptersection_idAndLinkedIds from graphnodesedges where book_id = "+bookid+" and subchapter_id = "+schapterid ;
		            rs=st.executeQuery(sql);
		            while (rs.next()) {
		            	LinkedIdsJsonArray.put(rs.getString("subchaptersection_idAndLinkedIds"));
		            }
				}
			}catch (Exception e) {

				e.printStackTrace();

			}finally {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("LinkedIdsJsonArray-->"+LinkedIdsJsonArray);
			
			JSONObject jsonObject = new JSONObject();
						
			JSONArray nodesjsonArray = new JSONArray();
			JSONArray edgesjsonArray = new JSONArray();
			
			for (int i = 0; i < LinkedIdsJsonArray.length(); i++) {
				HashMap<Integer,String> subChpTitlesMap = new HashMap<Integer,String>();
				
				String node = (String) (LinkedIdsJsonArray.get(i));
				node = node.replace("[", "").replace("]", "").replace(" ", "");
				String[] nodeAr = node.split(",");
				subChpTitlesMap = getSubChapterSecDetails(nodeAr);
				Object myKey = subChpTitlesMap.keySet().toArray()[0];
				if(!hasValue(nodesjsonArray, "id", myKey.toString())) {
					JSONObject nodesjsonObject = new JSONObject();
					nodesjsonObject.put("id", myKey);
					nodesjsonObject.put("label", subChpTitlesMap.get(myKey));
					//nodesjsonObject.put("shape", "dot");
					//nodesjsonObject.put("title", "graph");
					//nodesjsonObject.put("allowedToMoveX", "true");
					//nodesjsonObject.put("allowedToMoveY", "true");
					nodesjsonArray.put(nodesjsonObject);
				}
				
				for (Object obj: subChpTitlesMap.keySet())
				   {
				        Object value = subChpTitlesMap.get(obj);
				        System.out.println(obj + " " + value);
				        if(!obj.equals(myKey)) {
					        JSONObject edgesJSONObject = new JSONObject();
							edgesJSONObject.put("from", myKey);
							edgesJSONObject.put("to", obj);
							edgesjsonArray.put(edgesJSONObject);
				        }
						
						if(!hasValue(nodesjsonArray, "id", obj.toString())) {
							JSONObject extranodesjsonObject = new JSONObject();
							extranodesjsonObject.put("id", obj);
							extranodesjsonObject.put("label", subChpTitlesMap.get(obj));
							nodesjsonArray.put(extranodesjsonObject);
						}
				    }
				/*for(int j=1; j < nodeAr.length;j++) {
					
					
					//nodesjsonArray.put(extranodesjsonObject);
				}*/
				jsonObject.put("edges", edgesjsonArray);
				jsonObject.put("nodes", nodesjsonArray);
			}
			System.out.println("edges-->"+edgesjsonArray);
			System.out.println("nodes-->"+nodesjsonArray);
			System.out.println("nodes and edges-->"+jsonObject);
			
			//Gson gson = new Gson();
			//String jsonString = gson.toJson(jsonObject);
			String jsonString = jsonObject.toString();
			//jsonString = jsonString.replace("\"", "\'");
			System.out.println("jsonString --> " + jsonString);
				    
			return jsonString;			
			
			/*
			Iterator it = nodesAndEdgesMap.entrySet().iterator();
			while (it.hasNext()) {
			    Map.Entry pairs = (Map.Entry)it.next();
			    jsonObject.put(pairs.getKey(), pairs.getValue() );
			}
			
			Gson gson = new Gson();
			String jsonString = gson.toJson(nodesAndEdgesMap);
			System.out.println("jsonString --> " + jsonString);
			
			JSONObject nodesAndEdgesJson = new JSONObject();
			nodesAndEdgesJson.put("nodesandedges",jsonString);
		    System.out.println("nodesandedges JSON -->" + nodesAndEdgesJson); */
	}
	
	@RequestMapping(value = "/getChatbotCall", method = RequestMethod.POST)
	public @ResponseBody String getChatbotCall(@RequestBody String datajson, HttpServletRequest request, HttpServletResponse response) {
		StringBuffer responseStr = new StringBuffer();
		JSONObject collectionJson = new JSONObject();
		//String dataJson = "What is SFRM? ";
		System.out.println("dataJson ->"+datajson);
		
		String state = datajson.split("_")[0];
		System.out.println("state_chatbot ->"+state);
		
		String data = datajson.split("_")[1];
		System.out.println("data ->"+data);
		
		try {
			 collectionJson = getCollectionDetails(state);
			 //String datajsonreq =  "{\"query\": \""+datajson.trim()+"\"}";
			 //Create an instance of QueryData and serialize it to JSON
			 QueryData queryData = new QueryData(data.trim(), state.trim(), collectionJson.get("collection_name").toString(), collectionJson.get("location").toString());
			 ObjectMapper objectMapper = new ObjectMapper();
			 String datajsonreq = objectMapper.writeValueAsString(queryData);
			 System.out.println("datajsonreq ->"+datajsonreq);
			
			URL url = new URL("http://104.131.0.156:5600/chatbot_call"); // for server
			//URL url = new URL("http://localhost:5000/chatbot_call");
			//sudo systemctl restart chatbot.service
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Content-Type", "application/json");
					
            
			OutputStream os = conn.getOutputStream();
            os.write(datajsonreq.getBytes("UTF-8"));
            os.close();
            
            
			int responseCode = conn.getResponseCode();
		    System.out.println("\nSending 'POST' request to URL : " + url);
		    System.out.println("Post parameters : " + datajsonreq);
		    System.out.println("Response Code : " + responseCode);
			if (conn.getResponseCode() != 200) {
				logger.info("Failed to connect to Flask service...");
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;
			logger.info("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				responseStr.append(output);

			}

			conn.disconnect(); 

			

		} catch (MalformedURLException e) {
			logger.debug("===================error==============");
			e.printStackTrace();

		} catch (IOException e) {
			logger.debug("==================error 2 ==============");
			e.printStackTrace();

		}
		System.out.println("Response from chatbot ========="+responseStr.toString());
		return responseStr.toString();
	}
	
	
	
	@RequestMapping(value = "/getNodesAndEdgesForMultiBook", method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public @ResponseBody String getNodesAndEdgesForMultiBook(@RequestParam int bookid, @RequestParam int schapterid,  HttpServletRequest request, HttpServletResponse response) {

		HashMap<Integer, String> book1LinkedIds = new HashMap<Integer, String>();
		ArrayList<String> book2LinkedIds = new ArrayList<String>();
		HashMap<Integer, String> book2edgesList = new HashMap<Integer, String>();
		ArrayList<Integer> book1_subchapsec_ids = new ArrayList<Integer>();
		ArrayList<Integer> book2_subchapsec_ids = new ArrayList<Integer>();
		bookid = 60;
		schapterid = 14342;
		int book2_bookid = 0;
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Statement stmt = null;
		ResultSet rs2 = null;
			try {
				conn = DBConnect.connect();
				if (conn != null) {
		            st=(Statement) conn.createStatement();

		            //String sql = "SELECT * FROM nodesedgessubchaptersections where bookid = "+bookid+" and subchapterid = "+schapterid;
		            String sql = "SELECT distinct nodes.subchaptersection_id, nodes.linkedIds, multinodes.book2_bookid, multinodes.book2_LinkedIds FROM nodesedgessubchaptersections nodes \r\n" + 
		            		"left join graph_multibook_subchaptersections multinodes on multinodes.book1_bookid = nodes.bookid \r\n" + 
		            		"and multinodes.book1_subchapterid = nodes.subchapterid and nodes.subchaptersection_id = multinodes.book1_subchaptersection_id "
		            		+ "where nodes.bookid = "+bookid+" and nodes.subchapterid = "+schapterid+";";
		            rs=st.executeQuery(sql);
		            while (rs.next()) {
		            	book1_subchapsec_ids.add(rs.getInt("subchaptersection_id"));
		            	book1LinkedIds.put(rs.getInt("subchaptersection_id"), rs.getString("linkedIds"));
		            	book2LinkedIds.add(rs.getString("book2_LinkedIds"));
		            	book2_bookid = rs.getInt("book2_bookid");
		            }
		            
		            for (String linkedIds : book2LinkedIds) {
		            	
		            	linkedIds = linkedIds.replace("[", "").replace("]", "").replace(" ", "");
		    			String[] nodeAr = linkedIds.split(",");
		    			String result = "";
		    			for (String s : nodeAr) {
		    			    result += s+",";
		    			}
		    			result = result.substring(0,result.length()-1);
			            // get book2 nodes and edges 
			            stmt = (Statement) conn.createStatement();
			            //String sql2 = "select * from nodesedgessubchaptersections where bookid = "+book2_bookid+" and subchaptersection_id in (66070,66460,65914,67069,65912,66301,65917,67324,66181,66644);";
			            String sql2 = "select * from nodesedgessubchaptersections where bookid = "+book2_bookid+" and subchaptersection_id in ("+result+");";
			            rs2 = stmt.executeQuery(sql2);
			            while (rs2.next()) {
			            	book2edgesList.put(rs2.getInt("subchaptersection_id"), rs2.getString("linkedIds"));
			            	book2_subchapsec_ids.add(rs2.getInt("subchaptersection_id"));
			            	
			            }
		            }
				}
			}catch (Exception e) {

				e.printStackTrace();

			}finally {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			JSONObject nodesAndEdgesJsonForBook1 = buildNodesAndEdgesJson(bookid, book2_bookid, book1_subchapsec_ids, book1LinkedIds, book2_subchapsec_ids, book2edgesList);
			
			String jsonString = nodesAndEdgesJsonForBook1.toString();
			System.out.println("jsonString --> " + jsonString);
			
			/*JSONObject nodesAndEdgesJsonForBook2 = buildNodesAndEdgesJson(book2_bookid, book1_subchapsec_ids, book2LinkedIds);
			
			String jsonString2 = nodesAndEdgesJsonForBook2.toString();
			System.out.println("jsonString --> " + jsonString2);
			
			jsonString += jsonString2;*/
				    
			return jsonString;
			
	}
	
	public JSONObject buildNodesAndEdgesJson(int bookid, int book2_bookid, ArrayList<Integer> book1_subchapsec_ids, HashMap<Integer, String> bookLinkedIds, ArrayList<Integer> book2_subchapsec_ids, HashMap<Integer, String> book2edgesList) {
		
		JSONObject jsonObject = new JSONObject();
		
		JSONArray book1nodesjsonArray = new JSONArray();
		JSONArray book1edgesjsonArray = new JSONArray();
		
		// Adding books 
		JSONObject book1JSONObj = new JSONObject();
		book1JSONObj.put("id", bookid);
		book1JSONObj.put("label", "IBC Book1");
		book1JSONObj.put("group", "switch");
		book1nodesjsonArray.put(book1JSONObj);
		
		JSONObject book2JSONObj = new JSONObject();
		book2JSONObj.put("id", book2_bookid);
		book2JSONObj.put("label", "IRC Book2");
		book2JSONObj.put("group", "switch");
		book1nodesjsonArray.put(book2JSONObj);
		
		JSONObject bookedgeJSONObj = new JSONObject();
		bookedgeJSONObj.put("from", bookid);
		bookedgeJSONObj.put("to", book2_bookid);
		bookedgeJSONObj.put("arrows", "to");
		book1edgesjsonArray.put(bookedgeJSONObj);
		
			
		
		//Adding books json array
		jsonObject = buildNodesAndEdgesForMultiook(jsonObject, bookid, book1_subchapsec_ids, bookLinkedIds, book1nodesjsonArray, book1edgesjsonArray);
		
		 		
		System.out.println("edges-->"+book1edgesjsonArray);
		System.out.println("nodes-->"+book1nodesjsonArray);
		System.out.println("nodes and edges-->"+jsonObject);
		
		
		jsonObject = buildNodesAndEdgesForMultiook(jsonObject, book2_bookid, book2_subchapsec_ids, book2edgesList, book1nodesjsonArray, book1edgesjsonArray);
		
		System.out.println("edges-->"+book1edgesjsonArray);
		System.out.println("nodes-->"+book1nodesjsonArray);
		System.out.println("nodes and edges-->"+jsonObject);
		
		return jsonObject;
	}
	
	
	public JSONObject buildNodesAndEdgesForMultiook(JSONObject jsonObject, int bookid, ArrayList<Integer> book_subchapsec_ids, HashMap<Integer, String> bookLinkedIds, JSONArray book1nodesjsonArray, JSONArray book1edgesjsonArray) {
		
		for(int subchsecId : book_subchapsec_ids) {
			if(!hasValue(book1nodesjsonArray, "id", Integer.toString(subchsecId))) {
				JSONObject nodesjsonObject = new JSONObject();
				nodesjsonObject.put("id", subchsecId);
				nodesjsonObject.put("label", getSubChapterSecTitle(subchsecId));
				nodesjsonObject.put("group", "server");
				book1nodesjsonArray.put(nodesjsonObject);
			}
		}
		
		for (Map.Entry<Integer, String> entry : bookLinkedIds.entrySet()) {
			
			HashMap<Integer,String> subChpTitlesMap = new HashMap<Integer,String>();
		    int key = entry.getKey();
		    			
		    String node = entry.getValue();
			node = node.replace("[", "").replace("]", "").replace(" ", "");
			String[] nodeAr = node.split(",");
			subChpTitlesMap = getSubChapterSecDetails(nodeAr);
			
			if(!hasValue(book1nodesjsonArray, "id", entry.getKey().toString())) {
				JSONObject nodesjsonObject = new JSONObject();
				nodesjsonObject.put("id", key);
				nodesjsonObject.put("label", getSubChapterSecTitle(key));
				nodesjsonObject.put("group", "server");
				book1nodesjsonArray.put(nodesjsonObject);
			}
			
			JSONObject booksJSONObject = new JSONObject();
			booksJSONObject.put("from", bookid);
			booksJSONObject.put("to", key);
			booksJSONObject.put("arrows", "to");
			//booksJSONObject.put("dashes", true);
			booksJSONObject.put("label", "book "+bookid+" nodes");
			book1edgesjsonArray.put(booksJSONObject);
			
			for (Object obj: subChpTitlesMap.keySet())
			   {
			        Object value = subChpTitlesMap.get(obj);
			        System.out.println(obj + " " + value);
			        if(!obj.equals(key) && !hasValue(book1nodesjsonArray, "id", obj.toString())) {
				        JSONObject edgesJSONObject = new JSONObject();
						edgesJSONObject.put("from", key);
						edgesJSONObject.put("to", obj);
						edgesJSONObject.put("arrows", "to");
						//edgesJSONObject.put("dashes", true);
						book1edgesjsonArray.put(edgesJSONObject);
			        }
			        
			        /*if(!obj.equals(key)) {
				        JSONObject book2edgesJSONObject = new JSONObject();
				        book2edgesJSONObject.put("from", 2);
				        book2edgesJSONObject.put("to", obj);
				        book1edgesjsonArray.put(book2edgesJSONObject);
			        }*/
					
					if(!hasValue(book1nodesjsonArray, "id", obj.toString())) {
						JSONObject extranodesjsonObject = new JSONObject();
						extranodesjsonObject.put("id", obj);
						extranodesjsonObject.put("label", subChpTitlesMap.get(obj));
						book1nodesjsonArray.put(extranodesjsonObject);
					}
			    }
			
			jsonObject.put("edges", book1edgesjsonArray);
			jsonObject.put("nodes", book1nodesjsonArray);
		}
		
		System.out.println("edges-->"+book1edgesjsonArray);
		System.out.println("nodes-->"+book1nodesjsonArray);
		System.out.println("nodes and edges-->"+jsonObject);
		
		return jsonObject;
	}

	
	
	public boolean hasValue(JSONArray nodesjsonArray, String key, String value) {
	    for(int i = 0; i < nodesjsonArray.length(); i++) {  // iterate through the JsonArray
	        // first get the 'i' JsonElement as a JsonObject, then get the key as a string and compare it with the value
	        if(((JSONObject) nodesjsonArray.get(i)).get(key).toString().equals(value)) return true;
	    }
	    return false;
	}
	
	
	public String getSubChapterSecTitle(int subChapterSecId) {
		
		Connection conn = null;
		String subChapterSecTitle = null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn = DBConnect.connect();
			if (conn != null) {
	            st=(Statement) conn.createStatement();

	            String sql = "select subchaptersection_no, subchaptersection_title from tblsubchaptersections where id = "+subChapterSecId;
	            rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	subChapterSecTitle = rs.getString("subchaptersection_title");
	            	if(subChapterSecTitle.length() > 15) {
	            		subChapterSecTitle = subChapterSecTitle.substring(0,15);
	            	}
	            	
	            }
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	    return subChapterSecTitle;
	}
	
	public HashMap<Integer,String> getSubChapterSecDetails(String[] subChapterSecIds) {
		HashMap<Integer,String> subChapterSecTitles = new HashMap<Integer,String>();
		
		Connection conn = null;
		String subChapterSecTitle = null;
		Statement st=null;
		ResultSet rs=null;
		String result = "";
		for (String s : subChapterSecIds) {
		    result += s+",";
		}
		result = result.substring(0,result.length()-1);
		try {
			conn = DBConnect.connect();
			if (conn != null) {
	            st=(Statement) conn.createStatement();

	            //String sql = "select subchaptersection_no, subchaptersection_title from tblsubchaptersections where id = "+subChapSecId;
	            String sql = "SELECT id,subchaptersection_title as title FROM tblsubchaptersections where id in ("+result+")";
	            		//+ "UNION\r\n" + 
	            		//"SELECT id,subchaptersubsection_title as title FROM tblsubchapterssubsections where subchaptersection_id in ("+result+");";
	            rs=st.executeQuery(sql);
	            while (rs.next()) {
	            	subChapterSecTitle = rs.getString("title");
	            	if(subChapterSecTitle.length() > 15) {
	            		subChapterSecTitle = subChapterSecTitle.substring(0,15);
	            	}
	            	subChapterSecTitles.put(rs.getInt("id"), subChapterSecTitle);
	            	//subChapterSecTitle = rs.getString("subchaptersection_no");
	            }
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	    return subChapterSecTitles;
	}
	
	@RequestMapping(value = "/getRnodes", method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public @ResponseBody HashMap<String, Map<String, String>> getRnodes(@RequestParam String node, HttpServletRequest request, HttpServletResponse response) {
				
			HashMap<String, Map<String, String>> result = new HashMap<String, Map<String, String>>();
			String nodeJson = null;
			String edgeJson = null;
			try {
				
				String nodeFile = "R_Nodes.txt";
				String edgeFile = "R_Edges.txt";
	 
				BufferedReader reader = new BufferedReader(new InputStreamReader(logger.getClass().getClassLoader().getResourceAsStream(nodeFile)));
			    StringBuilder sb = new StringBuilder();
			    String line = reader.readLine();

			    while (line != null) {
			    	sb.append(line);
			        sb.append("\n");
			        line = reader.readLine();
			        
			    }
			    nodeJson = sb.toString();
			    
			    BufferedReader breader = new BufferedReader(new InputStreamReader(logger.getClass().getClassLoader().getResourceAsStream(edgeFile)));
			    StringBuilder sbedge = new StringBuilder();
			    String edgeline = breader.readLine();

			    while (edgeline != null) {
			    	sbedge.append(edgeline);
			    	sbedge.append("\n");
			    	edgeline = breader.readLine();
			    }
			    edgeJson = sbedge.toString();
			    
			    JSONArray nodeJsonArray = new JSONArray(nodeJson);
			    JSONArray edgeJsonArray = new JSONArray(edgeJson);
			    			    
			    ArrayList<String> nodeArray = new ArrayList<String>();
			    HashMap<String, String> strnd = new HashMap<String, String>();
			    HashMap<String, String> stred = new HashMap<String, String>();
			   
				for (int i = 0; i < nodeJsonArray.length(); i++) {
					
					JSONObject object = nodeJsonArray.getJSONObject(i);  
					String id = (String)object.getString("id");
					if(node != null && node.equalsIgnoreCase(id) && !nodeArray.contains(id)) {
						
						nodeArray.add(id);
						for (int j = 0; j < edgeJsonArray.length(); j++) {
							JSONObject edgeObj = edgeJsonArray.getJSONObject(i);  
							String from = (String)edgeObj.getString("from");
							String to = (String)edgeObj.getString("to");
							if(node.equalsIgnoreCase(from) || node.equalsIgnoreCase(to)) {
								if(!node.equalsIgnoreCase(from) && !nodeArray.contains(from))
									nodeArray.add(from);
								if(!node.equalsIgnoreCase(to) && !nodeArray.contains(to))
									nodeArray.add(to);
							}
						}
					}
				}
				System.out.println("===========node array============  "+nodeArray);  
				
				 for (String k : nodeArray) {
					 for (int i = 0; i < nodeJsonArray.length(); i++) {
							JSONObject object = nodeJsonArray.getJSONObject(i);  
							String id = (String)object.getString("id");
							if(k.equalsIgnoreCase(id) && !strnd.containsValue(id)) {
								strnd.put("id", id);
								strnd.put("label", id);
								strnd.put("shape", "dot");
								strnd.put("title", "Transfer Systems");
								strnd.put("allowedToMoveX", "true");
								strnd.put("allowedToMoveY", "true");
								for (int j = 0; j < edgeJsonArray.length(); j++) {
									JSONObject edgeObj = edgeJsonArray.getJSONObject(j);  
									String from = (String)edgeObj.getString("from");
	
									String to = (String)edgeObj.getString("to");
									if(k.equalsIgnoreCase(from) || k.equalsIgnoreCase(to)) {
										if(!stred.containsValue(from)) {
											stred.put("from", from);
										}
										if(!stred.containsValue(to)) {
											stred.put("to", to);
										}
									}
								}
								}
							}
				 }

				 result.put("nodes", strnd);
				 result.put("edges", stred);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
			    
			}
			System.out.println("===========result============  "+result);
			return result;
	}
}
