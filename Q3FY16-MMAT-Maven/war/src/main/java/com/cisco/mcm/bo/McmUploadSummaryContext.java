/*
 * Created on Dec 5, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.bo;

import java.util.ArrayList;
import java.util.List;

import com.cisco.servicesales.list.EnhancedList;
import com.cisco.servicesales.list.ListFactory;
import com.cisco.servicesales.list.Paginator;
import com.cisco.servicesales.list.engine.Column;

/**
 * @author jbathula
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class McmUploadSummaryContext {
    protected static final int DEFAULT_ITEMS_PER_PAGE = 25;
    private static final String UPLOAD_SUMMARY = "upload.summary";
    private static final String UPLOAD_SUMMARY_PROXY = "upload.summary.proxy";

    private int itemsPerPage;

    private List displayColumns;
    private McmListControllerBO listController;
    private String username;
    private static final String REQUEST_NUMBER = "upldRequestId";

    //TD2492;saatmaku;17 oct 2007;start;removed solcatId in the array below.
    //TD5082;start;alonikar;13 jul 2007;Added solcatId in the array below.
    private static final String columnDisplayOrder[] = { "requestDate",
	REQUEST_NUMBER, "requestName", "upldDefinitionDesc",
    "bizLatestStatus" };


    private boolean proxyMode = false;
    private String proxyUser;

    /**
     * @param username
     * @param viewAll
     */
    public McmUploadSummaryContext(final String username, final boolean viewAll) {
	this(username, viewAll, DEFAULT_ITEMS_PER_PAGE);
    }

    /**
     *
     * @param username
     * @param viewAll
     * @param itemsPerPage
     */
    public McmUploadSummaryContext(final String username,
	    final boolean viewAll, final int itemsPerPage) {
	this.itemsPerPage = itemsPerPage;
	this.username = username;
	EnhancedList enhancedList = null;
	if (viewAll) {
	    enhancedList = ListFactory.getList(UPLOAD_SUMMARY, username);
	    this.proxyMode = false;
	    this.proxyUser = null;
	} else {
	    enhancedList = ListFactory.getList(UPLOAD_SUMMARY_PROXY, username);
	    this.proxyMode = true;
	    this.proxyUser = username;
	}

	enhancedList.sort(REQUEST_NUMBER);
	enhancedList.sort(REQUEST_NUMBER);
	Paginator paginator = enhancedList.getPaginator(itemsPerPage);

	displayColumns = new ArrayList();
	List _displayColumns = enhancedList.getVisibleColumns();
	for (int i = 0; i < columnDisplayOrder.length; i++) {
	    String aColumn = columnDisplayOrder[i];
	    displayColumns.add(findColumn(_displayColumns, aColumn));
	}

	this.listController = new McmListControllerBO(enhancedList, paginator);
    }

    /**
     * @param displayColumns
     * @param aColumnName
     * @return
     */
    private static Column findColumn(final List displayColumns,
	    final String aColumnName) {
	for (int i = 0; i < displayColumns.size(); i++) {
	    final Column displayColumn = (Column) displayColumns.get(i);
	    if (displayColumn.getName().equals(aColumnName))
		return displayColumn;
	}

	return null;
    }

    /**
     * @return
     */
    public Paginator getPaginator() {
	return listController.getPaginator();
    }

    /**
     * @return
     */
    public EnhancedList getEnhancedList() {
	return listController.getEnhancedList();
    }

    /**
     * @return
     */
    public McmListControllerBO getListController() {
	return listController;
    }

    /**
     * @return
     */
    public List getDisplayColumns() {
	return displayColumns;
    }

    /**
     * @return
     */
    public boolean isProxyMode() {
	return this.proxyMode;
    }

    /**
     * @return
     */
    public String getProxyUser() {
	return this.proxyUser;
    }

}
