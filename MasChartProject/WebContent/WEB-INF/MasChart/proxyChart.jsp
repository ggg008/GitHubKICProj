<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import var="data" charEncoding="utf-8" url="https://min-api.cryptocompare.com/data/v2/${ param.historyTime }?fsym=${ param.fsym }&tsym=${ param.tsym }&limit=2000"/>

${ data }

