
<cfscript>
/**
* Returns the content enclosed in a tag pair.
* 
* @param tag      The tag to look for. Should be passed without < or > and without attributes. (Required)
* @param string      The string to search. (Required)
* @return Returns a string. 
* @author Johan Steenkamp (johan@orbital.co.nz) 
* @version 1, September 16, 2002 
*/
function getTagContent(tag,str) {
    var matchStruct = structNew();
    var startTag = "<#tag#[^>]*>";
    var endTag = "</#tag#>";
    var endTagStart = 0;
    matchStruct = REFindNoCase(startTag,str,1,"true");
    if(matchStruct.len[1] eq 0 ) return ""; 
    endTagStart = REFindNoCase(endTag,str,matchStruct.pos[1],"false");
    return Mid(str,matchStruct.pos[1]+matchStruct.len[1],endTagStart-matchStruct.pos[1]-matchStruct.len[1]);
}
</cfscript>

<cfscript>
/**
* @param stripmode      A string, disallow or allow. Specifies if the list of tags in the mytags attribute is a list of tags to allow or disallow. (Required)
* @param mytags      List of tags to either allow or disallow. (Required)
* @param mystring      The string to check. (Required)
* @param findonly      Boolean value. If true, returns the first match. If false, all instances are replaced. (Optional)
* @return Returns either a string or the first instance of a match. 
*/
function getSplashTag(stripmode,mytags,mystring) {
    var spanquotes = "([^"">]*""[^""]*"")*";
    var spanstart = "[[:space:]]*/?[[:space:]]*";
    var endstring = "[^>$]*?(>|$)";
    var x = 1;
    var currenttag = structNew();
    var subex = "";
    var findonly = false;
    var cfversion = iif(structKeyExists(GetFunctionList(),"getPageContext"), 6, 5);
    var backref = "\\1"; // this backreference works in cf 5 but not cf mx
    var rexlimit = len(mystring);

    if (arraylen(arguments) gt 3) { findonly = arguments[4]; }
    if (cfversion gt 5) { backref = "\#backref#"; } // fix backreference for mx and later cf versions
    else { rexlimit = 19000; } // limit regular expression searches to 19000 characters to support CF 5 regex character limit

    if (len(trim(mystring))) {
        // initialize defaults for examining this string
        currenttag.pos = ListToArray("0");
        currenttag.len = ListToArray("0");

        mytags = ArrayToList(ListToArray(mytags)); // remove any empty items in the list
        if (len(trim(mytags))) {
            // turn the comma delimited list of tags with * as a wildcard into a regular expression
            mytags = REReplace(mytags,"[[:space:]]","","ALL");
            mytags = REReplace(mytags,"([[:punct:]])",backref,"ALL");
            mytags = Replace(mytags,"\*","[^$>[:space:]]*","ALL");
            mytags = Replace(mytags,"\,","[$>[:space:]]|","ALL");
            mytags = "#mytags#[$>[:space:]]";
        } else { mytags = "$"; } // set the tag list to end of string to evaluate the "allow nothing" condition

        // loop over the string
        for (x = 1; x gt 0 and x lt len(mystring); x = x + currenttag.pos[1] + currenttag.len[1] -1)
        { 
            // find the next tag within rexlimit characters of the starting point
            currenttag = REFind("<#spanquotes##endstring#",mid(mystring,x,rexlimit),1,true); 
            if (currenttag.pos[1])
            { 
                // if a tag was found, compare it to the regular expression
                subex = mid(mystring,x + currenttag.pos[1] -1,currenttag.len[1]); 
                if (stripmode is "allow" XOR REFindNoCase("^<#spanstart#(#mytags#)",subex,1,false) eq 1)
                {
                    if (findonly) { return subex; } // return invalid tag as an error message
                    else { // remove the invalid tag from the string
                        myString = RemoveChars(myString,x + currenttag.pos[1] -1,currenttag.len[1]);
                        currenttag.len[1] = 0; // set the length of the tag string found to zero because it was removed
                    }
                }
            }
            // no tag was found within rexlimit characters
            // move to the next block of rexlimit characters -- CF 5 regex limitation
            else { currenttag.pos[1] = rexlimit; }
        }
    }
    if (findonly) { return ""; } // return an empty string indicating no invalid tags found
    else { return mystring; } // return the new string discluding any invalid tags
}
</cfscript>

<!---
QueryTreeSort takes a query and efficiently (O(n)) resorts it hierarchically (parent-child), adding a Depth column that can then be used when displaying the data.

