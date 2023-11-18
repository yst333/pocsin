<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<body>

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="/" class="logo">
              <img src="/resources/images/logo.svg" alt="" style="max-width: 112px;">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"><a href="/pages/about" class="active">About</a></li>
              <li class="scroll-to-section"><a href="/wfflabboard/list">WffLab</a></li>
              <li class="scroll-to-section"><a href="/pages/faq">FAQs</a></li>
              <li class="has-sub">
                <a href="javascript:void(0)">Board</a>
                <ul class="sub-menu">
                  <li><a href="#">Notice</a></li>
                  <li><a href="#">Community</a></li>
                  <li><a href="/wfflabboard/list">WffLab</a></li>
                </ul>
              </li>
              <li class="has-sub">
                <a href="javascript:void(0)">Mypages</a>
                <ul class="sub-menu">
                  <li><a href="/member/edit">Edit member</a></li>
                  <li><a href="/member/leave">Leave member</a></li>
                </ul>
              </li>
              <!-- 
              <li class="scroll-to-section"><a href="/member/edit">Mypages</a></li>
               -->
              <li><a href="/member/join">Sign up</a></li>
              <c:if test="${member!= null }"><li><a href="/member/logout">logout</a></li></c:if>
              <c:if test="${member== null }"><li><a href="/member/login">login</a></li></c:if>
            </ul>
            <a class='menu-trigger'>
              <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

