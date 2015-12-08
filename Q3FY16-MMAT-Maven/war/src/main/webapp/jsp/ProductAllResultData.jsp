<%
	String selectAllDataJson = null;
	if (null != request.getAttribute("selectAllDataJson")) {
		selectAllDataJson = (String) request.getAttribute("selectAllDataJson");
	}
%><%= selectAllDataJson %>