<%@ taglib uri="/tags/jstl-c" prefix="c"%>

<html>

	<%
		String combinedImagesLocation = request.getScheme() + "://"
				+ request.getServerName()
				+ session.getAttribute("combinedimagesurl");
		if (combinedImagesLocation == null)
			combinedImagesLocation = "";
		String requestedUrl = (String) session.getAttribute("requestedUrl");
		System.out.println("combinedImagesLocation in Header.jsp : "
				+ combinedImagesLocation);
	%>

	<head>
		<meta http-equiv="Content-Language" content="en-us">
		<meta http-equiv="Content-Type"
			content="text/html; charset=windows-1252">
		<title>Cisco Service Contract Center</title>
		<script>
function goDistribution(distributionURL)
{
window.open(distributionURL, 'DistributionURL', "width=992, height=625, scrollbars=yes, resizable=1");
}

function buttonFocus(){
document.getElementById('ok').focus();
}

</script>


	</head>

	<body style="font-family: Arial" onload="javascript:buttonFocus();">

		<table align="center" border="0">
			<tr valign="middle">
				<td>
					<IMG height=73 alt="Cisco Systems"
						src="<%=combinedImagesLocation%>images/cscc/logo.gif" width=110
						border=0 align=middle>
				</td>
				<td>
					<font size="5" color="#669999">Cisco Service Contract Center</font>
				</td>
			</tr>
		</table>
		<p>
			&nbsp;
		</p>

		</font>

		<center>
			<table border="0" cellspacing="0" cellpadding="0" align="center">
				<colgroup>
					<col width="100" />
					<col width="20" />
					<col width="800" />
				</colgroup>
				<tbody>
					<tr>
						<td align="" colspan="3">
						</td>
						<font size="3" color="#669999">By Using this Web Ordering
							Tool,partner acknowledges and agrees that</font>
						<td>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center" valign="top">
							<img
								src="<%=combinedImagesLocation%>images/cscc/icn_black_plus.gif"
								height="6" width="6" align="absmiddle" border="0" />
						</td>
						<td>
							<!-- <font size="3" color="#669999">Distributor's use of this
								tool is subject to its distribution agreement, as applicable. </font> -->
									<font size="3" color="#669999">Partner's use of this tool is subject to its ICPA or distributor's use of this tool is subject to its distribution agreement, as applicable. </font>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center" valign="top">
							<img
								src="<%=combinedImagesLocation%>images/cscc/icn_black_plus.gif"
								height="6" width="6" align="absmiddle" border="0" />
						</td>
						<td>
							<!-- <font size="3" color="#669999">Partner, if applicable, has
								received express authorization from the end user customer to
								sell the services <br>to such customer, that partner seeks
								through this tool. </font> -->
								<font size="3" color="#669999"> Partner has a valid, existing indirect channel partner agreement ("ICPA") with Cisco or distributor has a  valid, existing distribution agreement with Cisco, as applicable. </font>
								
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center" valign="top">
							<img
								src="<%=combinedImagesLocation%>images/cscc/icn_black_plus.gif"
								height="6" width="6" align="absmiddle" border="0" />
						</td>
						<td>
							<font size="3" color="#669999">Partner, if applicable, 
							has received express authorization from the end user customer to sell the 
							services to such customer, that partner 
							seeks through this tool. </font>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center" valign="top">
							<img
								src="<%=combinedImagesLocation%>images/cscc/icn_black_plus.gif"
								height="6" width="6" align="absmiddle" border="0" />
						</td>
						<td>
							<font size="3" color="#669999">Distributor, if applicable,
								has received express authorization from the partner to sell the
								services to such authorized partner, that distributor
								seeks to quote through this tool. </font> 
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center" valign="top">
							<img
								src="<%=combinedImagesLocation%>images/cscc/icn_black_plus.gif"
								height="6" width="6" align="absmiddle" border="0" />
						</td>
						<td>
							<font size="3" color="#669999">Cisco retains the right to
								suspend or terminate partner's access to this tool at any time;
								and </font>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center" valign="top">
							<img
								src="<%=combinedImagesLocation%>images/cscc/icn_black_plus.gif"
								height="6" width="6" align="absmiddle" border="0" />
						</td>
						<td>
							<font size="3" color="#669999">Cisco retains the right to
								enforce the <a
								href="javascript:goDistribution('<c:out value="${distiInspectReqPath}"/>')">Inspection
									& Licensing Requirement</a> for <a
								href="javascript:goDistribution('<c:out value="${distiSecondaryProductsPath}"/>')">Secondary
									Market Products</a>. </font>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						</td>
						<td>

						</td>
					</tr>
					<tr height="10">
						<td></td>
						<td>
						</td>
						<td>

						</td>
					</tr>
					<tr>
						<td colspan="3">
							<font size="3" color="#669999">Please note:</font>
						</td>
						<td>
						</td>
						<td>

						</td>
					</tr>
					<tr>
						<td colspan="3">
							<font size="3" color="#669999">Submitting an electronic
								purchase order in CSCC requires you to sign an <a
								href="javascript:goDistribution('<c:out value="${distiInternetCommerceAgreePath}"/>')">Internet
									Commerce Agreement</a>
							</font>
						</td>
						<td>
						</td>
						<td>

						</td>
					</tr>

				</tbody>
			</table>
		</center>

		<p>
		</p>
		<center>
			<table border="0" cellspacing="0" cellpadding="0" id="button_ok"
				style="padding: 0; margin: 4px 4px; height: 20px; vertical-align: top; border: none; float: center;"
				align="center">
				<tr>
					<td class="button_left"
						style="background-image: url('<%=combinedImagesLocation%>images/global/buttons_and_icons/buttons/btn_primary_lf.gif'); background-repeat: no-repeat; cursor: pointer; width: 12px"
						onclick="document.getElementById('ok').click();"></td>
					<td>
						<input id="ok"
							style="color:; font-size: 	11px; font-family: Arial, Helvetica, sans-serif; font-weight: bold; background-image: url('<%=combinedImagesLocation%>images/global/buttons_and_icons/buttons/btn_primary_md.gif'); background-repeat: repeat-x; white-space: nowrap; cursor: pointer; margin: 0; padding: 0 1px; width: 100%; height: 20px; border: none"
							size="50" type="button" name="ok"
							onclick="javascript:self.close();"
							value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
					</td>
					<td
						style="background-image: url('<%=combinedImagesLocation%>images/global/buttons_and_icons/buttons/btn_primary_rt.gif'); background-repeat: no-repeat; cursor: pointer; width: 12px"
						onclick="document.getElementById('ok').click();"></td>
				</tr>
			</table>
		</center>
	</body>

</html>