@param stuff      Query to sort. (Required)
@param parentid      Column containing parent id. Defaults to parentid. (Optional)
@param itemid      Column containing ID value. Defaults to itemid. (Optional)
@param basedepth      Base depth of data. Defaults to 0. (Optional)
@param depthname      Name for new column to use for depth. Defaults to TreeDepth. (Optional)
@return Returns a query. 
@author Rick Osborne (deliver8r@gmail.com) 
@version 1, April 9, 2007 
--->
<cffunction name="queryTreeSort" returntype="query" output="No">
    <cfargument name="Stuff" type="query" required="Yes">
    <cfargument name="ParentID" type="string" required="No" default="ParentID">
    <cfargument name="ItemID" type="string" required="No" default="ID">
    <cfargument name="BaseDepth" type="numeric" required="No" default="0">
    <cfargument name="DepthName" type="string" required="No" default="node">
    <cfset var RowFromID=StructNew()>
    <cfset var ChildrenFromID=StructNew()>
    <cfset var RootItems=ArrayNew(1)>
    <cfset var Depth=ArrayNew(1)>
    <cfset var ThisID=0>
    <cfset var ThisDepth=0>
    <cfset var RowID=0>
    <cfset var ChildrenIDs="">
    <cfset var ColName="">
    <cfset var Ret=QueryNew(ListAppend(Stuff.ColumnList,Arguments.DepthName))>
    <!--- Set up all of our indexing --->
    <cfloop query="Stuff">
        <cfset RowFromID[Stuff[Arguments.ItemID][Stuff.CurrentRow]]=CurrentRow>
        <cfif NOT StructKeyExists(ChildrenFromID, Stuff[Arguments.ParentID][Stuff.CurrentRow])>
            <cfset ChildrenFromID[Stuff[Arguments.ParentID][Stuff.CurrentRow]]=ArrayNew(1)>
        </cfif>
        <cfset ArrayAppend(ChildrenFromID[Stuff[Arguments.ParentID][Stuff.CurrentRow]], Stuff[Arguments.ItemID][Stuff.CurrentRow])>
    </cfloop>
    <!--- Find parents without rows --->
    <cfloop query="Stuff">
        <cfif NOT StructKeyExists(RowFromID, Stuff[Arguments.ParentID][Stuff.CurrentRow])>
            <cfset ArrayAppend(RootItems, Stuff[Arguments.ItemID][Stuff.CurrentRow])>
            <cfset ArrayAppend(Depth, Arguments.BaseDepth)>
        </cfif>
    </cfloop>
    <!--- Do the deed --->
    <cfloop condition="ArrayLen(RootItems) GT 0">
        <cfset ThisID=RootItems[1]>
        <cfset ArrayDeleteAt(RootItems, 1)>
        <cfset ThisDepth=Depth[1]>
        <cfset ArrayDeleteAt(Depth, 1)>
        <cfif StructKeyExists(RowFromID, ThisID)>
            <!--- Add this row to the query --->
            <cfset RowID=RowFromID[ThisID]>
            <cfset QueryAddRow(Ret)>
            <cfset QuerySetCell(Ret, Arguments.DepthName, ThisDepth+1)>
            <cfloop list="#Stuff.ColumnList#" index="ColName">
                <cfset QuerySetCell(Ret, ColName, Stuff[ColName][RowID])>
            </cfloop>
        </cfif>
        <cfif StructKeyExists(ChildrenFromID, ThisID)>
            <!--- Push children into the stack --->
            <cfset ChildrenIDs=ChildrenFromID[ThisID]>
            <cfloop from="#ArrayLen(ChildrenIDs)#" to="1" step="-1" index="i">
                <cfset ArrayPrepend(RootItems, ChildrenIDs[i])>
                <cfset ArrayPrepend(Depth, ThisDepth + 1)>
            </cfloop>
        </cfif>
    </cfloop>
    <cfreturn Ret>
</cffunction>


