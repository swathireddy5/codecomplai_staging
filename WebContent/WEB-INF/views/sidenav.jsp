<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<div class="vertical-menu">

                <div data-simplebar class="h-100">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled" id="side-menu">
                            <li class="menu-title">Menu</li>

                            <li>
                                <a href="viewProjects" class="waves-effect mm-active">
                                    <i class="ri-dashboard-line"></i><span class="badge rounded-pill bg-success float-end"><c:out value="${fn:length(projectList)}" /></span>
                                    <span>Projects</span>
                                </a>
                            </li>

                            <li>
                                <a href="codes?statename=${selectedState}" class=" waves-effect">
                                    <i class=" ri-building-2-line"></i>
                                    <span>Codes</span>
                                </a>
                            </li>

                            <li>
                                <a href="#" class=" waves-effect">
                                    <i class=" ri-pencil-ruler-2-line"></i>
                                    <span>Diagrams</span>
                                </a>
                            </li>
							<li>
                                <a href="viewBookmarks?userId=${userId}" class=" waves-effect">
                                    <i class="ri-bookmark-3-line"></i>
                                    <span>Bookmarks</span>
                                </a>
                            </li>
							<li>
                                <a href="viewComments?userId=${userId}" class=" waves-effect">
                                    <i class="ri-chat-1-line"></i>
                                    <span>Comments</span>
                                </a>
                            </li>

                            
<!--
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="ri-mail-send-line"></i>
                                    <span>Email</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="email-inbox.html">Inbox</a></li>
                                    <li><a href="email-read.html">Read Email</a></li>
                                </ul>
                            </li>
-->

                            

                            

                            <li class="menu-title">Manage Account</li>

                       		<li>
                                <a href="updateProfile" class=" waves-effect">
                                    <i class=" ri-user-settings-line"></i>
                                    <span>Update Profile</span>
                                </a>
                            </li>
							
							<li>
                                <a href="changePassword" class=" waves-effect">
                                    <i class="ri-lock-password-line"></i>
                                    <span>Change Password</span>
                                </a>
                            </li>

                          

                        </ul>
                    </div>
                    <!-- Sidebar -->
                </div>
            </div>