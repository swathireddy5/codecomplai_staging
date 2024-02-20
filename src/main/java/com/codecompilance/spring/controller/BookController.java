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

//	This method is used to get book details for the given stateId and region Id
	@RequestMapping(value = "/getBookDetails", method = RequestMethod.GET)
	public String getBookDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("flag")!= null && "false".equalsIgnoreCase(session.getAttribute("flag").toString())) {
			// Do Nothing
			
		}else {
		
			String regionName = request.getParameter("regionName");
			if (request.getParameter("stateId") != null && request.getParameter("bookId") != null) {
				int state_Id = Integer.parseInt(request.getParameter("stateId"));
				int bookId = Integer.parseInt(request.getParameter("bookId"));
				JSONArray resultSetAsJson = new JSONArray();
				StringBuffer chapterList = null;
	
				session.setAttribute("selectedRegionId", regionName);
				session.setAttribute("selectedStateId", state_Id);
				session.setAttribute("selectedBookId", bookId);
	
				try {
					chapterList = getChaptersList(request, response, bookId, state_Id, 0);
					resultSetAsJson = getChapterDetails(request, response, bookId, state_Id);
					session.setAttribute("resultSetAsJson", resultSetAsJson);
					session.setAttribute("chapterList", chapterList);
					//System.out.println("chapterList-->" + chapterList);
					logger.debug("resultSetAsJson and chapterListAsJson from getBookDetails");
				} catch (Exception e) {
					e.printStackTrace();
				}
				// System.out.println("resultSetAsJson-->"+resultSetAsJson);
				// System.out.println("chapterListAsJson-->"+chapterListAsJson);
				// response.sendRedirect("ChapterView");
				return "ChapterView";
			}
		}
		
		return "ChapterView";
	}

	private StringBuffer processChaptersList(JSONArray chapterListAsJson, int chapterId) {
		StringBuffer html = new StringBuffer();
		int sameChapter = 0;
		html.append("<ul class='m-0 p-0'>");
		for (int i = 0; i < chapterListAsJson.length(); i++) {

			if (chapterId == 0) {
				html.append("<li id='" + chapterListAsJson.getJSONObject(i).get("chapterid") + "' class='active'>");
			} else {
				html.append("<li id='" + chapterListAsJson.getJSONObject(i).get("chapterid") + "'>");
			}

			if (chapterId == Integer.parseInt(chapterListAsJson.getJSONObject(i).get("chapterid").toString())) {
				sameChapter = 1;
			} else {
				sameChapter = 0;
			}

			if (sameChapter == 0) {
				html.append("<h3><a href='#'>" + chapterListAsJson.getJSONObject(i).get("chapter_title")
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

	public StringBuffer getChaptersList(HttpServletRequest request, HttpServletResponse response, int bookId,
			int stateId, int chapterId) {
		Statement st = null;
		Connection conn = null;
		ResultSet rs = null;
		JSONArray chapterListAsJson = new JSONArray();
		StringBuffer chapterList = null;

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
				if (!chapterListAsJson.isEmpty()) {
					chapterList = processChaptersList(chapterListAsJson, chapterId);
				}
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
		return chapterList;
	}

//	This will return Chapter details of selected chapter
	@RequestMapping(value = "/getChapterDetails", method = RequestMethod.POST)
	public JSONArray getChapterDetails(HttpServletRequest request, HttpServletResponse response, int bookId, int stateId) {
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
				String sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, chps.sequence, chps.chapter_title, chps.chapter_name, "
						+ "subchps.id as subchapterId, subchps.subchapter_title, subchps.subchapter_content, sbchsec.id as subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, \r\n"
						+ "sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content,"
						+ " tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content "
						+ "from tblsubchapterssubsubsections tblsbchsbsbsec left join tblsubchapterssubsections tblsbchsbsec on tblsbchsbsbsec.subchaptersubsection_id = tblsbchsbsec.id \r\n"
						+ " left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left join tblsubchapters subchps on "
						+ "sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n"
						+ "chps.book_id = bks.id left join tblstates sts on bks.state_id = sts.id and sts.id = "
						+ stateId + " and bks.id = " + bookId + " and "
						+ "chps.id = subchps.chapter_id where bks.id is not null and sts.id is not null and chps.id is not null "
						+ "order by chps.sequence, tblsbchsbsec.id, tblsbchsbsbsec.id;";

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
	@RequestMapping(value = "/showSectionDetailsForNode", method = RequestMethod.POST)
	public @ResponseBody String showSectionDetailsForNode(HttpServletRequest request, HttpServletResponse response) {
		JSONObject outputJsonObj = new JSONObject();
		StringBuffer chapterList = null;
		JSONArray resultSetAsJson = new JSONArray();
		//String flag = "false";

		HttpSession session = request.getSession();
		if (request.getParameter("subchaptersection_no") != null) {
			int state_Id = Integer.parseInt(request.getParameter("stateId"));
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			int chapterId = Integer.parseInt(request.getParameter("chapterId"));;
			int subchapter_id = Integer.parseInt(request.getParameter("subchapter_id"));
			int subchaptersection_no = Integer.parseInt(request.getParameter("subchaptersection_no"));
			String regionName = null;
			Connection conn = null;
			Statement st = null;
			ResultSet rs = null;
			String sql = null;
			try {
				conn = DBConnect.connect();
				if (conn != null) {
					st = (Statement) conn.createStatement();

					  sql = "select *, sbchsc.subchapter_id, sbchps.subchapter_title, bks.state_id as stateId, sbchsc.book_id, bks.book_title, bks.book_region, "
					  		+ "sbchps.id as subchapterId , sbchps.chapter_id as chapterId, sbchsc.subchaptersection_title, sbchsc.subchaptersection_content,\r\n"
					  +  "sbchsbsc.subchaptersubsection_title, sbchsbsc.subchaptersubsection_content \r\n"
					  + "from tblsubchaptersections sbchsc left join tblsubchapters sbchps on \r\n"
					  + "sbchsc.subchapter_id = sbchps.id left join tblbooks bks on bks.id = sbchsc.book_id "
					  + "left join tblsubchapterssubsections sbchsbsc on sbchsbsc.subchaptersection_id = sbchsc.id "
					  + "left join tblsubchapterssubsubsections sbchsbsbsc on sbchsbsc.id = sbchsbsbsc.subchaptersubsection_id where sbchsc.id = "+subchaptersection_no;
					 

//					sql = "select distinct chps.id as chapterId, sts.id as stateId, sts.state_name as State, bks.id as bookId, chps.sequence, chps.chapter_title, chps.chapter_name, "
//							+ "subchps.id as subchapterId, subchps.subchapter_title, subchps.subchapter_content, sbchsec.id as subchaptersecid, sbchsec.subchapter_id, sbchsec.subchaptersection_no, \r\n"
//							+ "sbchsec.subchaptersection_title, sbchsec.subchaptersection_content, tblsbchsbsec.id as sbchpsecsubsecid, tblsbchsbsec.subchaptersubsection_content,"
//							+ " tblsbchsbsec.subchaptersubsection_title, tblsbchsbsbsec.id as sbchpsbsbsecId, tblsbchsbsbsec.subchaptersubsubsection_title, tblsbchsbsbsec.subchaptersubsubsection_content "
//							+ "from tblsubchapterssubsubsections tblsbchsbsbsec left join tblsubchapterssubsections tblsbchsbsec on tblsbchsbsbsec.subchaptersubsection_id = tblsbchsbsec.id \r\n"
//							+ " left join tblsubchaptersections sbchsec on tblsbchsbsec.subchaptersection_id = sbchsec.id left join tblsubchapters subchps on "
//							+ "sbchsec.subchapter_id = subchps.id left join tblchapters chps on subchps.chapter_id = chps.id left join tblbooks bks on \r\n"
//							+ "chps.book_id = bks.id sbchsec.id = " + subchaptersection_no
//							+ " and chps.id = subchps.chapter_id where chps.id is not null "
//							+ "order by chps.sequence, tblsbchsbsec.id, tblsbchsbsbsec.id;";

					rs = st.executeQuery(sql);
					if (rs.next()) {
						state_Id = rs.getInt("stateId");
						bookId = rs.getInt("book_id");
						chapterId = rs.getInt("chapterId");
						regionName = rs.getString("book_region");
						resultSetAsJson = convertToJSON(rs);
					}
				}
				chapterList = getChaptersList(request, response, bookId, state_Id, chapterId);
				session.setAttribute("selectedRegionId", regionName);
				session.setAttribute("selectedStateId", state_Id);
				session.setAttribute("selectedBookId", bookId);
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
		}
		session.setAttribute("resultSetAsJson", resultSetAsJson);
		session.setAttribute("chapterList", chapterList);
		logger.debug("resultSetAsJson and chapterListAsJson from showSectionDetailsForNode");
		session.setAttribute("flag", "false");
		//System.out.println("resultSetAsJson-->" + resultSetAsJson);
		outputJsonObj.put("outputPage", "ChapterView"); // outputJsonObj.put("outputPage", "book_details");
		return outputJsonObj.toString();
		// return "ChapterView";
	}

}