<cffunction name="textile" output="false" returntype="string" hint="Converts plain text to html using textile formatting.">
	<cfargument name="text" type="string" required="true">
	<cfset var html = "">
	<cfset var inUL = false>
	<cfset var inOL = false>
	<cfset var inP = false>
	<cfset var inTable = false>
	<cfset var index = 0>
	<cfset var val = "">
	<cfset var lines = ListLen(arguments.text, Chr(10))>
	<cfset var lineArray = ArrayNew(1)>
	<cfset var line = 1>
	
	<!--- remove all \r's so we just have \n ended lines --->
	<cfset arguments.text = Replace(arguments.text, Chr(13), "", "ALL")>
	<cfif NOT Len(Trim(arguments.text))><cfreturn arguments.text></cfif>
	<cfset ArrayResize(lineArray, lines)>
	<cfset lineArray[line] = "">
	<!--- loop through the text and build a line array --->
	<cfloop from="1" to="#Len(text)#" index="c">
		<cfset index = index + 1>
		<cfset c = Mid(text, c, 1)>
		<cfif c IS Chr(10)>
			<cfset line = line + 1>
			<cfset lineArray[line] = "">
		<cfelse>
			<cfset lineArray[line] = lineArray[line] & c>
		</cfif>
	</cfloop>
	<cfset lines = ArrayLen(lineArray)>
	<!--- loop through again! arrg! it would be nice if I could just
		loop through the text as a list with a \n delimiter but I can't
		since blank lines wouldn't show up.
		Additionally it is much easer to parse line by line, rather than 
		char by char. This is my reasoning for the 2N execution time.
		--->
	<cfloop from="1" to="#lines#" index="index">
		<cfset line = Trim(lineArray[index])>
		<cfif Left(line, 1) IS "*">
			<cfset line = " <li>" & Mid(line, 2, Len(line)-1) & "</li>">
			<cfif NOT inUL>
				<cfset line = "<ul>" & Chr(10) & line>
				<cfset inUL = true>
			<cfelse>
				<cfif index+1 GT lines  OR NOT Len(lineArray[index+1])>
					<cfset line = line & Chr(10) & "</ul>">
					<cfset inUL = false>
				</cfif>
			</cfif>
		<cfelseif Left(line, 1) IS "##">
			<cfset line = " <li>" & Mid(line, 2, Len(line)-1) & "</li>">
			<cfif NOT inUL>
				<cfset line = "<ol>" & Chr(10) & line>
				<cfset inUL = true>
			<cfelse>
				<cfif index+1 GT lines  OR NOT Len(Trim(lineArray[index+1]))>
					<cfset line = line & Chr(10) & "</ol>">
					<cfset inUL = false>
				</cfif>
			</cfif>
		<cfelseif inUL OR inOL>
			<!--- for any list items that may have had a line break --->
			<cfif Len(line)>
				<cfset html = Left(html, Len(html)-6) & " ">
				<cfset line = line & "</li>">
			</cfif>
		<cfelseif Left(line, 1) IS "|">
			<cfif NOT inTable>
				<cfset html = html & "<table>" & Chr(10)>
				<cfset inTable = true>
			</cfif>
			<cfset html = html & " <tr>" & Chr(10)>
			<cfloop list="#line#" index="val" delimiters="|">
				<cfset html = html & "  <td>" & val & "</td>" & Chr(10)>
			</cfloop>
			<cfset line = " </tr>">
			<cfif index IS lines OR Left(Trim(lineArray[index+1]), 1) IS NOT "|">
				<cfset line = line & Chr(10) & "</table>">
				<cfset inTable = false>
			</cfif>
		<cfelseif ReFind("h[0-9]\.", Left(line, 3))>
			<cfset val = Mid(line, 2, 1)>
			<cfset line = "<h" & val & ">" & Trim(Mid(line, 4, Len(line)-3)) & "</h" & val & ">">
		<cfelseif Left(line, 3) IS "bq.">
			<cfset line = "<blockquote>" & Mid(line, 4, Len(line)-3) &  "</blockquote>">
		<cfelseif Len(line) AND (index EQ 1 OR NOT Len(Trim(lineArray[index-1])))>
				<cfset line = "<p>" & line>
				<cfset inP = true>
				<cfif index+1 GT lines OR NOT Len(Trim(lineArray[index+1]))>
					<cfset line = line & "</p>">
					<cfset inP = false>
				<cfelse>
					<cfset line = line & "<br />">
				</cfif>
		<cfelseif inP AND (index+1 GT lines OR NOT Len(Trim(lineArray[index+1])))>
			<cfset line = line & "</p>">
			<cfset inP = false>
		<cfelseif Len(line) AND index NEQ lines AND Len(Trim(lineArray[index+1]))>
			<!--- just a line break --->
			<cfset line = line & "<br />">
		</cfif>
		<cfset html = html & line & Chr(10)>
	</cfloop>
	
	<cfset html = ReReplace(html, "_([^<]+)_","<em>\1</em>","all")>
	<cfset html = ReReplace(html, "\*([^<]+)\*","<strong>\1</strong>","all")>
	<cfset html = ReReplace(html, "\?\?([^<]+)\?\?","<cite>\1</cite>","all")>
	<cfset html = ReReplace(html, "-([^<]+)-","<strike>\1</strike>","all")>
	<cfset html = ReReplace(html, "\+([^<]+)\+","<ins>\1</ins>","all")>
	<cfset html = ReReplace(html, "\^([^<]+)\^","<sup>\1</sup>","all")>
	<cfset html = ReReplace(html, "~([^<]+)~","<sub>\1</sub>","all")>
	<cfset html = ReReplace(html, "\!(http[^ ]+)!", "<img src=""\1"" alt="""" />", "all")>
	<cfset html = ReReplace(html, """([^""]+)"" *: *(http[^< ]+)", "<a href=""\2"">\1</a>", "all")>
	<cfset html = ReReplace(html, "([^""])(https?://[^< ]+)", "\1<a href=""\2"">\2</a>", "all")>
	
	<cfreturn html>
</cffunction>