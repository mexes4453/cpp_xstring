#include "../inc/xstring.hpp"



int unsigned XSTRING__Split(std::vector<std::string> &vStr, std::string &str,
		                                          char        chr)
{
    std::size_t posCurr = 0;
    std::string strWord;

    vStr.clear();
    while ( (posCurr < std::string::npos) )
    {
        posCurr = str.find( chr );
    	if (posCurr < std::string::npos)
    	{
    		strWord = str.substr(0, posCurr);
    		str = str.substr(posCurr + 1);
    		if (!(strWord.empty()))
    		{
    			vStr.push_back( strWord );
    		}
    	}
    }
    /*>
     * It is possible that the split character does not appears at the end of the
     * input string. This means there are still some characters in the string 
     * after the last split character found in the string. */
    if ( !(str.empty()) )
    {
	    vStr.push_back( str );
    }
    return (vStr.size());
}




void XSTRING__RemoveAllWhiteSpace(std::string &str)
{
    std::istringstream iss(str);
    std::string tmpStr, newStr;

    while(iss >> tmpStr)
    {
        newStr += tmpStr;
    }
    str = newStr;
}




void XSTRING__StripWhiteSpace(std::string &str)
{
    std::string::size_type found = str.find_first_not_of(XSTRING__WHITESPACE_CHARS);

    /* remove all leading whitespace characters */
    if (found != std::string::npos)
    {
    /* update the str to point to the address of found */
        str = str.substr(found);
    }
    else
    {
        str.clear();
    }

    /* remove all trailing whitespace characters */
    if (str.size() > 0)
    {
        found = str.find_last_not_of(XSTRING__WHITESPACE_CHARS);
        if (found != std::string::npos)
        {
            /* Remove the rest of the string that contains whitespace characters */
            str.erase(found + 1);
        }
        else
        {
            str.clear();
        }
    }
}
                                                            
