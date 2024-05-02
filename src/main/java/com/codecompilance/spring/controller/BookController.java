package com.codecompilance.spring.controller;

import java.util.Properties;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
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
	//int pStateId = 0;
	//int pBookId = 0;

//	This method is used to get book details for the given stateId and region Id
	@RequestMapping(value = "/getBookDetails", method = RequestMethod.GET)
	public @ResponseBody String getBookDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		JSONObject outputJsonObj = new JSONObject();
		StringBuffer chapterList = null;
		JSONArray chapterListAsJson = new JSONArray();
		int chapterId = 0;
		JSONArray resultSetAsJson = new JSONArray();
		String regionName = request.getParameter("regionName");
		session.setAttribute("selectedRegionId", regionName);
		
		
		try {
			if (request.getParameter("stateId") != null && request.getParameter("bookId") != null) {
				int state_Id = Integer.parseInt(request.getParameter("stateId"));
				int bookId = Integer.parseInt(request.getParameter("bookId"));
				if(request.getParameter("chapterId") != null) {
					chapterId = Integer.parseInt(request.getParameter("chapterId"));
				}else {
					chapterId = getChapterId(bookId);
				}
				
				session.setAttribute("selectedStateId", state_Id);
				session.setAttribute("selectedBookId", bookId);
				if(request.getParameter("subchaptersection_no") != null)
				{
					int subchaptersection_no = Integer.parseInt(request.getParameter("subchaptersection_no"));
					if(subchaptersection_no != 0) {
						outputJsonObj = getNewChapterDetails(request, response, state_Id, bookId, subchaptersection_no);
					}
				}/*else if(session.getAttribute("chapterList") != null && session.getAttribute("resultSetAsJson") != null){
					//return "ChapterView";
					outputJsonObj.put("outputPage", "ChapterView");
					return outputJsonObj.toString();
				}*/
				else {
					resultSetAsJson = getChapterDetails(request, response, bookId, state_Id, chapterId);
					chapterListAsJson = getChaptersList(request, response, bookId, state_Id);
					chapterList = processChaptersList(chapterListAsJson, state_Id, bookId, 0, 0);
					session.setAttribute("resultSetAsJson", resultSetAsJson);
					session.setAttribute("chapterListAsJson", chapterListAsJson);
					session.setAttribute("chapterList", chapterList);
				}
				System.out.println("chapterList-->" + chapterList);
				logger.debug("resultSetAsJson and chapterListAsJson from getBookDetails");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		outputJsonObj.put("outputPage", "ChapterView");
		return outputJsonObj.toString();
		//return "ChapterView";
	}

	private StringBuffer processChaptersList(JSONArray chapterListAsJson, int state_Id, int bookId, int chaptId, int subchapterId) {
		StringBuffer html = new StringBuffer();
		int sameChapter = 0;
		int chapterId = 0;
		html.append("<ul class='m-0 p-0'>");
		for (int i = 0; i < chapterListAsJson.length(); i++) {

			if (chaptId == Integer.parseInt(chapterListAsJson.getJSONObject(i).get("chapterid").toString())) {
				html.append("<li id='" + chapterListAsJson.getJSONObject(i).get("chapterid") + "' class='active'>");
			} else if(chaptId == 0 && chapterId == 0) {
				html.append("<li id='" + chapterListAsJson.getJSONObject(i).get("chapterid") + "' class='active'>");
			} else {
				html.append("<li id='" + chapterListAsJson.getJSONObject(i).get("chapterid") + "'>");
			}

			if (chapterId == Integer.parseInt(chapterListAsJson.getJSONObject(i).get("chapterid").toString())) {
				sameChapter = 1;
			} else {
				sameChapter = 0;
			}
			
			if(subchapterId != 0 && subchapterId == Integer.parseInt(chapterListAsJson.getJSONObject(i).get("subchapterid").toString())) {
				html.append("<li><a href='#"+subchapterId+"'>"
						+ chapterListAsJson.getJSONObject(i).get("subchapter_title") + "</a></li>");
			} else if (sameChapter == 0) {
				html.append("<h3><a href='#" + chapterListAsJson.getJSONObject(i).get("subchapterid") + "' onClick='javascript:getChapterDetails("+state_Id+", "+bookId+", "+chapterListAsJson.getJSONObject(i).get("chapterid")+", "+chapterListAsJson.getJSONObject(i).get("subchapterid")+")'>" + chapterListAsJson.getJSONObject(i).get("chapter_name")
						+ "</a></h3><ul><li><a href='#" + chapterListAsJson.getJSONObject(i).get("subchapterid") + "'>"
						+ chapterListAsJson.getJSONObject(i).get("subchapter_title") + "</a></li>");
			} else {
				html.append("<li><a href='#" + chapterListAsJson.getJSONObject(i).get("subchapterid") + "'>"
						+ chapterListAsJson.getJSONObject(i).get("subchapter_title") + "</a></li>");
			}
			chapterId = Integer.parseInt(chapterListAsJson.getJSONObject(i).get("chapterid").toString());

			if ((i + 1) < chapterListAsJson.length()) {
				if (chapterId != Integer.parseInt(chapterListAsJson.getJSONObject(i + 1).get("chapterid").toString())) {
					html.append("</ul></li>");
				}
			}
		}
		html.append("</ul>");
		return html;
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
				/*
				 * String sql =
				 * "select chps.id as chapterId, chps.chapter_name, chps.chapter_title from tblchapters chps where "
				 * + "chps.book_id = "
				 * +bookId+" and chps.chapter_name is not null order by chps.sequence;";
				 */

				String sql = "select chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, \r\n"
						+ "chps.sequence, chps.chapter_title, chps.chapter_name, subchps.id as subchapterId, \r\n"
						+ "subchps.subchapter_title from tblsubchapters subchps left join tblchapters chps on \r\n"
						+ "chps.id = subchps.chapter_id left join tblbooks bks on chps.book_id = bks.id left join \r\n"
						+ "tblstates sts on bks.state_id = sts.id and sts.id = " + stateId + " and bks.id = " + bookId
						+ " and chps.id = subchps.chapter_id \r\n"
						+ "where bks.id is not null and sts.id is not null and chps.id is not null order by chps.sequence;";

				rs = st.executeQuery(sql);
				if (rs.next())
					chapterListAsJson = convertToJSON(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return chapterListAsJson;
	}

//	This will return Chapter details of selected chapter
	@RequestMapping(value = "/getChapterDetails", method = RequestMethod.POST)
	public JSONArray getChapterDetails(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId, int chapterId) {
		HttpSession session = request.getSession();
		// JSONObject outputJsonObj = new JSONObject();
		List<Chapter> chapterList = new ArrayList<Chapter>();
		JSONArray resultSetAsJson = new JSONArray();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnect.connect();
			if (conn != null) {
				st = (Statement) conn.createStatement();
				
				/*String sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, bks.book_title, chps.sequence, chps.chapter_title, chps.chapter_name, "
						+ "subchps.id as subchapterId, subchps.subchapter_title, subchps.subchapter_content, sbchsec.id as subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, \r\n"
						+ "sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content,"
						+ " tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content "
						+ "from tblsubchapterssubsubsections tblsbchsbsbsec left join tblsubchapterssubsections tblsbchsbsec on tblsbchsbsbsec.subchaptersubsection_id = tblsbchsbsec.id \r\n"
						+ " left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left join tblsubchapters subchps on "
						+ "sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n"
						+ "chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id where "
						+ "sts.id = "+ stateId + " and bks.id = " + bookId + " and "
						+ "chps.id = subchps.chapter_id and bks.id is not null and sts.id is not null and chps.id is not null "
						+ "order by chps.sequence, tblsbchsbsec.id, tblsbchsbsbsec.id;"; */
						
				
				String sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, bks.book_title, chps.sequence, "
						+ "chps.chapter_title, chps.chapter_name, subchps.id as subchapterId, subchps.subchapter_title, subchps.subchapter_content, sbchsec.id as "
						+ "subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, "
						+ "tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content, tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id "
						+ "as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content from tblchapters chps "
						+ "inner join tblsubchapters subchps on subchps.chapter_id = chps.id " 
						+ "inner join tblsubchaptersections sbchsec on subchps.id = sbchsec.subchapter_id left join \r\n" + 
						"tblsubchapterssubsections tblsbchsbsec on sbchsec.id = tblsbchsbsec.subchaptersection_id \r\n" + 
						"left join tblsubchapterssubsubsections tblsbchsbsbsec on tblsbchsbsec.id = tblsbchsbsbsec.subchaptersubsection_id \r\n" + 
						"inner join tblbooks bks on chps.book_id = bks.id inner join tblstates sts on bks.state_id = sts.id \r\n" + 
						"where sts.id = "+stateId+" and bks.id = "+bookId+" and chps.id = "+chapterId+" and chps.id = subchps.chapter_id and bks.id is not null and \r\n" + 
						" sts.id is not null and chps.id is not null order by chps.sequence, subchps.id, sbchsec.id, tblsbchsbsec.id, \r\n" + 
						" tblsbchsbsbsec.id;"; 

				rs = st.executeQuery(sql);
				if (rs.next()) {
					resultSetAsJson = convertToJSON(rs);
				// resultSetAsJsonObj.put("resultSetAsJson", resultSetAsJson);
				}
			}

		} catch (SQLException sqe) {
			sqe.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		session.setAttribute("chapterList", chapterList);
		return resultSetAsJson;
	}

//		This will return section details of selected chapter id
	@RequestMapping(value = "/getSectionDetails", method = RequestMethod.GET)
	public @ResponseBody String getSectionDetails(@RequestParam String chapterId, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		int chaptId = Integer.parseInt(request.getParameter("chapterId"));
		int sectionId = 0;
		if (request.getParameter("sectionId") != null && request.getParameter("sectionId") != "") {
			sectionId = Integer.parseInt(request.getParameter("sectionId"));
		}
		System.out.println("===========chapterId==========" + chaptId);
		System.out.println("===========sectionId==========" + sectionId);
		JSONArray sectionDetailsList = new JSONArray();
		if (chaptId != 0) {
			Connection conn = null;
			Statement st = null;
			ResultSet rs = null;
			try {
				conn = DBConnect.connect();
				if (conn != null) {
					st = (Statement) conn.createStatement();

					String sql = "select id, subchapter_title from tblsubchapters where chapter_id = " + chaptId
							+ " and subchapter_title is not null";

					rs = st.executeQuery(sql);
					while (rs.next()) {
						JSONObject obj = new JSONObject();
						obj.put("subchapter_id", rs.getInt("id"));
						obj.putOnce("subchapter_title", rs.getString("subchapter_title"));
						sectionDetailsList.put(obj);
					}
				}

				/*
				 * if(sectionId != 0) { chapterList = getSubSectionDetails(request, response,
				 * chaptId, sectionId); if(!chapterList.isEmpty()) {
				 * session.setAttribute("chapterList", chapterList);
				 * //session.setAttribute("chpList", chapterList); } }
				 */

			} catch (SQLException sqe) {
				sqe.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("sectionDetailsList" + sectionDetailsList);
		}
		session.setAttribute("sectionDetailsList", sectionDetailsList);
		return sectionDetailsList.toString();
		// return "ChapterView";
	}

	public static JSONArray convertToJSON(ResultSet resultSet) throws Exception {
		JSONArray jsonArray = new JSONArray();
		do {
			int total_columns = resultSet.getMetaData().getColumnCount();
			JSONObject obj = new JSONObject();
			for (int i = 0; i < total_columns; i++) {
				obj.put(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getObject(i + 1));
			}
			jsonArray.put(obj);
		}while (resultSet.next());
		return jsonArray;
	}

//	This will return Chapter details of selected chapter
	@RequestMapping(value = "/showSectionDetailsForNode", method = RequestMethod.GET)
	public @ResponseBody String showSectionDetailsForNode(HttpServletRequest request, HttpServletResponse response) {
		JSONObject outputJsonObj = new JSONObject();
		HttpSession session = request.getSession();
		int newStateId = Integer.parseInt(request.getParameter("newStateId"));
		int newBookId = Integer.parseInt(request.getParameter("newBookId"));
		int newChapterId = 0;
		int subchapterId = Integer.parseInt(request.getParameter("subchapterId"));
		
		if (request.getParameter("stateId") != null && request.getParameter("bookId") != null) {
			int state_Id = Integer.parseInt(request.getParameter("stateId"));
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			if(request.getParameter("newChapterId") != null) {
				newChapterId = Integer.parseInt(request.getParameter("newChapterId"));
			}
			StringBuffer chapterList = null;
			JSONArray chapterListAsJson = new JSONArray();
			if(newBookId == bookId &&  newStateId == state_Id) {
				if (session.getAttribute("chapterListAsJson") != null) {
					chapterListAsJson = (JSONArray) session.getAttribute("chapterListAsJson");
					chapterList = processChaptersList(chapterListAsJson, newStateId, newBookId, newChapterId, subchapterId);
				}
				session.setAttribute("chapterList", chapterList);
				System.out.println("chapterList-->" + chapterList);
				logger.debug("resultSetAsJson and chapterListAsJson from show section details for node");
			}else {
				try {
					return getBookDetails(request, response);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		outputJsonObj.put("chapterList", "chapterList");
		outputJsonObj.put("outputPage", "ChapterView");
		return outputJsonObj.toString();
	}
	
	private int getChapterId(int bookId) {
		Statement st = null;
		Connection conn = null;
		ResultSet rs = null;
		conn = DBConnect.connect();
		int chapterId = 0;
		if (conn != null) {
			try {
				st = conn.createStatement();
				String sql = "SELECT MIN(id) as chapter_id FROM tblchapters where book_id = "+bookId;
	
				rs = st.executeQuery(sql);
				if (rs.next()) {
					chapterId = rs.getInt("chapter_id");
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return chapterId;
	}
	
	private JSONObject getNewChapterDetails(HttpServletRequest request, HttpServletResponse response, int state_Id, int bookId, int subchaptersection_no){

		HttpSession session = request.getSession();
		JSONObject outputJsonObj = new JSONObject();
		StringBuffer chapterList = null;
		JSONArray chapterListAsJson = new JSONArray();
		JSONArray resultSetAsJson = new JSONArray();
		
		int newStateId = 0; //3
		int newBookId = 0; //75
		int newChapterId = 0; //2147
		int newSubChapterId = 0; //12636
		
		Statement st = null;
		Connection conn = null;
		ResultSet rs = null;
		
		try {
		conn = DBConnect.connect();
		
		if (conn != null) {
			st = conn.createStatement();
			
			String sql = "SELECT tbks.state_id, tsubchpsec.book_id, tsbchps.chapter_id, tsubchpsec.subchapter_id FROM tblsubchaptersections tsubchpsec \r\n" + 
					"left join tblsubchapters tsbchps on tsbchps.id = tsubchpsec.subchapter_id left join tblbooks tbks \r\n" + 
					"on tbks.id = tsbchps.book_id where tsubchpsec.id = "+subchaptersection_no;

			rs = st.executeQuery(sql);
			if (rs.next()) {
				newStateId = rs.getInt("state_id");
				newBookId = rs.getInt("book_id");
				newChapterId = rs.getInt("chapter_id");
				newSubChapterId = rs.getInt("subchapter_id");
			}
		}
		
		if(newBookId == bookId && newStateId == state_Id) {
			if (session.getAttribute("chapterListAsJson") != null) {
				chapterListAsJson = (JSONArray) session.getAttribute("chapterListAsJson");
				chapterList = processChaptersList(chapterListAsJson, state_Id, bookId, newChapterId, newSubChapterId);
			}
			session.setAttribute("chapterList", chapterList);
			System.out.println("chapterList-->" + chapterList);
			logger.debug("resultSetAsJson and chapterListAsJson from show section details for node");
			outputJsonObj.put("chapterList", chapterList);
			outputJsonObj.put("outputPage", "ChapterView");
			return outputJsonObj;
		}else {
			resultSetAsJson = getChapterDetails(request, response, newBookId, newStateId, newChapterId);
			chapterListAsJson = getChaptersList(request, response, newBookId, newStateId);
			chapterList = processChaptersList(chapterListAsJson, newStateId, newBookId, newChapterId, newSubChapterId);
			session.setAttribute("resultSetAsJson", resultSetAsJson);
			session.setAttribute("chapterListAsJson", chapterListAsJson);
			session.setAttribute("chapterList", chapterList);
		}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		outputJsonObj.put("outputPage", "ChapterView");
		return outputJsonObj;
	}

}