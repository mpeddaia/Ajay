/*
 * Created on Dec 4, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.bo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.cisco.mcm.action.McmReportsAction;
import com.cisco.servicesales.list.EnhancedList;
import com.cisco.servicesales.list.Filter;
import com.cisco.servicesales.list.Paginator;

/**
 * @author kiguntup
 * 
 */
public class McmListControllerBO {

    public static final String EVENT = "event";
    public static final String PAGE_NEXT = "pagenext";
    public static final String PAGE_PREVIOUS = "pageprevious";
    public static final String PAGE_FIRST = "pagefirst";
    public static final String PAGE_LAST = "pagelast";
    public static final String PAGE_SPECIFIC = "pagespecific";
    private static final String PAGE_NUMBER = "pagenumber";

    private static final String SORT = "sort";
    private static final String SORT_COLUMN = "sortcolumn";

    private static final String FILTER = "filter";
    private static final String FILTER_COLUMN = "filtercolumn";
    private static final String FILTER_VALUE = "filtervalue";
    private static final String FILTER_OPERATOR = "filterop";
    private static final String CLEAR_FILTER = "clearfilter";

    private EnhancedList list;
    private Paginator listPaginator;
    private static final String REQUEST_DATE = "requestDate";
    private static final int EQUAL = 0;
    private static final int CONTAINS = 8;

    private static Logger logger = Logger.getLogger(McmListControllerBO.class); //  added by amalekar as part of Q1FY15 , in order to fix critical issue.
    
    /**
     * @param list
     * @param listPaginator
     */
    public McmListControllerBO(EnhancedList list, Paginator listPaginator) {
	this.list = list;
	this.listPaginator = listPaginator;
    }

    /**
     * @param request
     * @return
     */
    public boolean processListEvents(final HttpServletRequest request) {
	return nextPage(request) || previousPage(request) || firstPage(request)
		|| lastPage(request) || specificPage(request) || sort(request)
		|| filter(request) || clearAllfilters(request);
    }

    /**
     * @param request
     * @return
     */
    public boolean nextPage(final HttpServletRequest request) {
	if (!hasOccured(request, PAGE_NEXT))
	    return false;

	listPaginator.next();
	return true;
    }

    /**
     * @param request
     * @return
     */
    public boolean previousPage(final HttpServletRequest request) {
	if (!hasOccured(request, PAGE_PREVIOUS))
	    return false;

	listPaginator.previous();
	return true;
    }

    /**
     * @param request
     * @return
     */
    public boolean firstPage(final HttpServletRequest request) {
	if (!hasOccured(request, PAGE_FIRST))
	    return false;

	listPaginator.first();
	return true;
    }

    /**
     * @param request
     * @return
     */
    public boolean lastPage(final HttpServletRequest request) {
	if (!hasOccured(request, PAGE_LAST))
	    return false;

	listPaginator.last();
	return true;
    }

    /**
     * @param request
     * @return
     */
    public boolean specificPage(final HttpServletRequest request) {
	if (!hasOccured(request, PAGE_SPECIFIC))
	    return false;

	try {
	    final int pageNumber = Integer.parseInt(request
		    .getParameter(PAGE_NUMBER));
	    listPaginator.getPage(pageNumber);
	} catch (NumberFormatException e) {
	    System.err.println("Incorrect Page Number Submitted by Page as "
		    + request.getParameter(PAGE_NUMBER));
	    //e.printStackTrace();
	    logger.error("McmListControllerBO : specificPage : NumberFormatException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	}

	return true;
    }

    /**
     * @param request
     * @return
     */
    public boolean sort(final HttpServletRequest request) {
	if (!hasOccured(request, SORT))
	    return false;

	final String sortColumn = request.getParameter(SORT_COLUMN);
	if (sortColumn == null)
	    System.err.println("Sort Event Received but sort column is null");
	else
	    list.sort(sortColumn);

	return true;
    }

    /**
     * @param request
     * @return
     */
    public boolean filter(final HttpServletRequest request) {
	if (!hasOccured(request, FILTER))
	    return false;

	try {
	    final String filterColumn = request.getParameter(FILTER_COLUMN);
	    String filterValue = request.getParameter(FILTER_VALUE);
	    int filterOperator = Integer.parseInt(request
		    .getParameter(FILTER_OPERATOR));
	    if (filterColumn == null)
		System.err
			.println("Filter Event Received but filter column is null under key "
				+ FILTER_COLUMN);
	    else if (filterValue == null)
		System.err
			.println("Filter Event Received but filter value is null under key "
				+ FILTER_VALUE);
	    else {
		// Move to first added by gpotnis. this will always move the
		// pointer to first page before applying any filter
		// This was done to resolve the following issue.
		// If user is on any other page other than first and applies any
		// filter. The rerturned list may have few records
		// which fit in 1 page (eg. less than 25 ) and would not be
		// visibile on the page where user was on before.
		// In this situation user can not see any records ont he page
		// and these is no pagination bar too.

		listPaginator.first();

		/*
		 * Adding following logic for Date comparision. If the user
		 * wants the filter operator to be "Equal" for the date we do
		 * not get the exact date and time from the calender and the
		 * query fails. Hence treat the "Equals" operator same as
		 * "Contains"
		 */
		if (filterColumn.equalsIgnoreCase(REQUEST_DATE)
			&& filterOperator == EQUAL)
		    filterOperator = CONTAINS;
		if (filterColumn.equalsIgnoreCase(REQUEST_DATE)) {

		    // String x=filterValue.trim();
		    SimpleDateFormat sdfInput = new SimpleDateFormat(
			    "dd-MMM-yyyy");
		    SimpleDateFormat sdfOutput = new SimpleDateFormat(
			    "MM/dd/yyyy");
		    String textDate = filterValue.trim();

		    Date date = sdfInput.parse(textDate);
		    String y = sdfOutput.format(date);

		    filterValue = y;

		} else {
		    filterValue = filterValue.trim();
		}

		list.andFilter(new Filter(filterColumn, filterValue,
			filterOperator));
	    }
	} catch (NumberFormatException e) {
	    System.err
		    .println("Filter Event Received but filter operator is null under key "
			    + FILTER_OPERATOR);
	    //e.printStackTrace(); // original code
	    logger.error("McmListControllerBO : filter : NumberFormatException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	} catch (ParseException e) {
	    System.err.println("Parse Exception while parsing the date");
	    //e.printStackTrace(); // original code
	    logger.error("McmListControllerBO : filter : ParseException  : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	}

	return true;
    }

    /**
     * Clears all applied filters
     * 
     * @param request
     * @return
     */
    private boolean clearAllfilters(HttpServletRequest request) {
	if (!hasOccured(request, CLEAR_FILTER))
	    return false;

	list.clearAllFilters();

	return true;
    }

    /**
     * @param request
     * @param event
     * @return
     */
    private static boolean hasOccured(final HttpServletRequest request,
	    final String event) {
	final String eventOccured = request.getParameter(EVENT);

	return (eventOccured != null) && (eventOccured.equalsIgnoreCase(event));
    }

    /**
     * @return
     */
    public EnhancedList getEnhancedList() {
	return list;
    }

    /**
     * @return
     */
    public Paginator getPaginator() {
	return listPaginator;
    }
}
