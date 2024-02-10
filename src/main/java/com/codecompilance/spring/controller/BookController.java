package com.codecompilance.spring.controller;


import java.util.Properties;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.codecompilance.spring.model.Chapter;


@Controller
public class BookController {
	private static final Logger logger = Logger.getLogger(HomeController.class);
	Properties prop = new Properties();
	InputStream inputStream;
	String propFileName = "dbconnection.properties";
	
//	This method is used to get book details for the given stateId and region Id
	@RequestMapping(value = "/getBookDetails", method = RequestMethod.GET)
	public String getBookDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		String regionName = request.getParameter("regionName");
		String bookUrl = request.getParameter("bookUrl");
		int state_Id = Integer.parseInt(request.getParameter("stateId"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		JSONArray resultSetAsJson = new JSONArray();
		JSONArray chapterListAsJson = new JSONArray();
		
		session.setAttribute("selectedRegionId", regionName);
		session.setAttribute("selectedBookUrl", bookUrl);
		session.setAttribute("selectedBookTitle", bookUrl);
		session.setAttribute("selectedStateId", state_Id);
		session.setAttribute("selectedBookId", bookId);
		
		try {
			chapterListAsJson = getChaptersList(request, response, bookId, state_Id);
			resultSetAsJson = getChapterDetails(request, response, bookId, state_Id);
			session.setAttribute("resultSetAsJson", resultSetAsJson);
			session.setAttribute("chapterListAsJson", chapterListAsJson);
			logger.debug("resultSetAsJson-->"+resultSetAsJson);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("resultSetAsJson-->"+resultSetAsJson);
		System.out.println("chapterListAsJson-->"+chapterListAsJson);
		//response.sendRedirect("ChapterView");
		return "ChapterView";
	}
	
	public JSONArray getChaptersList(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId) {
		Statement st = null;
		Connection conn = null;
		ResultSet rs = null;
		JSONArray chapterListAsJson = new JSONArray();
		try {
			conn = DBConnect.connect();
			if (conn != null) {
	            st = conn.createStatement();
	            /*String sql = "select chps.id as chapterId, chps.chapter_name, chps.chapter_title from tblchapters chps where "
	            		+ "chps.book_id = "+bookId+" and chps.chapter_name is not null order by chps.sequence;";*/
	            
	            String sql = "select chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, \r\n" + 
	            		"chps.sequence, chps.chapter_title, chps.chapter_name, subchps.id as subchapterId, \r\n" + 
	            		"subchps.subchapter_title from tblsubchapters subchps left join tblchapters chps on \r\n" + 
	            		"chps.id = subchps.chapter_id left join tblbooks bks on chps.book_id = bks.id left join \r\n" + 
	            		"tblstates sts on bks.state_id = sts.id and sts.id = "+stateId+" and bks.id = "+bookId+" and chps.id = subchps.chapter_id \r\n" + 
	            		"where bks.id is not null and sts.id is not null and chps.id is not null order by chps.sequence;";
	            
	            rs = st.executeQuery(sql);
	            if(rs.next())
	            	chapterListAsJson = convertToJSON(rs);
	            /*while (rs.next()) {
	            	StringBuilder chaptid = new StringBuilder();
	            	int chpId = rs.getInt("chapterId");
	            	chaptid.append(chpId);
	            	chaptid.append("__");
	            	chapterNamesList.add(chaptid+rs.getString("chapter_title"));
	            	chapSecMap.put(rs.getInt("chapterId")+"-"+rs.getString("chapter_title").toUpperCase(), rs.getInt("chapterId"));
	            }*/
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
		System.out.println("Chapters List --->"+chapterListAsJson);
		return chapterListAsJson;
	}

//	This will return Chapter details of selected chapter
	  @RequestMapping(value = "/getChapterDetails", method = RequestMethod.GET)
	  public JSONArray getChapterDetails(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId) 
	  {
		  HttpSession session = request.getSession();
		  //JSONObject outputJsonObj = new JSONObject(); 
		  List<Chapter> chapterList = new ArrayList<Chapter>();
		  JSONArray resultSetAsJson = new JSONArray();
		  
		  Connection conn = null;
		  Statement st = null;
		  ResultSet rs = null;
		  try 
		  {
			  conn = DBConnect.connect();
			  if (conn != null) {
				  st =(Statement) conn.createStatement();
				  String sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, chps.sequence, chps.chapter_title, chps.chapter_name, "
				  		+ "subchps.id as subchapterId, subchps.subchapter_title, subchps.subchapter_content, sbchsec.id as subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, \r\n" + 
						"sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content,"
						+ " tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content "
						+ "from tblsubchapterssubsubsections tblsbchsbsbsec left join tblsubchapterssubsections tblsbchsbsec on tblsbchsbsbsec.subchaptersubsection_id = tblsbchsbsec.id \r\n" + 
						" left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left join tblsubchapters subchps on "
						+ "sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n" + 
						"chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and sts.id = "+stateId+" and bks.id = "+bookId+" and "
						+ "chps.id = subchps.chapter_id where bks.id is not null and sts.id is not null and chps.id is not null "
						+ "order by chps.sequence, tblsbchsbsec.id, tblsbchsbsbsec.id;";
					
					
					rs=st.executeQuery(sql);
					if(rs.next())
						resultSetAsJson = convertToJSON(rs);
					//resultSetAsJsonObj.put("resultSetAsJson", resultSetAsJson);
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
			//System.out.println("sectionDetailsList"+sectionDetailsList);
			session.setAttribute("chapterList", chapterList);
		    System.out.println("chapterList -->"+chapterList);
		    //session.setAttribute("sectionDetailsList", sectionDetailsList);
		    return resultSetAsJson;
	}
	  
	  
//		This will return section details of selected chapter id
		  @RequestMapping(value = "/getSectionDetails", method = RequestMethod.GET)
		  public @ResponseBody String getSectionDetails(@RequestParam String chapterId, HttpServletRequest request, HttpServletResponse response)
		  {
			  HttpSession session = request.getSession();
			  int chaptId = Integer.parseInt(request.getParameter("chapterId"));
			  int sectionId = 0;
			  if(request.getParameter("sectionId") != null && request.getParameter("sectionId") !="") {
				  sectionId = Integer.parseInt(request.getParameter("sectionId"));
			  }
			  System.out.println("===========chapterId=========="+chaptId);
			  System.out.println("===========sectionId=========="+sectionId);
			  JSONArray sectionDetailsList = new JSONArray();
			  if(chaptId != 0) {
				  Connection conn = null;
				  Statement st = null;
				  ResultSet rs = null;
				  try
				  {
					  conn = DBConnect.connect();
					  if (conn != null) {
						  st =(Statement) conn.createStatement();
				          
						  String sql = "select id, subchapter_title from tblsubchapters where chapter_id = "+chaptId+" and subchapter_title is not null";
							
							rs=st.executeQuery(sql);
				            while (rs.next()) {
				            	JSONObject obj = new JSONObject();
				            	obj.put("subchapter_id", rs.getInt("id"));
				            	obj.putOnce("subchapter_title", rs.getString("subchapter_title"));
				            	sectionDetailsList.put(obj);
				            }
						}
					  
					 /* if(sectionId != 0) {
						  chapterList = getSubSectionDetails(request, response, chaptId, sectionId);
						  if(!chapterList.isEmpty()) {
							  session.setAttribute("chapterList", chapterList);
							  //session.setAttribute("chpList", chapterList);
						  }
					  } */
					  
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
			  }
			  session.setAttribute("sectionDetailsList", sectionDetailsList);
			  return sectionDetailsList.toString();
			  //return "ChapterView";
	}
		  
	public static JSONArray convertToJSON(ResultSet resultSet)
            throws Exception {
        JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            int total_columns = resultSet.getMetaData().getColumnCount();
            JSONObject obj = new JSONObject();
            for (int i = 0; i < total_columns; i++) {
                obj.put(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getObject(i + 1));
            }
          jsonArray.put(obj);
        }
        return jsonArray;
    }

}