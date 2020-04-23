<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import var="data" charEncoding="utf-8" url="https://min-api.cryptocompare.com/data/price?fsym=${ param.fsym }&tsyms=${ param.tsyms }"/>

${ data }

